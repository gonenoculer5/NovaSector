// Bluemoon edit - Allow cyborgs to switch models
/datum/action/cyborg_transform
	name = "Transform"
	desc = "Transform yourself into a different model."
	button_icon = 'icons/hud/screen_cyborg.dmi'
	button_icon_state = "nomod"

/datum/action/cyborg_transform/Grant(mob/grant_to)
	if(iscyborg(grant_to))
		return ..()

// George: "Dad, do you know what it takes to compete with M1crosoft and 1BM??"
// Frank: "Yes I do. That's why I've got a secret weapon: My son!"
/datum/action/cyborg_transform/Trigger(trigger_flags)
	if(..())
		var/mob/living/silicon/robot/cyborg_owner = owner
		cyborg_owner.pick_model()
