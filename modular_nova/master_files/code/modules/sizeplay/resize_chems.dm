///File contains the code for reagent storage datums, size change processing, and reagent synthesis.

// Height growth chem
/datum/reagent/prospacillin
	name = "Prospacillin"
	description = "A potent height enhancer used to make people taller. Do not mix with dimicillin."
	color = "#ff0000"
	taste_description = "an awful, springy cherry flavor"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/chemical_reaction/prospacillin
	results = list(/datum/reagent/prospacillin = 4)
	required_reagents = list(/datum/reagent/medicine/dermagen = 2, /datum/reagent/medicine/lidocaine = 1, /datum/reagent/medicine/cryoxadone = 1)
	mix_message = "the reaction glows a dim red"
	erp_reaction = TRUE
	required_temp = 600
	optimal_temp = 900

/datum/reagent/prospacillin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(!affected_mob?.client?.prefs.read_preference(/datum/preference/toggle/erp/sizeplay_pref)) // Check to see if the mob has a valid pref state. If not, stop processing.
		return
	affected_mob.adjust_height(1.01)
	affected_mob.visible_message("<span class='danger'>[pick("[affected_mob] grows!", "[affected_mob] expands in size!", "[affected_mob] pushes outwards in stature!")]</span>", "<span class='danger'>[pick("You feel your body fighting for space and growing!", "The world contracts inwards in every direction!", "You feel your muscles expand, and your surroundings shrink!")]</span>")

/datum/reagent/prospacillin/on_mob_metabolize(mob/living/affected_mob, amount)
	. = ..()
	if(!affected_mob?.client?.prefs.read_preference(/datum/preference/toggle/erp/sizeplay_pref))
		log_admin("SIZEPLAY: [affected_mob] ckey: [affected_mob.ckey] has ingested a growthchem with invalid prefs!")
	else
		log_admin("SIZEPLAY: [affected_mob] ckey: [affected_mob.ckey] has ingested a growthchem!")

// Height shrinking chem
/datum/reagent/dimicillin
	name = "Dimicillin"
	description = "A potent height reducer used to make people shorter. Do not mix with prospacillin."
	color = "#2a94d1"
	taste_description = "an awful, jumpy blue raspberry flavor"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/chemical_reaction/dimicillin
	results = list(/datum/reagent/dimicillin = 4)
	required_reagents = list(/datum/reagent/medicine/dermagen = 2, /datum/reagent/medicine/lidocaine = 1, /datum/reagent/medicine/pyroxadone = 1)
	mix_message = "the reaction glows a bright blue"
	erp_reaction = TRUE
	required_temp = 600
	optimal_temp = 900

/datum/reagent/dimicillin/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	. = ..()
	if(!affected_mob?.client?.prefs.read_preference(/datum/preference/toggle/erp/sizeplay_pref)) // Check to see if the mob has a valid pref state. If not, stop processing.
		return
	affected_mob.adjust_height(1 - 0.01)
	affected_mob.visible_message("<span class='danger'>[pick("[affected_mob] shrinks down!", "[affected_mob] dwindles in size!", "[affected_mob] compresses down!")]</span>", "<span class='danger'>[pick("You feel your body compressing in size!", "The world pushes outwards in every direction!", "You feel your muscles contract, and your surroundings grow!")]</span>")

/datum/reagent/dimicillin/on_mob_metabolize(mob/living/affected_mob, amount)
	. = ..()
	if(!affected_mob?.client?.prefs.read_preference(/datum/preference/toggle/erp/sizeplay_pref))
		log_admin("SIZEPLAY: [affected_mob] ckey: [affected_mob.ckey] has ingested a growthchem with invalid prefs!")
	else
		log_admin("SIZEPLAY: [affected_mob] ckey: [affected_mob.ckey] has ingested a growthchem!")

// Lustwish bottles.

/obj/item/reagent_containers/cup/bottle/prospacillin
	name = "prospacillin bottle"
	desc = "A red, dimly glowing bottle of potent height enhancer."
	list_reagents = list(/datum/reagent/prospacillin = 15) // Only 15 because its hard to make; plus you don't need alot.

/obj/item/reagent_containers/cup/bottle/dimicillin
	name = "dimicillin bottle"
	desc = "A blue, brightly glowing bottle of potent height reducer."
	list_reagents = list(/datum/reagent/dimicillin = 15)
