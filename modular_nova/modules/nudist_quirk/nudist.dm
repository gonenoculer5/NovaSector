/datum/quirk/nudist
	name = "Nudist"
	desc = "You hate wearing tight-fitting uniforms! Caution: The practice of nudism is a notable deviation from the normative behaviors observed in Human societies."
	value = 0
	gain_text = span_notice("Your skin feels terribly sensitive under tight clothing.")
	lose_text = span_notice("Your sensitivity to tight clothes seems to fade away!")
	medical_record_text = "Subject has sensitive skin and refuses to wear clothing."
	icon = FA_ICON_SHIRT

/datum/quirk/nudist/process()
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/uniform = human_holder.get_item_by_slot(ITEM_SLOT_ICLOTHING)
	if(!uniform || istype(uniform, /obj/item/clothing/under/misc/nova/gear_harness))
		quirk_holder.clear_mood_event("tight_clothes")
		return
	quirk_holder.add_mood_event("tight_clothes", /datum/mood_event/tight_clothes)

/datum/mood_event/tight_clothes
	description = "I hate wearing these tight clothes!"
	mood_change = -2
