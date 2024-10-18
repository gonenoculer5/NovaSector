/obj/item/gps/computer/beacon
	// Bluemoon edit - Sound effects for beacons
	var/datum/looping_sound/beacon_sfx/soundloop

/obj/item/gps/computer/beacon/Initialize(mapload)
	. = ..()
	soundloop = new(src, TRUE)
