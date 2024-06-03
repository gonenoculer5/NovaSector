/datum/map_template/shuttle/shipstation
	port_id = "station"
	who_can_purchase = null
	suffix = "ship"
	name = "NTSS 'Blue Moon'"

/*
/datum/map_template/shuttle/whiteship/ship
	suffix = "ship"
	name = "NTSS 'Friendship'"
*/

/area/shuttle/shipstation
	name = "NTSS 'Blue Moon'"
	requires_power = TRUE
	fire_detect = FALSE

/obj/docking_port/stationary/shipstation
	name = "Space Dock 32"
	shuttle_id = "whiteship_home"
	roundstart_template = /datum/map_template/shuttle/shipstation
	height = 25
	width = 50
	dwidth = 12

/obj/docking_port/mobile/shipstation
	callTime = 150
	can_move_docking_ports = 1
	shuttle_id = "station"
	launch_status = 0
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
	name = "NTSS 'Blue Moon'"
	port_direction = 4
	preferred_direction = 4

/obj/machinery/computer/shuttle/shipstation
	name = "NTSS 'Blue Moon' Shuttle Console"
	desc = "Used to control the NTSS 'Blue Moon'."
	circuit = /obj/item/circuitboard/computer/shipstation
	shuttleId = "station"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;station_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/circuitboard/computer/shipstation
	name = "NTSS 'Blue Moon' Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/shipstation

/obj/machinery/computer/camera_advanced/shuttle_docker/shipstation
	name = "NTSS 'Blue Moon' Navigation Computer"
	desc = "Used to designate a precise transit location for the NTSS 'Blue Moon'."
	shuttleId = "station"
	lock_override = NONE
	shuttlePortId = "station_custom"
	jump_to_ports = list(
		"whiteship_away" = 1,
		"whiteship_home" = 1,
		"whiteship_lavaland" = 1,
		"whiteship_z4" = 1,
	)
	view_range = 15
	designate_time = 50
	x_offset = 9
	y_offset = 9
	dir = 8
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
