/datum/species/ethereal/on_species_gain(mob/living/carbon/human/new_ethereal, datum/species/old_species, pref_load)
	. = ..()
	var/datum/action/sing_tones/sing_action = new
	sing_action.Grant(new_ethereal)

/datum/species/ethereal/on_species_loss(mob/living/carbon/human/former_ethereal, datum/species/new_species, pref_load)
	. = ..()
	var/datum/action/action_to_remove = locate(/datum/action/sing_tones) in former_ethereal.actions
	if(action_to_remove)
		qdel(action_to_remove)
