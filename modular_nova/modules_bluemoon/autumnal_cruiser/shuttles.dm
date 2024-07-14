/datum/map_template/shuttle/autumnal
	port_id = "autumnal"
	who_can_purchase = null
	suffix = "cruiser"
	name = "FSC 'Autumnal'"

/area/shuttle/autumnal
	name = "FSC 'Autumnal'"
	requires_power = TRUE
	fire_detect = FALSE

/obj/docking_port/stationary/autumnal
	name = "Refueling Station: Port 8"
	shuttle_id = "autumnal_home"
	roundstart_template = /datum/map_template/shuttle/autumnal
	height = 42
	width = 26
	dwidth = 6
	dheight = 31

/obj/docking_port/mobile/autumnal
	callTime = 3 MINUTES
	can_move_docking_ports = TRUE
	shuttle_id = "autumnal"
	launch_status = 0
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
	name = "NTSS 'Autumnal'"
	port_direction = SOUTH
	preferred_direction = NORTH
	prearrivalTime = 10 SECONDS
