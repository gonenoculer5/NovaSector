/datum/design/board/pacman/bluespace
	name = "GHOST-type Generator Board"
	desc = "The circuit board for a GHOST-type portable generator."
	id = "ghostpacman"
	build_path = /obj/item/circuitboard/machine/pacman/bluespace

/datum/design/board/rad_collector
	name = "Radiation Collector Board"
	desc = "The circuit board for a radiation collector array."
	id = "rad_collector"
	build_path = /obj/item/circuitboard/machine/rad_collector
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)

/datum/design/board/port_turbine
	name = "Portable Turbine Generator Board"
	desc = "The circuit board for a portable turbine generator."
	id = "port_turbine"
	build_path = /obj/item/circuitboard/machine/port_turbine
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
