/datum/quirk/headpatlover
	name = "Headpat Lover"
	desc = "Your head seems to be an erogenous zone! You enjoy headpats a little too much..."
	value = 0
	gain_text = span_purple("Your scalp feels extremely sensitive!")
	lose_text = span_notice("Your sensitivity to headpats fades away!")
	medical_record_text = "Subject has an extremely sensitive head and scalp."
	icon = FA_ICON_PERSON_HARASSING
	lewd_quirk = TRUE

/datum/mood_event/headpat_lover
	description = "I LOVE HEADPATS! YES PLEASE!! OH GOD YES!!!"
	mood_change = 100
	timeout = 30 SECONDS
	special_screen_obj = "mood_happiness_good"
