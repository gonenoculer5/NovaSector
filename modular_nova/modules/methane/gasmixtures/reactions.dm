// Bluemoon edit - Methane gas
/**
 * Methane combustion:
 *
 * Combustion of oxygen and methane.
 * Highly exothermic.
 * Creates hotspots.
 */
/datum/gas_reaction/methanefire
	priority_group = PRIORITY_FIRE
	name = "Methane Combustion"
	id = "methanefire"
	expands_hotspot = TRUE
	desc = "Combustion of methane with oxygen. Extremely exothermic, which makes it very useful as a fuel source."

/datum/gas_reaction/methanefire/init_reqs()
	requirements = list(
		/datum/gas/methane = MINIMUM_MOLE_COUNT,
		/datum/gas/oxygen = MINIMUM_MOLE_COUNT * 2,
		"MIN_TEMP" = METHANE_MINIMUM_BURN_TEMPERATURE,
	)

/datum/gas_reaction/methanefire/react(datum/gas_mixture/air, datum/holder)
	var/list/cached_gases = air.gases //this speeds things up because accessing datum vars is slow
	var/old_heat_capacity = air.heat_capacity()
	var/temperature = air.temperature
	
	var/burned_fuel = min(cached_gases[/datum/gas/methane][MOLES] / FIRE_METHANE_BURN_RATE_DELTA, cached_gases[/datum/gas/oxygen][MOLES] / (FIRE_METHANE_BURN_RATE_DELTA * METHANE_OXYGEN_FULLBURN), cached_gases[/datum/gas/methane][MOLES], cached_gases[/datum/gas/oxygen][MOLES] * INVERSE(0.5))
	if(burned_fuel <= 0 || cached_gases[/datum/gas/methane][MOLES] - burned_fuel < 0 || cached_gases[/datum/gas/oxygen][MOLES] - burned_fuel * 0.5 < 0) //Shouldn't produce gas from nothing.
		return NO_REACTION

	cached_gases[/datum/gas/methane][MOLES] -= burned_fuel
	cached_gases[/datum/gas/oxygen][MOLES] -= burned_fuel * 2
	ASSERT_GAS(/datum/gas/water_vapor, air)
	ASSERT_GAS(/datum/gas/carbon_dioxide, air)
	cached_gases[/datum/gas/water_vapor][MOLES] += burned_fuel * 2
	cached_gases[/datum/gas/carbon_dioxide][MOLES] += burned_fuel

	air.reaction_results[type] = burned_fuel

	var/energy_released = FIRE_METHANE_ENERGY_RELEASED * burned_fuel
	if(energy_released > 0)
		var/new_heat_capacity = air.heat_capacity()
		if(new_heat_capacity > MINIMUM_HEAT_CAPACITY)
			air.temperature = (temperature * old_heat_capacity + energy_released) / new_heat_capacity

	//let the floor know a fire is happening
	var/turf/open/location = holder
	if(istype(location))
		temperature = air.temperature
		if(temperature > FIRE_MINIMUM_TEMPERATURE_TO_EXIST)
			location.hotspot_expose(temperature, CELL_VOLUME)

	return burned_fuel ? REACTING : NO_REACTION

// Bluemoon edit - Methane gas
/**
 * Methane to Hydrogen Reforming:
 *
 * Formation of Hydrogen from Methane and H2O.
 * Endothermic.
 */
/datum/gas_reaction/methane_reformation
	priority_group = PRIORITY_FORMATION
	name = "Methane Reformation"
	id = "methanereformation"
	desc = "Reforming of methane into hydrogen with high-temperature H2O as a catalyst."

/datum/gas_reaction/methane_reformation/init_reqs()
	requirements = list(
		/datum/gas/methane = MINIMUM_MOLE_COUNT,
		/datum/gas/water_vapor = MINIMUM_MOLE_COUNT,
		"MIN_TEMP" = METHANE_REFORMATION_MIN_TEMPERATURE,
		"MAX_TEMP" = METHANE_REFORMATION_MAX_TEMPERATURE,
	)

/datum/gas_reaction/methane_reformation/react(datum/gas_mixture/air)
	var/pressure = air.return_pressure()
	if(pressure < METHANE_REFORMATION_MIN_PRESSURE || pressure > METHANE_REFORMATION_MAX_PRESSURE)
		return NO_REACTION

	var/list/cached_gases = air.gases
	var/temperature = air.temperature
	var/volume = air.return_volume()
	// More volume and less pressure gives better rates
	var/environment_effciency = volume/pressure
	var/heat_efficency = min(temperature * 0.005 * environment_effciency, cached_gases[/datum/gas/methane][MOLES], cached_gases[/datum/gas/water_vapor][MOLES])
	if ((cached_gases[/datum/gas/methane][MOLES] - heat_efficency * 0.5 < 0 ) || (cached_gases[/datum/gas/water_vapor][MOLES] - heat_efficency < 0))
		return NO_REACTION // Shouldn't produce gas from nothing.

	var/old_heat_capacity = air.heat_capacity()
	cached_gases[/datum/gas/methane][MOLES] -= heat_efficency
	cached_gases[/datum/gas/water_vapor][MOLES] -= heat_efficency
	ASSERT_GAS(/datum/gas/hydrogen, air)
	ASSERT_GAS(/datum/gas/carbon_dioxide, air)
	cached_gases[/datum/gas/hydrogen][MOLES] += heat_efficency * METHANE_REFORMATION_RATIO
	cached_gases[/datum/gas/carbon_dioxide][MOLES] += heat_efficency

	air.reaction_results[type] = heat_efficency * METHANE_REFORMATION_RATIO

	var/energy_used = heat_efficency * METHANE_REFORMATION_ENERGY
	var/new_heat_capacity = air.heat_capacity()
	// The air cools down when reforming.
	if(new_heat_capacity > MINIMUM_HEAT_CAPACITY)
		air.temperature = max(((temperature * old_heat_capacity - energy_used) / new_heat_capacity), TCMB)
	return REACTING


// Bluemoon edit - Methane gas
/**
 * Sabatier reaction. CO2/Hydrogen to Methane Reforming:
 *
 * Formation of Methane from CO2 and Hydrogen.
 * Exothermic.
 */
/datum/gas_reaction/sabatier_reaction
	priority_group = PRIORITY_FORMATION
	name = "Sabatier Reaction"
	id = "co2h2reformation"
	desc = "Reforming of CO2 and hydrogen into methane with high temperature."

/datum/gas_reaction/sabatier_reaction/init_reqs()
	requirements = list(
		/datum/gas/hydrogen = MINIMUM_MOLE_COUNT * 4,
		/datum/gas/carbon_dioxide = MINIMUM_MOLE_COUNT,
		"MIN_TEMP" = SABATIER_REFORMATION_MIN_TEMPERATURE,
		"MAX_TEMP" = SABATIER_REFORMATION_MAX_TEMPERATURE,
	)

/datum/gas_reaction/sabatier_reaction/react(datum/gas_mixture/air)
	var/pressure = air.return_pressure()
	if(pressure < SABATIER_REFORMATION_MIN_PRESSURE || pressure > SABATIER_REFORMATION_MAX_PRESSURE)
		return NO_REACTION

	var/list/cached_gases = air.gases
	var/temperature = air.temperature
	var/volume = air.return_volume()
	// More pressure and less volume gives better rates
	var/environment_effciency = pressure/volume
	var/heat_efficency = min(temperature * 0.005 * environment_effciency, cached_gases[/datum/gas/hydrogen][MOLES], cached_gases[/datum/gas/carbon_dioxide][MOLES])
	if ((cached_gases[/datum/gas/hydrogen][MOLES] - heat_efficency * 0.5 < 0 ) || (cached_gases[/datum/gas/carbon_dioxide][MOLES] - heat_efficency < 0))
		return NO_REACTION // Shouldn't produce gas from nothing.

	var/old_heat_capacity = air.heat_capacity()
	cached_gases[/datum/gas/hydrogen][MOLES] -= heat_efficency * 4
	cached_gases[/datum/gas/carbon_dioxide][MOLES] -= heat_efficency
	ASSERT_GAS(/datum/gas/methane, air)
	ASSERT_GAS(/datum/gas/water_vapor, air)
	cached_gases[/datum/gas/methane][MOLES] += heat_efficency * SABATIER_REFORMATION_METHANE_RATIO
	cached_gases[/datum/gas/water_vapor][MOLES] += heat_efficency * SABATIER_REFORMATION_H2O_RATIO

	air.reaction_results[type] = heat_efficency * (SABATIER_REFORMATION_H2O_RATIO + SABATIER_REFORMATION_METHANE_RATIO)

	var/energy_used = heat_efficency * SABATIER_REFORMATION_ENERGY
	var/new_heat_capacity = air.heat_capacity()
	// The air cools down when reforming.
	if(new_heat_capacity > MINIMUM_HEAT_CAPACITY)
		air.temperature = max(((temperature * old_heat_capacity - energy_used) / new_heat_capacity), TCMB)
	return REACTING
