// Bluemoon edit - Methane gas
/datum/gas_reaction/methanefire/init_factors()
	factor = list(
		/datum/gas/oxygen = "Oxygen is consumed at 2 moles per mole of methane consumed. Higher oxygen concentration up to [METHANE_OXYGEN_FULLBURN] times the methane increases the methane consumption rate.",
		/datum/gas/methane = "Methane is consumed as long as there's enough oxygen to allow combustion.",
		/datum/gas/water_vapor = "Water vapor is produced at 2 mole per mole of methane combusted.",
		/datum/gas/carbon_dioxide = "Carbon dioxide is produced at 1 mole per mole of methane combusted.",
		"Temperature" = "Minimum temperature of [FIRE_MINIMUM_TEMPERATURE_TO_EXIST] kelvin to occur.",
		"Energy" = "[FIRE_METHANE_ENERGY_RELEASED] joules of energy is released per mole of methane consumed.",
	)


/datum/gas_reaction/methane_reformation/init_factors()
	factor = list(
		/datum/gas/water_vapor = "Water vapor needs to be present for the reaction to occur. Water vapor consumed at 1 mole per mole of methane reformed.",
		/datum/gas/methane = "Methane needs to be present for the reaction to occur. Methane is consumed at 1 mole per 3 moles of hydrogen formed.",
		/datum/gas/carbon_dioxide = "Carbon dioxide is produced at 1 mole per mole of methane reformed.",
		/datum/gas/hydrogen = "Hydrogen gets produced rapidly at 3 moles per mole of methane reformed.",
		"Temperature" = "Can only occur between [METHANE_REFORMATION_MIN_TEMPERATURE] - [METHANE_REFORMATION_MAX_TEMPERATURE] Kelvin",
		"Pressure" = "Can only occur between [METHANE_REFORMATION_MIN_PRESSURE] - [METHANE_REFORMATION_MAX_PRESSURE] Kilopascals.",
		"Energy" = "[METHANE_REFORMATION_ENERGY] joules of energy is absorbed per mole of methane reformed.",
	)
