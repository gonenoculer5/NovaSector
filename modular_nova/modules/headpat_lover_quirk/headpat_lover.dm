/datum/quirk/headpatlover
	name = "Headpat Lover"
	desc = "Your head seems to be an erogenous zone! You enjoy headpats a little too much..."
	value = 0
	gain_text = span_purple("Your scalp feels extremely sensitive!")
	lose_text = span_notice("Your sensitivity to headpats fades away!")
	medical_record_text = "Subject has an extremely sensitive head and scalp."
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_MOODLET_BASED
	icon = FA_ICON_PERSON_HARASSING
	erp_quirk = TRUE
	var/datum/component/headpat_component

/datum/quirk/headpatlover/add()
	headpat_component = quirk_holder.AddComponent(/datum/component/headpat_lover)

/datum/quirk/headpatlover/remove()
	QDEL_NULL(headpat_component)

/datum/mood_event/headpat_lover
	description = "I LOVE HEADPATS! YES!!!"
	mood_change = 50
	timeout = 1 MINUTES
	special_screen_obj = "mood_happiness_good"

// This component listens for when headpats happen
/datum/component/headpat_lover

/datum/component/headpat_lover/RegisterWithParent()
	RegisterSignal(parent, COMSIG_CARBON_HELP_ACT, PROC_REF(check_headpat))

/datum/component/headpat_lover/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_CARBON_HELP_ACT)
	var/mob/living/carbon/human/human_parent = parent
	human_parent.clear_mood_event("headpat_lover")

/datum/component/headpat_lover/proc/check_headpat(mob/living/carbon/human/human_parent, mob/living/carbon/human/human_petter)
	SIGNAL_HANDLER

	if(!(istype(human_petter)))
		return

	if(check_zone(human_petter.zone_selected) == BODY_ZONE_HEAD && human_parent.get_bodypart(BODY_ZONE_HEAD))
		new /obj/effect/temp_visual/heart(human_parent.loc)
		// Avoid blocking from TGUI alerting.
		INVOKE_ASYNC(src, PROC_REF(pleasure_pet), human_parent)

// Needed because adjust_arousal (and etc.) call blocking TGUI procs which can't be executed from a signal handler.
/datum/component/headpat_lover/proc/pleasure_pet(mob/living/carbon/human/human_pet)
	human_pet.add_mood_event("headpat_lover", /datum/mood_event/headpat_lover)
	human_pet.adjust_arousal(2)
	human_pet.adjust_pleasure(3)
