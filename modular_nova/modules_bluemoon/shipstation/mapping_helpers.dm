/obj/effect/mapping_helpers/airlock/access/all/marina/get_access()
	var/list/access_list = ..()
	access_list += "marina"
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/marina/manager/get_access()
	var/list/access_list = ..()
	access_list += "marina_manager"
	return access_list

/obj/effect/landmark/start/harbormaster
	name = JOB_HARBORMASTER
	icon_state = "Captain"

/obj/effect/landmark/start/shuttle_pilot
	name = JOB_SHUTTLE_PILOT
	icon_state = "Security Officer"
