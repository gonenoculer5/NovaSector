/datum/quirk/changeling
	name = "Changeling"
	desc = "You're a member of the Changeling Hive, a species of alien predator that is capable of shapeshifting. You have a stinger and can synthesize deadly chemicals internally. All Changelings are linked together through a hivemind."
	icon = FA_ICON_SPAGHETTI_MONSTER_FLYING
	value = 0
	medical_record_text = "Patient possesses dangerous and alien abilities including a stinger, chemical enhancements, and some form of natural bio-camo!"

/datum/quirk/changeling/add(client/client_source)
	quirk_holder.mind.make_changeling()

/datum/quirk/changeling/remove(client/client_source)
	quirk_holder.mind.remove_changeling()
