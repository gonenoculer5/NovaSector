/obj/structure/grille
	var/broken_icon_state = "brokengrille"

// Version of the grille that is stronger and visually distinct
/obj/structure/grille/lattice
	desc = "A very robust lattice of iron rods."
	name = "lattice grille"
	icon_state = "ratvargrille"
	base_icon_state = "ratvargrille"
	broken_icon_state = "brokenratvargrille"
	armor_type = /datum/armor/structure_grille/lattice
	max_integrity = 100

/obj/structure/grille/lattice/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	return ..()

// Twice as strong as a regular grille
/datum/armor/structure_grille/lattice
	melee = 100
	bullet = 140
	laser = 140
	energy = 200
	bomb = 20
