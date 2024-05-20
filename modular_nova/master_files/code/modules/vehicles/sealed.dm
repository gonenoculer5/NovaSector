/obj/vehicle/sealed/mob_try_enter(mob/rider)
	if(!istype(rider))
		return FALSE
	// Bluemoon edit - Allow oversized mobs to get sealed in vehicles
	/*
	if(HAS_TRAIT(rider, TRAIT_OVERSIZED))
		to_chat(rider, span_warning("You are far too big for this!"))
		return FALSE
	*/

	return ..()
