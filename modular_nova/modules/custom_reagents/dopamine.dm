/datum/reagent/drug/aphrodisiac/dopamine
	name = "Dopamine"
	description = "A benzene ring with two hydroxyl side groups, and one amine group attached via an ethyl chain. Moderates pleasure and reward-motivated behavior."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED


/datum/chemical_reaction/dopamine
	results = list(/datum/reagent/drug/aphrodisiac/dopamine = 10)
	required_reagents = list(
		/datum/reagent/diethylamine = 1,
		/datum/reagent/hydrogen = 2,
		/datum/reagent/nitrogen = 1,
		/datum/reagent/oxygen = 2,
		/datum/reagent/phenol = 3
	)
	required_temp = 373
	mix_message = "The solution bubbles into a colorless liquid..."
	erp_reaction = TRUE
