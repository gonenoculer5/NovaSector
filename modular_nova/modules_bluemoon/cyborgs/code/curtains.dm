// Bluemoon edit - Allow cyborgs to open curtains
/obj/structure/curtain/attack_robot(mob/living/user, list/modifiers)
	. = ..()
	if(Adjacent(user))
		attack_hand(user, modifiers)
