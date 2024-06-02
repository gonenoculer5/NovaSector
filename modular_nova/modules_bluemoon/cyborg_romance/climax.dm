#define CLIMAX_VAGINA "Vagina"
#define CLIMAX_PENIS "Penis"
#define CLIMAX_BOTH "Both"

#define CLIMAX_ON_FLOOR "On the floor"
#define CLIMAX_IN_OR_ON "Climax in or on someone"
// Bluemoon edit - Climax in containers
#define CLIMAX_IN_CONTAINER "Climax in container"

/// Tries to add the specified amount to the target reagent container, or removes it if none are available. Keeps in mind internal_fluid_count.
/mob/living/silicon/robot/proc/transfer_climax_fluid(datum/reagent/fluid_type, datum/reagents/reagent_container = null, attempt_amount)
	attempt_amount = clamp(attempt_amount, 0, 60)
	if(reagent_container)
		reagent_container.add_reagent(fluid_type, attempt_amount)

/mob/living/silicon/robot/proc/climax(manual = TRUE)
	if (CONFIG_GET(flag/disable_erp_preferences))
		return

	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp/autocum) && !manual)
		return
	if(refractory_period > REALTIMEOFDAY)
		return
	refractory_period = REALTIMEOFDAY + 30 SECONDS
	if(has_status_effect(/datum/status_effect/climax_cooldown) || !client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	// Reduce pop-ups and make it slightly more frictionless (lewd).
	var/climax_choice = CLIMAX_BOTH

	if(manual)
		var/list/genitals = list(CLIMAX_VAGINA, CLIMAX_PENIS, CLIMAX_BOTH)
		climax_choice = tgui_alert(src, "You are climaxing, choose which genitalia to climax with.", "Genitalia Preference!", genitals)

	var/self_their = p_their()

	if(climax_choice == CLIMAX_PENIS || climax_choice == CLIMAX_BOTH)
		// Bluemoon edit - Cyborg interactions
		var/list/interactable_inrange_partners = list(src)

		// Bluemoon edit - Climax in containers
		var/list/fillable_inrange_containers = list() 		// Bluemoon edit - Climax in containers
		var/list/atoms_in_view = (view(1, src) - src)
		for(var/mob/living/carbon/human/iterating_human in atoms_in_view)
			interactable_inrange_partners[iterating_human.name] = iterating_human

		// Bluemoon edit - Cyborg interactions
		for(var/mob/living/silicon/robot/iterating_robot in atoms_in_view)
			interactable_inrange_partners[iterating_robot.name] = iterating_robot

		// Bluemoon edit - Climax in containers
		for(var/obj/item/reagent_containers/iterating_container in atoms_in_view)
			if((iterating_container.reagent_flags & OPENCONTAINER) || (iterating_container.reagent_flags & DUNKABLE))
				fillable_inrange_containers[iterating_container.name] = iterating_container

		var/list/buttons = list(CLIMAX_ON_FLOOR)
		if(interactable_inrange_partners.len)
			buttons += CLIMAX_IN_OR_ON
		// Bluemoon edit - Climax in containers
		if(fillable_inrange_containers.len)
			buttons += CLIMAX_IN_CONTAINER

		var/penis_climax_choice = tgui_alert(src, "Choose where to shoot your load.", "Load preference!", buttons)

		var/create_cum_decal = FALSE

		if(!penis_climax_choice || penis_climax_choice == CLIMAX_ON_FLOOR)
			create_cum_decal = TRUE
			visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
				span_userlove("You shoot string after string of hot cum, hitting the floor!"))

		// Bluemoon edit - Climax in containers
		else if(penis_climax_choice == CLIMAX_IN_CONTAINER)
			var/target_choice = tgui_input_list(src, "Choose a container to cum in.", "Choose target!", fillable_inrange_containers)
			if(!target_choice)
				create_cum_decal = TRUE
				visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
					span_userlove("You shoot string after string of hot cum, hitting the floor!"))
			else
				visible_message(span_userlove("[src] shoots [self_their] sticky load into [target_choice]!"), \
					span_userlove("You shoot string after string of hot cum into [target_choice]!"))
				var/obj/item/reagent_containers/container = fillable_inrange_containers[target_choice]
				transfer_climax_fluid(/datum/reagent/consumable/cum, container.reagents, 60)
		else
			var/target_choice = tgui_input_list(src, "Choose a person to cum in or on.", "Choose target!", interactable_inrange_partners)
			if(!target_choice)
				create_cum_decal = TRUE
				visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
					span_userlove("You shoot string after string of hot cum, hitting the floor!"))
			else
				var/mob/living/target = interactable_inrange_partners[target_choice]
				var/mob/living/carbon/human/target_human
				if(ishuman(target))
					target_human = target
					
				var/target_them = target.p_them()

				var/list/target_buttons = list()

				if(!target_human)
					target_buttons += "mouth"
					target_buttons += "asshole"
					target_buttons += "sheath"
				else
					if(!target_human.wear_mask)
						target_buttons += "mouth"
					if(target_human.has_vagina(REQUIRE_GENITAL_EXPOSED))
						target_buttons += ORGAN_SLOT_VAGINA
					if(target_human.has_anus(REQUIRE_GENITAL_EXPOSED))
						target_buttons += "asshole"
					if(target_human.has_penis(REQUIRE_GENITAL_EXPOSED))
						var/obj/item/organ/external/genital/penis/other_penis = target_human.get_organ_slot(ORGAN_SLOT_PENIS)
						if(other_penis.sheath != "None")
							target_buttons += "sheath"

				target_buttons += "On [target_them]"

				var/climax_into_choice = tgui_input_list(src, "Where on or in [target] do you wish to cum?", "Final frontier!", target_buttons)

				if(!climax_into_choice)
					create_cum_decal = TRUE
					visible_message(span_userlove("[src] shoots their sticky load onto the floor!"), \
						span_userlove("You shoot string after string of hot cum, hitting the floor!"))
					// Bluemoon edit - Climax in containers
				else if(climax_into_choice == "On [target_them]")
					create_cum_decal = TRUE
					visible_message(span_userlove("[src] shoots their sticky load onto [target]!"), \
						span_userlove("You shoot string after string of hot cum onto [target]!"))
				else
					visible_message(span_userlove("[src] hilts [self_their] cock into [target]'s [climax_into_choice], shooting cum into [target_them]!"), \
						span_userlove("You hilt your cock into [target]'s [climax_into_choice], shooting cum into [target_them]!"))
					to_chat(target, span_userlove("Your [climax_into_choice] fills with warm cum as [src] shoots [self_their] load into it."))
					// Bluemoon edit - Climax in containers
					if(target_human && climax_into_choice == "mouth")
						var/obj/item/organ/internal/stomach/belly = target_human.get_organ_slot(ORGAN_SLOT_STOMACH)
						if(belly)
							transfer_climax_fluid(/datum/reagent/consumable/cum, belly.reagents, 15)

			if(create_cum_decal)
				add_cum_splatter_floor(get_turf(src))

		if(climax_choice == CLIMAX_PENIS)
			apply_status_effect(/datum/status_effect/climax)
			apply_status_effect(/datum/status_effect/climax_cooldown)
			return TRUE

	if(climax_choice == CLIMAX_VAGINA || climax_choice == CLIMAX_BOTH)
		visible_message(span_userlove("[src] twitches and moans as [p_they()] climax from their vagina!"), span_userlove("You twitch and moan as you climax from your vagina!"))
		add_cum_splatter_floor(get_turf(src), female = TRUE)

	apply_status_effect(/datum/status_effect/climax)
	apply_status_effect(/datum/status_effect/climax_cooldown)
	return TRUE

#undef CLIMAX_VAGINA
#undef CLIMAX_PENIS
#undef CLIMAX_BOTH
#undef CLIMAX_ON_FLOOR
#undef CLIMAX_IN_OR_ON
// Bluemoon edit - Climax in containers
#undef CLIMAX_IN_CONTAINER
