/// Bluemoon edit- Cyborg sex preference
/datum/preference/choiced/sex_cyborg
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "sex_cyborg"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/choiced/sex_cyborg/init_possible_values()
	return list("Default", CYBORG_ORGAN_NONE, CYBORG_ORGAN_PENIS, CYBORG_ORGAN_VAGINA, CYBORG_ORGAN_BOTH)

/datum/preference/choiced/sex_cyborg/create_default_value()
	return "Default"

/datum/preference/choiced/sex_cyborg/apply_to_human(mob/living/carbon/human/target, value)
	return
