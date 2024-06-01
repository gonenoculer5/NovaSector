/obj/effect/mapping_helpers/airlock/vented
	icon = 'modular_nova/modules/custom_mapping/icons/mapping_helpers.dmi'
	name = "airlock ventilation helper"
	icon_state = "airlock_vent_helper"


/obj/effect/mapping_helpers/airlock/vented/payload(obj/machinery/door/airlock/airlock)
	airlock.can_atmos_pass = ATMOS_PASS_YES
