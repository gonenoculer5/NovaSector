/obj/machinery/computer/shuttle/autumnal
	name = "FSC 'Autumnal'"
	desc = "Used to control the FSC 'Autumnal'."
	circuit = /obj/item/circuitboard/computer/autumnal
	shuttleId = "autumnal"
	possible_destinations = "autumnal_home;whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;autumnal_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/circuitboard/computer/autumnal
	name = "FSC 'Autumnal' Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/autumnal

/obj/machinery/computer/camera_advanced/shuttle_docker/autumnal
	name = "FSC 'Autumnal' Navigation Computer"
	desc = "Used to designate a precise transit location for the FSC 'Autumnal'."
	shuttleId = "autumnal"
	lock_override = NONE
	shuttlePortId = "autumnal_custom"
	jump_to_ports = list(
		"autumnal_home" = 1,
		"whiteship_away" = 1,
		"whiteship_home" = 1,
		"whiteship_lavaland" = 1,
		"whiteship_z4" = 1,
	)
	view_range = 15
	designate_time = 5 SECONDS
	x_offset = 7
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

