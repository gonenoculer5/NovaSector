// Bluemoon edit - Cyborg interactions
/mob/living/proc/adjust_pleasure(arous = 0)
	return

// Bluemoon edit - Forced orgasms
/mob/living/carbon/human/adjust_pleasure(pleas = 0, is_forced = FALSE)
	if(stat >= DEAD || !client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	pleasure = clamp(pleasure + pleas, AROUSAL_MINIMUM, AROUSAL_LIMIT)

	if(pleasure >= AROUSAL_AUTO_CLIMAX_THRESHOLD) // lets cum
		// Bluemoon edit - Forced orgasms
		climax(manual = FALSE, is_forced = is_forced)
