extends "res://ships/ship-ctrl.gd"

onready var attract_area = $Attractor
onready var repel_area = $Repellant
onready var safety_area = $SafetyBuffer

var gravity_mode = "off" # off, attract, repel

func _ready():
	# Initialize dialogue flag
	setConfig("just_timed_out", "false")
	# Ensure fields are off by default
	update_fields()

export var max_duration = 60.0
var active_timer = 0.0

func _process(delta):
	if gravity_mode != "off":
		#Timer logic
		active_timer -= delta
		if active_timer <= 0:
			#Timeout
			orders_set_gravity_off()
			aiImperative = AI.dock
			#Trigger timeout dialogue
			var player = CurrentGame.getPlayerShip()
			if player:
				setConfig("just_timed_out", "true")
				aiStartDialog(player, true) #Force conversation


onready var initial_mass = mass
onready var initial_damp = linear_damp

onready var spotlight = $Spotlight

func update_fields():
	if not attract_area or not repel_area or not safety_area:
		return
	
	#Visuals Setup
	if not spotlight:
		pass

	if gravity_mode == "attract":
		attract_area.space_override = Area2D.SPACE_OVERRIDE_REPLACE
		repel_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		#Safety Buffer On
		safety_area.space_override = Area2D.SPACE_OVERRIDE_REPLACE
		
		#Visuals (Purple)
		if spotlight:
			spotlight.visible = true
			spotlight.enabled = true
			spotlight.color = Color(0.5, 0.0, 1.0)
			if spotlight.has_node("Sprite"):
				spotlight.get_node("Sprite").modulate = Color(0.5, 0.0, 1.0)

		#Lock position
		mass = initial_mass * 100.0
		linear_damp = initial_damp + 10.0
	elif gravity_mode == "repel":
		attract_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		repel_area.space_override = Area2D.SPACE_OVERRIDE_REPLACE
		#Safety Buffer Off
		safety_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		
		#Visuals (Orange)
		if spotlight:
			spotlight.visible = true
			spotlight.enabled = true
			spotlight.color = Color(1.0, 0.4, 0.0)
			if spotlight.has_node("Sprite"):
				spotlight.get_node("Sprite").modulate = Color(1.0, 0.4, 0.0)

		#Lock position
		mass = initial_mass * 100.0
		linear_damp = initial_damp + 10.0
	else:
		attract_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		repel_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		safety_area.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		
		# Visuals: Off
		if spotlight:
			spotlight.visible = false
			spotlight.enabled = false

		#Unlock position
		mass = initial_mass
		linear_damp = initial_damp

#Dialogue Hooks (setConfig)
#Override setConfig to catch "gravity_mode" changes
func setConfig(key, value, c = null):
	if c == null:
		c = shipConfig
	.setConfig(key, value, c)
	
	if key == "gravity_mode":
		match value:
			"attract":
				orders_set_gravity_attract()
			"repel":
				orders_set_gravity_repel()
			"off":
				orders_set_gravity_off()
			"return":
				orders_set_gravity_return()

#Orders
func orders_set_gravity_attract():
	gravity_mode = "attract"
	active_timer = max_duration
	update_fields()
	
func orders_set_gravity_repel():
	gravity_mode = "repel"
	active_timer = max_duration
	update_fields()
	
func orders_set_gravity_off():
	gravity_mode = "off"
	active_timer = 0.0
	update_fields()

func orders_set_gravity_return():
	orders_set_gravity_off()
	aiImperative = AI.dock
