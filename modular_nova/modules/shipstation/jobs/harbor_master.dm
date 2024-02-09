/obj/effect/landmark/start/harbormaster
	name = "Harbormaster"
	icon_state = "Security Officer"

// TODO: Add more uniqueness (like a budget and different outfit)
/datum/job/harbormaster
	title = JOB_SHUTTLE_PILOT
	description = "Oversee the operation of spaceport facilities. Enforce port regulations, ensure safety and security for all passengers."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Centcom")
	faction = FACTION_STATION
	total_positions = 0 // Set in config
	spawn_positions = 0 // Set in config
	supervisors = SUPERVISOR_CAPTAIN
	req_admin_notify = 1

	outfit = /datum/outfit/job/harbormaster
	plasmaman_outfit = /datum/outfit/plasmaman/harbormaster

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD
	bounty_types = CIV_JOB_RANDOM

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_CAPTAIN
	departments_list = list(
		/datum/job_department/command,
	)

	/*
	mail_goodies = list(
		// TBA
	)
	*/

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	//rpg_title = TBA

/*
/datum/job/harbormaster/announce(mob/living/carbon/human/pilot)
	..()
	SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(minor_announce), "Shuttle Pilot [pilot.real_name] on deck!"))
*/


/**
 * Controls the ship, the real captain stays at the dock and keeps the nuke diskie.
 * Technically a captain in their own right, but still answers to the station captain.
 * Think of them as what the warden is to the HoS. Kind of.
 */
/datum/outfit/job/harbormaster
	name = "Harbormaster"
	jobtype = /datum/job/harbormaster

	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/captain/harbormaster
	belt = /obj/item/modular_computer/pda/heads/captain
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/captain // TODO: Find old pilot subtype
	uniform =  /obj/item/clothing/under/rank/captain // TODO: Find old pilot subtype
	shoes = /obj/item/clothing/shoes/sneakers/brown
	head = /obj/item/clothing/head/hats/caphat // TODO: Find old pilot subtype
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
	)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/plasmaman/harbormaster
	name = "Harborbaster Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman/captain
	uniform = /obj/item/clothing/under/plasmaman/captain
	gloves = /obj/item/clothing/gloves/captain // TODO: Find old pilot subtype

/datum/id_trim/job/captain/harbormaster
	assignment = "Harbormaster"
	intern_alt_name = "Assistant Harbormaster"
	job = /datum/job/harbormaster
