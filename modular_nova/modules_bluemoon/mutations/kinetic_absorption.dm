/datum/mutation/human/kinetic
	name = "Kinetic Absorption"
	desc = "The user's body is chemically altered to be more elastic, making it resilient against impacts and bruising."
	quality = POSITIVE
	text_gain_indication = "<span class='warning'>Your body feels bouncy and light-weight!</span>"
	text_lose_indication = "<span class='notice'>Your body loses its bouncy and light-weight feeling...</span>"
	difficulty = 12
	instability = 5
	synchronizer_coeff = 1

/datum/mutation/human/fire/on_acquiring(mob/living/carbon/human/owner)
	if(..())
		return
	owner.physiology.brute_mod *= 0.5

/datum/mutation/human/fire/on_losing(mob/living/carbon/human/owner)
	if(..())
		return
	owner.physiology.brute_mod *= 2
