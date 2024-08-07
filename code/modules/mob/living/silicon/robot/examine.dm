// Bluemoon ed[p_They()] - Cyborg gender
/mob/living/silicon/robot/examine(mob/user)
	. = list("<span class='info'>This is [icon2html(src, user)] <EM>[src]</EM>!")
	if(desc)
		. += "[desc]"

	var/model_name = model ? "\improper [model.name]" : "\improper Default"
	. += "\n[p_They()] [p_are()] currently \a \"[span_bold("[model_name]")]\"-type cyborg.\n"

	var/obj/act_module = get_active_held_item()
	if(act_module)
		. += "[p_They()] [p_are()] holding [icon2html(act_module, user)] \a [act_module]."
	. += get_status_effect_examinations()
	if (getBruteLoss())
		if (getBruteLoss() < maxHealth*0.5)
			. += span_warning("[p_They()] look[p_s()] slightly dented.")
		else
			. += span_warning("<B>[p_They()] look[p_s()] severely dented!</B>")
	if (getFireLoss() || getToxLoss())
		var/overall_fireloss = getFireLoss() + getToxLoss()
		if (overall_fireloss < maxHealth * 0.5)
			. += span_warning("[p_They()] look[p_s()] slightly charred.")
		else
			. += span_warning("<B>[p_They()] look[p_s()] severely burnt and heat-warped!</B>")
	if (health < -maxHealth*0.5)
		. += span_warning("[p_They()] look[p_s()] barely operational.")
	if (fire_stacks < 0)
		. += span_warning("[p_They()] [p_are()] covered in water.")
	else if (fire_stacks > 0)
		. += span_warning("[p_They()] [p_are()] coated in something flammable.")

	if(opened)
		. += span_warning("[p_Their()] cover is open and the power cell is [cell ? "installed" : "missing"].")
	else
		. += "[p_Their()] cover is closed[locked ? "" : ", and look[p_s()] unlocked"]."

	if(cell && cell.charge <= 0)
		. += span_warning("[p_Their()] battery indicator is blinking red!")

	switch(stat)
		if(CONSCIOUS)
			if(shell)
				. += "[p_They()] appear[p_s()] to be an [deployed ? "active" : "empty"] AI shell."
			else if(!client)
				. += "[p_They()] appear[p_s()] to be in stand-by mode." //afk
		if(SOFT_CRIT, UNCONSCIOUS, HARD_CRIT)
			. += span_warning("[p_They()] doesn't seem to be responding.")
		if(DEAD)
			. += span_deadsay("[p_They()] look[p_s()] like [p_their()] system is corrupted and requires a reset.")
	//NOVA ED[p_They()] ADDITION BEGIN - CUSTOMIZATION
	. += get_silicon_flavortext()
	//NOVA ED[p_They()] ADDITION END
	. += "</span>"

	. += ..()

/mob/living/silicon/robot/get_examine_string(mob/user, thats = FALSE)
	return null
