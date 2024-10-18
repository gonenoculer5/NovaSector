/obj/machinery/spaceship_navigation_beacon
	// Bluemoon edit - Sound effects for beacons
	var/datum/looping_sound/beacon_sfx/soundloop

/obj/machinery/spaceship_navigation_beacon/Initialize(mapload)
	. = ..()
	soundloop = new(src, TRUE)
