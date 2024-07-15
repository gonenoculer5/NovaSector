// 20 gauge super-shotgun revolver
/obj/item/gun/ballistic/revolver/executioner
	name = "Executioner Revolver"
	desc = "Judge, jury, and executioner. It's a hefty revolver with an equally large cylinder capable of holding six 20-gauge shotgun rounds. Can be modified with a wrench to hold .40 Sol Long instead."
	icon = 'modular_nova/modules/modular_weapons/icons/obj/company_and_or_faction_based/trappiste_fabriek/guns32x.dmi'
	icon_state = "takbok"
	fire_sound = 'modular_nova/modules/modular_weapons/sounds/revolver_heavy.ogg'
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/executioner
	can_suppress = FALSE
	can_modify_ammo = TRUE
	initial_caliber = CALIBER_SHOTGUN
	alternative_caliber = CALIBER_SOL40LONG
	fire_delay = 1 SECONDS
	recoil = 3

/obj/item/gun/ballistic/revolver/executioner/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, "Etched into the barrel, it has a small <b>[span_red("pattern of five squares")]</b> alongside <b>[span_red("Trappiste Fabriek")]</b>, and also a [span_blue("blue")], [span_yellow("yellow")], and [span_green("green")] flag alongside <b>[span_red("Mfg. for Grand Nomad Fleet et al.")]</b>.")

/obj/item/gun/ballistic/revolver/executioner/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/ammo_box/magazine/internal/cylinder/executioner
	ammo_type = /obj/item/ammo_casing/shotgun
	caliber = CALIBER_SHOTGUN
	max_ammo = 6

/obj/item/gun/ballistic/revolver/executioner/phobos
	name = "\improper Andromeda's 'Phobos' Revolver"
	desc = "A hefty revolver with an equally large cylinder capable of holding six 20-gauge shotgun rounds. Can be modified with a wrench to hold .50AE instead."
	icon = 'modular_nova/modules_bluemoon/weapons/icons/executioner.dmi'
	icon_state = "phobos"
	alternative_caliber = CALIBER_50AE
	misfire_percentage_increment = 0
	misfire_probability_cap = 0

/obj/item/gun/ballistic/revolver/executioner/phobos/examine_more(mob/user)
	. = ..()

	. += "A custom Executioner revolver, rebuilt by Andromeda Cloudrunner.\
	This firearm has been fitted with a muzzle device, new grips, and a bespoke frame.\
	It is covered in subtle Mothic adornments with a lily on the grip.\
	It seems to be crafted with care and precision, making it extremely reliable\
	and immune to misfires. It uses a specially designed variable geometry barrel\
	with an adjustable cylinder, enabling the weapon to use 20 gauge shotshells or\
	.50AE rounds, compared to the retail version's .40 Long Sol."

	return .
