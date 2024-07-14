// Lets cyborgs drag pulled objects
// Bluemoon edit - Cyborg hands
/atom/proc/attack_robot(mob/user, list/modifiers)
	if((isturf(src) || istype(src, /obj/structure/table) || istype(src, /obj/machinery/conveyor)) && get_dist(user, src) <= 1)
		user.Move_Pulled(src)
		return
	attack_ai(user)
	return
