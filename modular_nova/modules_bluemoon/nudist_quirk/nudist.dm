/datum/quirk/nudist
	name = "Nudist"
	desc = "You hate wearing tight-fitting uniforms! Caution: The practice of nudism is a notable deviation from the normative behaviors observed in Human societies."
	value = 0
	gain_text = span_danger("Your skin feels terribly sensitive under tight clothing.")
	lose_text = span_notice("Your sensitivity to tight clothes seems to fade away!")
	medical_record_text = "Subject has sensitive skin and refuses to wear clothing."
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_MOODLET_BASED
	icon = FA_ICON_SHIRT
	var/datum/component/nudist_component

/datum/quirk/nudist/add()
	nudist_component = quirk_holder.AddComponent(/datum/component/nudist)

/datum/quirk/nudist/remove()
	QDEL_NULL(nudist_component)

// Bad mood from wearing most uniforms
/datum/mood_event/tight_clothes
	description = "I hate wearing these tight clothes!"
	mood_change = -3

// This component listens for when clothes are being equipped
/datum/component/nudist
	/// Whitelist of clothing items which don't cause bad moodlet.
	var/static/list/obj/item/clothing_whitelist = list(
		/obj/item/clothing/under/misc/nova/gear_harness,
		/obj/item/clothing/under/costume/nova/bathrobe,
		/obj/item/clothing/under/costume/nova/yukata,
		/obj/item/clothing/under/costume/gladiator/ash_walker/chestwrap,
		/obj/item/clothing/under/costume/gladiator/ash_walker/robe,
		/obj/item/clothing/under/costume/gladiator/ash_walker/shaman,
		/obj/item/clothing/under/costume/gladiator/ash_walker/white,
	)
	var/obj/item/uniform_type_cache

/datum/component/nudist/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOB_EQUIPPED_ITEM, PROC_REF(check_uniform))
	RegisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM, PROC_REF(check_uniform))
	check_uniform()

/datum/component/nudist/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_MOB_EQUIPPED_ITEM)
	UnregisterSignal(parent, COMSIG_MOB_UNEQUIPPED_ITEM)
	var/mob/living/carbon/human/human_parent = parent
	human_parent.clear_mood_event("tight_clothes")

// Check uniform slot for clothes and possibly give the quirk holder a bad mood event.
/datum/component/nudist/proc/check_uniform()
	SIGNAL_HANDLER

	var/mob/living/carbon/human/human_parent = parent
	var/obj/item/uniform = human_parent.get_item_by_slot(ITEM_SLOT_ICLOTHING)

	if(!uniform || is_type_in_list(uniform, clothing_whitelist))
		uniform_type_cache = uniform ? uniform.type : null
		human_parent.clear_mood_event("tight_clothes")
		return

	if(uniform.type == uniform_type_cache)
		return

	uniform_type_cache = uniform.type
	new /obj/effect/temp_visual/annoyed(human_parent.loc)
	human_parent.visible_message(src, span_danger("[src] looks very uncomfortable in the [uniform]."),
		span_userdanger("The [uniform] feels very tight and uncomfortable!"))
	human_parent.add_mood_event("tight_clothes", /datum/mood_event/tight_clothes)

