#define AIRLOCK_SOUNDPATH(filename) "modular_nova/modules/custom_airlocks/sound/" + ##filename
#define INT_AIRLOCK_SOUNDPATH(filename) AIRLOCK_SOUNDPATH("airlock/" + ##filename)
#define EXT_AIRLOCK_SOUNDPATH(filename) AIRLOCK_SOUNDPATH("external_airlock/" + ##filename)
#define VAULT_SOUNDPATH(filename) AIRLOCK_SOUNDPATH("vault_airlock/" + ##filename)
#define PREFAB_SOUNDPATH(filename) AIRLOCK_SOUNDPATH("colony_prefab/" + ##filename)
#define FIREDOOR_SOUNDPATH(filename) AIRLOCK_SOUNDPATH("fire_door/" + ##filename)

// Bluemoon addition - Custom airlock sounds
/obj/machinery/door/airlock
	var/loud_bolts = FALSE

/obj/machinery/door/airlock
	doorOpen = INT_AIRLOCK_SOUNDPATH("airlock.ogg")
	doorClose = INT_AIRLOCK_SOUNDPATH("airlockclose.ogg")
	boltUp = INT_AIRLOCK_SOUNDPATH("boltsup.ogg")
	boltDown = INT_AIRLOCK_SOUNDPATH("boltsdown.ogg")

/obj/machinery/door/airlock/external
	doorOpen = EXT_AIRLOCK_SOUNDPATH("airlock.ogg")
	doorClose = EXT_AIRLOCK_SOUNDPATH("airlockclose.ogg")
	doorDeni = EXT_AIRLOCK_SOUNDPATH("deniedbeep.ogg")
	forcedOpen = EXT_AIRLOCK_SOUNDPATH("open_force.ogg")
	forcedClosed = EXT_AIRLOCK_SOUNDPATH("close_force.ogg")

/obj/machinery/door/airlock/shuttle
	doorOpen = EXT_AIRLOCK_SOUNDPATH("airlock.ogg")
	doorClose = EXT_AIRLOCK_SOUNDPATH("airlockclose.ogg")
	doorDeni = EXT_AIRLOCK_SOUNDPATH("deniedbeep.ogg")
	forcedOpen = EXT_AIRLOCK_SOUNDPATH("open_force.ogg")
	forcedClosed = EXT_AIRLOCK_SOUNDPATH("close_force.ogg")

/obj/machinery/door/airlock/titanium
	doorOpen = EXT_AIRLOCK_SOUNDPATH("airlock.ogg")
	doorClose = EXT_AIRLOCK_SOUNDPATH("airlockclose.ogg")
	doorDeni = EXT_AIRLOCK_SOUNDPATH("deniedbeep.ogg")
	forcedOpen = EXT_AIRLOCK_SOUNDPATH("open_force.ogg")
	forcedClosed = EXT_AIRLOCK_SOUNDPATH("close_force.ogg")

/obj/machinery/door/airlock/multi_tile
	doorOpen = VAULT_SOUNDPATH("airlock.ogg")
	doorClose = VAULT_SOUNDPATH("airlockclose.ogg")
	forcedOpen = VAULT_SOUNDPATH("open_force.ogg")
	forcedClosed = VAULT_SOUNDPATH("close_force.ogg")

/obj/machinery/door/airlock/vault
	doorOpen = VAULT_SOUNDPATH("airlock.ogg")
	doorClose = VAULT_SOUNDPATH("airlockclose.ogg")
	doorDeni = VAULT_SOUNDPATH("deniedbeep.ogg")
	forcedOpen = VAULT_SOUNDPATH("open_force.ogg")
	forcedClosed = VAULT_SOUNDPATH("close_force.ogg")

/obj/machinery/door/airlock/command
	doorDeni = VAULT_SOUNDPATH("deniedbeep.ogg")

/obj/machinery/door/airlock/security
	doorDeni = VAULT_SOUNDPATH("deniedbeep.ogg")

/obj/machinery/door/airlock/external/wagon
	opacity = FALSE
	glass = TRUE

/obj/machinery/door/airlock/external/wagon/command
	doorDeni = VAULT_SOUNDPATH("deniedbeep.ogg")

/obj/machinery/door/airlock/colony_prefab
	doorOpen = PREFAB_SOUNDPATH("airlock.ogg")
	doorClose = PREFAB_SOUNDPATH("airlockclose.ogg")
	doorDeni = PREFAB_SOUNDPATH("deniedbeep.ogg")
	boltUp = PREFAB_SOUNDPATH("boltsup.ogg")
	boltDown = PREFAB_SOUNDPATH("boltsdown.ogg")
	loud_bolts = TRUE

/*
/obj/machinery/door/firedoor
	var/door_open_sound = FIREDOOR_SOUNDPATH("airlock.ogg")
	var/door_close_sound = FIREDOOR_SOUNDPATH("airlockclose.ogg")
*/

#undef AIRLOCK_SOUNDPATH
#undef INT_AIRLOCK_SOUNDPATH
#undef EXT_AIRLOCK_SOUNDPATH
#undef VAULT_SOUNDPATH
#undef PREFAB_SOUNDPATH
#undef FIREDOOR_SOUNDPATH
