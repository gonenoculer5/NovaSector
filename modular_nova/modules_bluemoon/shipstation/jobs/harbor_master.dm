// TODO: Add more uniqueness (like a budget and different outfit)
/datum/job/harbormaster
	title = JOB_HARBORMASTER
	description = "Oversee the operation of marina facilities. Enforce port regulations, ensure safety and security for all passengers."
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
 * Controls the Marina spaceport, and the real captain pilots the ship.
 * Technically a third-party captain. Doesn't answer to the ship captain.
 */
/datum/outfit/job/harbormaster
	name = JOB_HARBORMASTER
	jobtype = /datum/job/harbormaster

	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/captain/harbormaster
	belt = /obj/item/modular_computer/pda/heads/captain
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/heads/captain/alt
	gloves = /obj/item/clothing/gloves/captain
	uniform =  /obj/item/clothing/under/rank/captain/nova/imperial/generic/red
	shoes = /obj/item/clothing/shoes/jackboots/knee
	head = /obj/item/clothing/head/utility/hardhat/welding/marina
	backpack_contents = list(
		/obj/item/melee/baton/telescopic = 1,
		/obj/item/key_card/marina_master = 1,
		/obj/item/storage/box/ids/marina = 1
	)

	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/plasmaman/harbormaster
	name = "Marina Harborbaster Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman/captain
	uniform = /obj/item/clothing/under/plasmaman/captain
	gloves = /obj/item/clothing/gloves/captain // TODO: Find old pilot subtype

/obj/item/clothing/head/utility/hardhat/welding/marina
	name = "\improper Harbormaster hardhat"
	desc = "Protects the Harbormaster from robust workplace hazards."
	icon_state = "hardhat0_red"
	hat_type = "red"
	dog_fashion = null
	light_range = 5
	resistance_flags = FIRE_PROOF | ACID_PROOF
	clothing_flags = STOPSPRESSUREDAMAGE | STACKABLE_HELMET_EXEMPT
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT*2, /datum/material/glass =HALF_SHEET_MATERIAL_AMOUNT, /datum/material/plastic = SHEET_MATERIAL_AMOUNT*1.5, /datum/material/silver = SMALL_MATERIAL_AMOUNT*5)

/obj/item/modular_computer/pda/marina
	name = "\improper Harbormaster PDA"
	greyscale_config = /datum/greyscale_config/tablet/captain
	greyscale_colors = "#891417#000099#FFFFFF#891417"
	inserted_item = /obj/item/pen/fountain/captain
	starting_programs = list(
		/datum/computer_file/program/alarm_monitor,
		/datum/computer_file/program/crew_manifest,
		/datum/computer_file/program/status,
		/datum/computer_file/program/budgetorders,
	)


/obj/item/card/id/advanced/centcom/marina
	name = "\improper Harbormaster ID"
	desc = "An ID for the Marina Harbormaster."
	icon = 'modular_nova/master_files/icons/obj/card.dmi'
	icon_state = "card_silvergen"
	assigned_icon_state = null
	registered_name = JOB_CENTCOM
	registered_age = null
	trim = /datum/id_trim/job/captain/harbormaster

/datum/id_trim/job/captain/harbormaster
	assignment = JOB_HARBORMASTER
	intern_alt_name = "Assistant Harbormaster"
	job = /datum/job/harbormaster
	department_color = "#E55C01"
	subdepartment_color = "#C4004E"
