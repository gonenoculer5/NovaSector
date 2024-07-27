//Areas
//I am contributing all over the files

/area/awaymission/university
	name = "University"
	icon_state = "away2"
	static_lighting = FALSE
	requires_power = TRUE
	has_gravity = STANDARD_GRAVITY
	always_unpowered = FALSE
	mood_bonus = 1
	mood_message = "This is a good day!"
	outdoors = FALSE


/area/awaymission/university/outside
	name = "Outside"
	icon_state = "away2"
	static_lighting = FALSE
	requires_power = FALSE
	ambient_buzz = 'modular_nova/modules_bluemoon/awaymissions/forest/sound/ambience_forest.ogg'
	forced_ambience = TRUE
	ambient_buzz_vol = 25
	ambience_index = null
	ambientsounds = null
	sound_environment = SOUND_ENVIRONMENT_FOREST
	power_light = TRUE
	power_environ = TRUE
	power_equip = TRUE
	outdoors = TRUE
	mood_bonus = 2
	mood_message = "It's so peaceful and soothing outside..."
	base_lighting_alpha = 50
	base_lighting_color = COLOR_WHITE

/area/awaymission/university/halls
	name = "Hallways"
	icon_state = "away5"

/area/awaymission/university/commonrooms
	name = "Classes"
	icon_state = "away4"

/area/awaymission/university/dormitorybunks
	name = "Student Dorms"
	icon_state = "away"

/area/awaymission/university/dormitorybunks/bunk1
	name = "First Bunk"

/area/awaymission/university/dormitorybunks/bunk2
	name = "Second Bunk"

/area/awaymission/university/dormitorybunks/bunk3
	name = "Third Bunk"

/area/awaymission/university/dormitorybunks/bunk4
	name = "Forth Bunk"

//Call a specialised cleaning team here
//There is too much...

//Turfs time!

/turf/open/floor/iron/dark/side/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/iron/dark/smooth_large/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/iron/dark/corner/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/iron/large/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/plating/cobblestone/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/shuttle/exploration/doubleside/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet

/turf/open/floor/stone/planetary
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/misc/sandy_dirt/planet
