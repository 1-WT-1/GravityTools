extends Node2D


export var repairReplacementPrice = 650000
export var repairReplacementTime = 1
export var repairFixPrice = 52000
export var repairFixTime = 12

export var powerDraw = 500000.0 # 500 MW
export var systemName = "SYSTEM_GRAVITY_GUN"
export var mass = 26000

export var damageWearCapacity = 1800.0
export var damageBentCapacity = 8000.0
export var damageBentThreshold = 450.0
export var damageCoilCapacity = 100000.0
export var damageCoilThreshold = 50.0
export var wearChance = 0.05

export var maxMissalignment = deg2rad(8)
onready var specificMisalignment = (randf() - 0.5) * 2

onready var field = $GravityField
onready var beam = $BeamVisual
onready var beam_mat = beam.material
onready var audio = $AudioFire
onready var glowSprites = [$Coil1/heat, $Coil2/heat]

var glowIntensity = 0.0
export var glowFadeSpeed = 2.0

var firepower = 0.0
var ship
var mount
var key
var slot

var baseGravity = 0.0
var statusCache = 100
var damageCache = []
var chokeCache = 0.0

func getDamageCapacity(type):
	var o = 1
	match type:
		"wear":
			o = damageWearCapacity * ship.getCrewAdjustedJuryRigFactorForSystem(key, type)
		"bent":
			o = damageBentCapacity * ship.getCrewAdjustedJuryRigFactorForSystem(key, type)
		"coil":
			o = damageCoilCapacity * ship.getCrewAdjustedJuryRigFactorForSystem(key, type)
	return o

func getDamage():
	return damageCache

func getChoke():
	return chokeCache

func computeStatus():
	var wear = ship.getSystemDamage(key, "wear") / getDamageCapacity("wear")
	var bent = ship.getSystemDamage(key, "bent") / getDamageCapacity("bent")
	var coil = ship.getSystemDamage(key, "coil") / getDamageCapacity("coil")
	statusCache = clamp(100 - max(max(wear, bent), coil) * 100, 0, 100)
	damageCache = [
		{"type": "bent", "maxRaw": damageBentCapacity, "max": getDamageCapacity("bent"), "current": ship.getSystemDamage(key, "bent"), "name": "DAMAGE_GRAVGUN_BENT"},
		{"type": "wear", "maxRaw": damageWearCapacity, "max": getDamageCapacity("wear"), "current": ship.getSystemDamage(key, "wear"), "name": "DAMAGE_GRAVGUN_WEAR"},
		{"type": "coil", "maxRaw": damageCoilCapacity, "max": getDamageCapacity("coil"), "current": ship.getSystemDamage(key, "coil"), "name": "DAMAGE_GRAVGUN_COIL"},
	]
	chokeCache = pow(ship.getSystemDamage(key, "coil") / getDamageCapacity("coil"), 2)

func applyBend():
	var bend = ship.getSystemDamage(key, "bent") / getDamageCapacity("bent")
	rotation = clamp(specificMisalignment * bend * bend, -maxMissalignment, maxMissalignment)

func _on_impact(power, point, delta):
	var localPoint = point - global_position
	var distance = max(15, localPoint.length())
	
	var bending = max(0, power * 10 / distance - damageBentThreshold * delta * 60.0)
	if bending > 0:
		ship.changeSystemDamage(key, "bent", bending, getDamageCapacity("bent"))
		applyBend()

func _on_emp(power, point, delta):
	var dmg = max(0, power * 2 - damageCoilThreshold * delta * 60)
	if dmg > 0:
		ship.changeSystemDamage(key, "coil", dmg, getDamageCapacity("coil"))

var aged = false
func ageIfNeeded():
	if key and not aged:
		aged = true
		var sd = ship.ageWithSeed + key.hash()
		var dmg = CurrentGame.ageToDamageWithSeed(ship.getAgeYears(), sd, 3, ship.damageLimit)
		ship.changeSystemDamage(key, "coil", float(damageCoilCapacity) * dmg[0], damageCoilCapacity)
		ship.changeSystemDamage(key, "bent", float(damageBentCapacity) * dmg[1], damageBentCapacity)
		ship.changeSystemDamage(key, "wear", float(damageWearCapacity) * dmg[2], damageWearCapacity)

func getSlotName(param):
	return "weaponSlot.%s.%s" % [slot, param]

func getShip():
	mount = self
	var c = self
	while c and not c.has_method("getConfig"):
		if "type" in c:
			mount = c
		c = c.get_parent()
	return c

func _ready():
	ship = getShip()
	var parent = get_parent()
	if "slot" in parent:
		slot = parent.slot
	if "type" in mount:
		key = mount.key
	
	if slot and systemName and ship.getConfig(getSlotName("type")) != systemName:
		Tool.remove(self)
	else:
		Tool.deferCallWhenIdle(self, "computeStatus")
		ship.connect("juryRigChanged", self, "computeStatus")
		ship.connect("juryRigChanged", self, "applyBend")
		ship.connect("damageChanged", self, "computeStatus")
		ship.connect("damageChanged", self, "applyBend")
		ship.connect("damageImpact", self, "_on_impact")
		ship.connect("damageEMP", self, "_on_emp")
		if ship.ageWithSeed:
			Tool.deferCallWhenIdle(self, "ageIfNeeded")
		Tool.deferCallWhenIdle(self, "computeStatus")
	
	baseGravity = field.gravity
	beam_mat.set_shader_param("intensity", 0.0)
	field.space_override = Area2D.SPACE_OVERRIDE_DISABLED
	field.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if field.space_override != Area2D.SPACE_OVERRIDE_DISABLED:
		if body is RigidBody2D and body.sleeping:
			body.sleeping = false

func getPowerDraw():
	return powerDraw / 1000.0 # Return in MW

func shouldFire():
	return ship.powerBalance > powerDraw * 0.1

func getStatus():
	return statusCache

func boresight():
	return {
		"start": global_position,
		"range": 1000.0, # Match the polygon length
		"angle": deg2rad(11.4), # Match the polygon flare
		"direction": global_rotation
	}

func fire(p):
	firepower = clamp(p, 0, 1)

func _physics_process(delta):
	if firepower > 0:
		var energy_needed = powerDraw * delta * firepower
		var energy_got = ship.drawEnergy(energy_needed)
		var ratio = 0.0
		
		if energy_needed > 0:
			ratio = energy_got / energy_needed
		
		if randf() < chokeCache:
			ratio = 0
		
		if ratio > 0.5:
			if randf() < wearChance:
				ship.changeSystemDamage(key, "wear", delta / wearChance, getDamageCapacity("wear"))
			
			# Active
			field.space_override = Area2D.SPACE_OVERRIDE_REPLACE
			#field.gravity_vec = Vector2(0, 1).rotated(global_rotation)
			
			var wearFactor = 1.0 - pow(ship.getSystemDamage(key, "wear") / getDamageCapacity("wear"), 2)
			field.gravity = baseGravity * wearFactor
			
			# Visuals
			beam.visible = true
			beam_mat.set_shader_param("intensity", 0.2 * wearFactor)
			
			if not audio.playing:
				audio.play()
			#audio.pitch_scale = wearFactor
		else:
			# Not enough energy 
			field.space_override = Area2D.SPACE_OVERRIDE_DISABLED
			beam.visible = true
			beam_mat.set_shader_param("intensity", 0.05)
			audio.stop()
			
	else:
		# Not firing
		field.space_override = Area2D.SPACE_OVERRIDE_DISABLED
		beam.visible = false
		beam_mat.set_shader_param("intensity", 0.0)
		audio.stop()

func _process(delta):
	var targetGlow = firepower
	glowIntensity = lerp(glowIntensity, targetGlow, delta * glowFadeSpeed)
	
	for glow in glowSprites:
		glow.modulate.a = glowIntensity
