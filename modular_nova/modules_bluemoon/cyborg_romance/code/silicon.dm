#define AROUSED_ALERT "aroused"
#define AROUSED_SMALL "small"
#define AROUSED_MEDIUM "medium"
#define AROUSED_HIGH "high"
#define AROUSED_MAX "max"

/mob/living/silicon/robot
	var/arousal = 0
	var/pleasure = 0
	var/pain = 0

	var/pain_limit = 0
	var/arousal_status = AROUSAL_NONE

	var/refractory_period

	var/datum/cyborg_organ_descriptor/genitals

/datum/cyborg_organ_descriptor
	var/organs_type = CYBORG_ORGAN_BOTH
	var/vagina_visibility = GENITAL_HIDDEN_BY_CLOTHES
	var/penis_visibility = GENITAL_HIDDEN_BY_CLOTHES


/mob/living/silicon/robot/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/interactable)
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp) || CONFIG_GET(flag/disable_erp_preferences))
		verbs -= /mob/living/carbon/human/verb/climax_verb
	else
		genitals = new /datum/cyborg_organ_descriptor

/mob/living/silicon/robot/Life(seconds_per_tick, times_fired)
	. = ..()
	if(client?.prefs?.read_preference(/datum/preference/toggle/erp))
		handle_arousal(seconds_per_tick, times_fired)

/mob/living/silicon/robot/proc/set_sex(client/player_client)
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp) || CONFIG_GET(flag/disable_erp_preferences))
		return
	// Oops. Only cyborgs have this equipment...
	if(!iscyborg(src))
		return
	if(!genitals)
		genitals = new /datum/cyborg_organ_descriptor
	var/pref_sex = player_client.prefs.read_preference(/datum/preference/choiced/sex_cyborg)
	if(pref_sex == "Default")
		var/has_penis = player_client.prefs.read_preference(/datum/preference/choiced/genital/penis)
		var/has_vagina = player_client.prefs.read_preference(/datum/preference/choiced/genital/vagina)
		if(has_penis)
			if(has_vagina)
				genitals.organs_type = CYBORG_ORGAN_BOTH
			else
				genitals.organs_type = CYBORG_ORGAN_PENIS
		else if(has_vagina)
			genitals.organs_type = CYBORG_ORGAN_VAGINA
	else
		genitals.organs_type = pref_sex

/mob/living/silicon/robot/verb/toggle_genitals()
	set category = "IC"
	set name = "Expose/Hide genitals"
	set desc = "Allows you to toggle which genitals should show through clothes or not."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle genitals visibility right now..."))
		return

	if(!genitals || genitals.organs_type == CYBORG_ORGAN_NONE) //There is nothing to expose
		return

	var/list/genital_list = list()
	if(has_penis())
		genital_list = CYBORG_ORGAN_PENIS
		if(has_vagina())
			genital_list =  CYBORG_ORGAN_BOTH
	else if(has_vagina())
		genital_list =  CYBORG_ORGAN_VAGINA

	var/obj/item/organ/external/genital/picked_organ = tgui_input_list(src, "Choose which genitalia to expose/hide", "Expose/Hide genitals", genital_list)

	if(!picked_organ)
		return

	var/static/list/cyborg_gen_vis_trans = list(
		"Never show" = GENITAL_NEVER_SHOW,
		"Hidden by plating" = GENITAL_HIDDEN_BY_CLOTHES,
		"Always show" = GENITAL_ALWAYS_SHOW,
	)

	var/picked_visibility = tgui_input_list(src, "Choose visibility setting", "Expose/Hide genitals", cyborg_gen_vis_trans)

	if(!picked_visibility)
		return

	if(picked_organ == CYBORG_ORGAN_BOTH || picked_organ == CYBORG_ORGAN_PENIS)
		genitals.penis_visibility = cyborg_gen_vis_trans[picked_visibility]
	if(picked_organ == CYBORG_ORGAN_BOTH || picked_organ == CYBORG_ORGAN_VAGINA)
		genitals.vagina_visibility = cyborg_gen_vis_trans[picked_visibility]

	balloon_alert(src, "set to [lowertext(picked_visibility)]")
// Returns true of the cyborg has genitals
/mob/living/silicon/robot/proc/has_genitals()
	if(genitals && genitals.organs_type != CYBORG_ORGAN_NONE)
		return TRUE
	return FALSE

/// Returns true if the human has an accessible penis for the parameter. Accepts any of the `REQUIRE_GENITAL_` defines.
/mob/living/silicon/robot/proc/has_penis(required_state = REQUIRE_GENITAL_ANY)
	if(!genitals || (genitals.organs_type != CYBORG_ORGAN_PENIS && genitals.organs_type != CYBORG_ORGAN_BOTH))
		return FALSE

	switch(required_state)
		if(REQUIRE_GENITAL_ANY)
			return TRUE
		if(REQUIRE_GENITAL_EXPOSED)
			return genitals.penis_visibility == GENITAL_ALWAYS_SHOW
		if(REQUIRE_GENITAL_UNEXPOSED)
			return genitals.penis_visibility != GENITAL_ALWAYS_SHOW
		else
			return TRUE

/// Returns true if the human has an accessible vagina for the parameter. Accepts any of the `REQUIRE_GENITAL_` defines.
/mob/living/silicon/robot/proc/has_vagina(required_state = REQUIRE_GENITAL_ANY)
	if(!genitals || (genitals.organs_type != CYBORG_ORGAN_VAGINA && genitals.organs_type != CYBORG_ORGAN_BOTH))
		return FALSE

	switch(required_state)
		if(REQUIRE_GENITAL_ANY)
			return TRUE
		if(REQUIRE_GENITAL_EXPOSED)
			return genitals.vagina_visibility == GENITAL_ALWAYS_SHOW
		if(REQUIRE_GENITAL_UNEXPOSED)
			return genitals.vagina_visibility != GENITAL_ALWAYS_SHOW
		else
			return TRUE

/// Sends an icon to the screen that gives an approximate indication of the mob's arousal.
/mob/living/silicon/robot/proc/throw_arousal_alert(level, atom/movable/screen/alert/aroused/arousal_alert)
	throw_alert(AROUSED_ALERT, /atom/movable/screen/alert/aroused)
	arousal_alert?.icon_state = "arousal_[level]"
	arousal_alert?.update_icon()

/// Sends an icon to the screen that gives an approximate indication of the mob's pain. Looks like spikes/barbed wire.
/mob/living/silicon/robot/proc/overlay_pain(level, atom/movable/screen/alert/aroused/arousal_alert)
	arousal_alert?.cut_overlay(arousal_alert.pain_overlay)
	arousal_alert?.pain_level = level
	arousal_alert?.pain_overlay = arousal_alert.update_pain()
	arousal_alert?.add_overlay(arousal_alert.pain_overlay)
	arousal_alert?.update_overlays()

/// Sends an icon to the screen that gives an approximate indication of the mob's pleasure. Looks like a pink-white border on the arousal alert heart.
/mob/living/silicon/robot/proc/overlay_pleasure(level, atom/movable/screen/alert/aroused/arousal_alert)
	arousal_alert?.cut_overlay(arousal_alert.pleasure_overlay)
	arousal_alert?.pleasure_level = level
	arousal_alert?.pleasure_overlay = arousal_alert.update_pleasure()
	arousal_alert?.add_overlay(arousal_alert.pleasure_overlay)
	arousal_alert?.update_overlays()

/// Handles throwing the arousal alerts to screen.
/mob/living/silicon/robot/proc/handle_arousal(atom/movable/screen/alert/aroused)
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	var/atom/movable/screen/alert/aroused/arousal_alert = alerts[AROUSED_ALERT]

	var/alert_state
	switch(arousal)
		if(-INFINITY to AROUSAL_MINIMUM_DETECTABLE)
			clear_alert(AROUSED_ALERT, /atom/movable/screen/alert/aroused)
			if(arousal < AROUSAL_MINIMUM)
				arousal = AROUSAL_MINIMUM // To prevent massively negative values that break the lewd system for some.
		if(AROUSAL_MINIMUM_DETECTABLE to AROUSAL_LOW)
			alert_state = AROUSED_SMALL
		if(AROUSAL_LOW to AROUSAL_MEDIUM)
			alert_state = AROUSED_MEDIUM
		if(AROUSAL_HIGH to AROUSAL_AUTO_CLIMAX_THRESHOLD)
			alert_state = AROUSED_HIGH
		if(AROUSAL_AUTO_CLIMAX_THRESHOLD to INFINITY) //to prevent that 101 arousal that can make icon disappear or something.
			alert_state = AROUSED_MAX
	if(alert_state)
		throw_arousal_alert(alert_state, arousal_alert)
		alert_state = null

	switch(pain)
		if(-INFINITY to AROUSAL_MINIMUM_DETECTABLE) //to prevent same thing with pain
			arousal_alert?.cut_overlay(arousal_alert.pain_overlay)
			if(pain < AROUSAL_MINIMUM)
				pain = AROUSAL_MINIMUM // To prevent massively negative values that break the lewd system for some.
		if(AROUSAL_MINIMUM_DETECTABLE to AROUSAL_LOW)
			alert_state = AROUSED_SMALL
		if(AROUSAL_LOW to AROUSAL_MEDIUM)
			alert_state = AROUSED_MEDIUM
		if(AROUSAL_HIGH to AROUSAL_AUTO_CLIMAX_THRESHOLD)
			alert_state = AROUSED_HIGH
		if(AROUSAL_AUTO_CLIMAX_THRESHOLD to INFINITY)
			alert_state = AROUSED_MAX
	if(alert_state)
		overlay_pain(alert_state, arousal_alert)
		alert_state = null

	switch(pleasure)
		if(-INFINITY to AROUSAL_MINIMUM_DETECTABLE) //to prevent same thing with pleasure
			arousal_alert?.cut_overlay(arousal_alert.pleasure_overlay)
			if(pleasure < AROUSAL_MINIMUM)
				pleasure = AROUSAL_MINIMUM // To prevent massively negative values that break the lewd system for some.
		if(AROUSAL_MINIMUM_DETECTABLE to AROUSAL_LOW)
			alert_state = AROUSED_SMALL
		if(AROUSAL_LOW to AROUSAL_MEDIUM)
			alert_state = AROUSED_MEDIUM
		if(AROUSAL_HIGH to AROUSAL_AUTO_CLIMAX_THRESHOLD)
			alert_state = AROUSED_HIGH
		if(AROUSAL_AUTO_CLIMAX_THRESHOLD to INFINITY)
			alert_state = AROUSED_MAX
	if(alert_state)
		overlay_pleasure(alert_state, arousal_alert)

#undef AROUSED_ALERT
#undef AROUSED_SMALL
#undef AROUSED_MEDIUM
#undef AROUSED_HIGH
#undef AROUSED_MAX
