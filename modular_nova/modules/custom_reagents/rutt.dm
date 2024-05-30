/datum/reagent/drug/aphrodisiac/rutt
	name = "R.U.T.T."
	description = "Chemically condensed dopamine, sexual proteins, estrogens, and adrenalines. This aphrodisiac is an extremely powerful narcotic which may cause unintended climax."
	taste_description = "salty peanuts"
	reagent_state = LIQUID
	color = "#ffa9a9"
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

	arousal_adjust_amount = 25
	pleasure_adjust_amount = 25

	var/possible_aroused_thoughts = list(
		"You feel extremely horny and euphoric!",
		"You suddenly feel alarmingly pent-up and aroused!",
		"You feel a sudden and intense warmth in your loins!",
		"You're hit with an intense wave of sexual pleasure!"
	)

/datum/glass_style/drinking_glass/rutt
	required_drink_type = /datum/reagent/drug/aphrodisiac/rutt
	name = "glass of rutt"
	desc = "A glass of frothy pink juice. It smells floral and musky."

/datum/reagent/drug/aphrodisiac/rutt/on_mob_add(mob/living/carbon/human/exposed_mob)
	if(!(exposed_mob.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro)))
		return ..()
	var/displayed_thought = pick(possible_aroused_thoughts)
	to_chat(exposed_mob, span_pink("[displayed_thought]"))
	return ..()

/datum/reagent/drug/aphrodisiac/rutt/on_mob_life(mob/living/carbon/human/exposed_mob, seconds_per_tick, times_fired)
	. = ..()
	if(!ishuman(exposed_mob))
		return
	if(exposed_mob.has_status_effect(/datum/status_effect/climax) || !exposed_mob?.client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	if(current_cycle > 13)
		exposed_mob.adjust_arousal(arousal_adjust_amount)
		exposed_mob.adjust_pleasure(pleasure_adjust_amount)

	switch(current_cycle)
		if(6)
			to_chat(exposed_mob, span_pink("Your groin starts to feel really good..."))
		if(15)
			to_chat(exposed_mob, span_pink("You feel really close to orgasm!"))
		if(25 to INFINITY)
			if(prob(0.5))
				to_chat(exposed_mob, span_userlove("You can't stop cumming!"))
				exposed_mob.climax(is_forced = TRUE)

/datum/chemical_reaction/rutt
	results = list(/datum/reagent/drug/aphrodisiac/rutt = 20)
	required_reagents = list(
		/datum/reagent/drug/aphrodisiac/crocin = 3,
		/datum/reagent/drug/aphrodisiac/dopamine = 1,
		/datum/reagent/consumable/femcum = 1,
		/datum/reagent/medicine/epinephrine = 2
	)
	required_temp = 322 // Kind of warmed up
	mix_message = "The musky mixture foams into a warm pink froth..."
	erp_reaction = TRUE
