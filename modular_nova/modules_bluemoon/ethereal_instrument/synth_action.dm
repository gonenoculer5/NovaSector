/datum/action/sing_tones
	name = "Sing Tones"
	desc = "Use your electric discharger organ to sing tones!"
	button_icon = 'icons/obj/art/musician.dmi'
	button_icon_state = "synth"
	button_icon_state = "nomod"
	var/obj/item/instrument/ethereal_synth/tone_synth

/datum/action/sing_tones/Grant(mob/grant_to)
	tone_synth = new /obj/item/instrument/ethereal_synth
	return ..()

/datum/action/sing_tones/Remove(mob/remove_from)
	tone_synth = null
	return ..()

/datum/action/sing_tones/Trigger(trigger_flags)
	if(..())
		tone_synth.ui_interact(owner)
