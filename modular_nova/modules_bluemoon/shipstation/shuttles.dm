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
	name = "Refueling Station: Port 6"
	shuttle_id = "whiteship_home"
	roundstart_template = /datum/map_template/shuttle/shipstation
	height = 27
	width = 56
	dwidth = 14

/obj/docking_port/mobile/shipstation
	callTime = 5 MINUTES
	can_move_docking_ports = TRUE
	shuttle_id = "station"
	launch_status = 0
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
	name = "NTSS 'Blue Moon'"
	port_direction = EAST
	preferred_direction = EAST
