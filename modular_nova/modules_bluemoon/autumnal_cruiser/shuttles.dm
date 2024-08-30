/datum/map_template/shuttle/autumnal
	port_id = "autumnal"
	who_can_purchase = null
	suffix = "cruiser"
	name = "FSC 'Autumnal'"

/area/shuttle/autumnal
	name = "FSC 'Autumnal'"
	requires_power = TRUE
	fire_detect = FALSE

/area/shuttle/autumnal/bridge
    name = "FSC 'Autumnal' Bridge"

/area/shuttle/autumnal/cockpit
    name = "FSC 'Autumnal' Control Room"

/area/shuttle/autumnal/crew1
    name = "FSC 'Autumnal' Crew's Quarters"

/area/shuttle/autumnal/crew2
    name = "FSC 'Autumnal' Crew's Quarters"

/area/shuttle/autumnal/forward
    name = "FSC 'Autumnal' Forward Compartment"

/area/shuttle/autumnal/midship
    name = "FSC 'Autumnal' Midship Compartment"

/area/shuttle/autumnal/mainbedroom
    name = "FSC 'Autumnal' Main Bedroom"

/area/shuttle/autumnal/engine
    name = "FSC 'Autumnal' Engine Compartment"

/area/shuttle/autumnal/bathroom
    name = "FSC 'Autumnal' Bathroom"

/area/shuttle/autumnal/kitchen
    name = "FSC 'Autumnal' Kitchen"

/area/shuttle/autumnal/restroom
    name = "FSC 'Autumnal' Restroom"

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
	shuttle_areas = list(
		/area/shuttle/autumnal,
		/area/shuttle/autumnal/bridge,
		/area/shuttle/autumnal/cockpit,
		/area/shuttle/autumnal/crew2,
		/area/shuttle/autumnal/crew1,
		/area/shuttle/autumnal/forward,
		/area/shuttle/autumnal/midship,
		/area/shuttle/autumnal/mainbedroom,
		/area/shuttle/autumnal/engine,
		/area/shuttle/autumnal/bathroom,
		/area/shuttle/autumnal/kitchen,
		/area/shuttle/autumnal/restroom,
    )