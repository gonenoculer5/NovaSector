/datum/action/sing_tones
	name = "Sing Tones"
	desc = "Use your electric discharger to sing!"
	button_icon = 'icons/obj/art/musician.dmi'
	button_icon_state = "xylophone"

/datum/action/sing_tones/Grant(mob/grant_to)
	var/mob/living/carbon/human/human_target = grant_to
	human_target.tone_synth = new(grant_to)
	return ..()

/datum/action/sing_tones/Remove(mob/remove_from)
	var/mob/living/carbon/human/human_target = remove_from
	human_target.tone_synth = null
	return ..()

/datum/action/sing_tones/IsAvailable(feedback)
	var/mob/living/carbon/human/human_target = owner
	var/obj/item/organ/internal/tongue/ethereal/discharger = human_target.get_organ_slot(ORGAN_SLOT_TONGUE)
	if(istype(discharger, /obj/item/organ/internal/tongue/ethereal))
		return ..()
	return FALSE

/datum/action/sing_tones/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/human_target = owner
	human_target.tone_synth.interact(owner)
