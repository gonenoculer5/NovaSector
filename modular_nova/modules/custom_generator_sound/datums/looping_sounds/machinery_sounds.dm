// Bluemoon addition - Custom generator sounds
/datum/looping_sound/turbine
	start_sound = 'modular_nova/modules/custom_generator_sound/sound/turbine_spinup.ogg'
	start_length = 4.7 SECONDS
	mid_sounds = list('modular_nova/modules/custom_generator_sound/sound/turbine_run.ogg' = 1)
	mid_length = 1.1 SECONDS
	end_sound = 'modular_nova/modules/custom_generator_sound/sound/turbine_spindown.ogg'
	volume = 100

/datum/looping_sound/generator
	start_sound = 'modular_nova/modules/custom_generator_sound/sound/generator_start.ogg'
	start_length = 5.2 SECONDS
	mid_sounds = list('modular_nova/modules/custom_generator_sound/sound/generator_run.ogg' = 1)
	mid_length = 5.1 SECONDS
	end_sound = 'modular_nova/modules/custom_generator_sound/sound/generator_stop.ogg'
