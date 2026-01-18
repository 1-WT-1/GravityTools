extends Node

const GravityBeaconDock_L = {
	"system": "SYSTEM_GRAVITY_BEACON_DOCK-L",
	"name_override": "SYSTEM_GRAVITY_BEACON",
	"description": "SYSTEM_GRAVITY_BEACON_DESC",
	"specs": "SYSTEM_GRAVITY_BEACON_SPEC",
	"manual": "SYSTEM_GRAVITY_BEACON_MANUAL",
	"price": 150000,
	"slot_type": "HARDPOINT",
	"alignment": "ALIGNMENT_LEFT",
	"equipment_type": "EQUIPMENT_BEACON",
	"test_protocol": "detach",
	"weapon_slot": {
		"path": "res://GravityTools/ships/modules/GravityBeaconDock-L.tscn",
		"data": []
	}
}

const GravityBeaconDock_R = {
	"system": "SYSTEM_GRAVITY_BEACON_DOCK-R",
	"name_override": "SYSTEM_GRAVITY_BEACON",
	"description": "SYSTEM_GRAVITY_BEACON_DESC",
	"specs": "SYSTEM_GRAVITY_BEACON_SPEC",
	"manual": "SYSTEM_GRAVITY_BEACON_MANUAL",
	"price": 150000,
	"slot_type": "HARDPOINT",
	"alignment": "ALIGNMENT_RIGHT",
	"equipment_type": "EQUIPMENT_BEACON",
	"test_protocol": "detach",
	"weapon_slot": {
		"path": "res://GravityTools/ships/modules/GravityBeaconDock-R.tscn",
		"data": [
			{
				"property": "flip",
				"value": "true"
			}
		]
	}
}

const GravityHarpoon = {
	"system": "SYSTEM_GRAVITY_HARPOON",
	"description": "SYSTEM_GRAVITY_HARPOON_DESC",
	"specs": "SYSTEM_GRAVITY_HARPOON_SPEC",
	"manual": "SYSTEM_GRAVITY_HARPOON_MANUAL",
	"price": 65000,
	"slot_type": "HARDPOINT",
	"equipment_type": "EQUIPMENT_MANIPULATION_ARMS",
	"test_protocol": "fire",
	"weapon_slot": {
		"path": "res://GravityTools/weapons/GravityGun.tscn",
		"data": []
	}
}
