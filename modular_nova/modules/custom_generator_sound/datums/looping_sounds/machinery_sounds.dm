// Bluemoon addition - Custom generator sounds
/datum/looping_sound/turbine
	start_sound = 'modular_nova/modules/custom_generator_sound/sound/turbine_spinup.ogg'
	start_length = 5
	mid_sounds = list('modular_nova/modules/custom_generator_sound/sound/turbine_run.ogg' = 1)
	mid_length = 1
	end_sound = 'modular_nova/modules/custom_generator_sound/sound/turbine_spindown.ogg'
	volume = 100

/datum/looping_sound/generator
	start_sound = 'modular_nova/modules/custom_generator_sound/sound/generator_start.ogg'
	start_length = 5
	mid_sounds = list('modular_nova/modules/custom_generator_sound/sound/generator_run.ogg' = 1)
	mid_length = 5
	end_sound = 'modular_nova/modules/custom_generator_sound/sound/generator_stop.ogg'
