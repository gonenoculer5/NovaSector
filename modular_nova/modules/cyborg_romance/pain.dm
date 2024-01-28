/mob/living/silicon/robot/adjust_pain(change_amount = 0)
	if(stat >= DEAD || !client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	if(pain > pain_limit || change_amount > pain_limit / 10)
		if(HAS_TRAIT(src, TRAIT_MASOCHISM))
			var/arousal_adjustment = change_amount - (pain_limit / 10)
			if(arousal_adjustment > 0)
				adjust_arousal(-arousal_adjustment)
		else
			if(change_amount > 0)
				adjust_arousal(-change_amount)
		if(prob(2) && pain > pain_limit && change_amount > pain_limit / 10)
			emote("shiver")

	else if(HAS_TRAIT(src, TRAIT_MASOCHISM))
		if(change_amount > 0)
			adjust_arousal(change_amount)
		adjust_pleasure(change_amount / 2)

	pain = clamp(pain + change_amount, AROUSAL_MINIMUM, AROUSAL_LIMIT)
