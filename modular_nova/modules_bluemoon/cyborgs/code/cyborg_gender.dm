/// Bluemoon edit- Cyborg gender preference
/datum/preference/choiced/gender_cyborg
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "gender_cyborg"
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES

/datum/preference/choiced/gender_cyborg/init_possible_values()
	return list("Default", MALE, FEMALE, PLURAL, NEUTER)

/datum/preference/choiced/gender_cyborg/create_default_value()
	return "Default"

/datum/preference/choiced/gender_cyborg/apply_to_human(mob/living/carbon/human/target, value)
	return
