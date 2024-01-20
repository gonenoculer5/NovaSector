/datum/quirk/nudist
	name = "Nudist"
	desc = "You hate wearing tight-fitting uniforms! Caution: The practice of nudism is a notable deviation from the normative behaviors observed in Human societies."
	value = 0
	gain_text = span_notice("Your skin feels terribly sensitive under tight clothing.")
	lose_text = span_notice("Your sensitivity to tight clothes seems to fade away!")
	medical_record_text = "Subject has sensitive skin and refuses to wear clothing."
	icon = FA_ICON_SHIRT
	var/datum/component/nudist_component

/datum/quirk/nudist/add()
	nudist_component = quirk_holder.AddComponent(/datum/component/nudist)

/datum/quirk/nudist/remove()
	QDEL_NULL(nudist_component)

// Bad mood from wearing most uniforms
/datum/mood_event/tight_clothes
	description = "I hate wearing these tight clothes!"
	mood_change = -2

// This component listens for when clothes are being equipped
/datum/component/nudist

/datum/component/nudist/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOB_EQUIPPED_ITEM, PROC_REF(check_uniform))
	RegisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(check_uniform))

/datum/component/nudist/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_MOB_EQUIPPED_ITEM)
	UnregisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM)
	var/mob/living/carbon/human/human_parent = parent
	human_parent.clear_mood_event("tight_clothes")

// Check uniform slot for clothes and possibly give the quirk holder a bad mood event.
/datum/component/nudist/proc/check_uniform(obj/item/equip_target)
	var/mob/living/carbon/human/human_parent = parent
	// Gear harness is OK
	if(!equip_target || istype(equip_target, /obj/item/clothing/under/misc/nova/gear_harness))
		human_parent.clear_mood_event("tight_clothes")
		return
	human_parent.add_mood_event("tight_clothes", /datum/mood_event/tight_clothes)

