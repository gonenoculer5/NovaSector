// Bluemoon edit - Methane gas
/obj/effect/turf_decal/vg_decals/atmos/methane
	icon = 'modular_nova/modules/custom_mapping/icons/bluemoon_decals.dmi'
	icon_state = "methane"

/obj/effect/turf_decal/vg_decals/atmos/hydrogen
	icon = 'modular_nova/modules/custom_mapping/icons/bluemoon_decals.dmi'
	icon_state = "hydrogen"

/obj/effect/turf_decal/vg_decals/atmos/water_vapor
	icon = 'modular_nova/modules/custom_mapping/icons/bluemoon_decals.dmi'
	icon_state = "water_vapor"

// Bluemoon edit - Add reagents to cum decals
/obj/effect/decal/cleanable/cum
	decal_reagent = /datum/reagent/consumable/cum

/obj/effect/decal/cleanable/cum/Initialize(mapload, list/datum/disease/diseases, amount = 5)
	reagent_amount = amount
	return ..()

/obj/effect/decal/cleanable/cum/femcum
	decal_reagent = /datum/reagent/consumable/femcum

/obj/effect/decal/cleanable/femcum/Initialize(mapload, list/datum/disease/diseases, amount = 5)
	reagent_amount = amount
	return ..()
