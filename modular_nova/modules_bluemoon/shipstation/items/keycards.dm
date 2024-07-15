/obj/item/key_card/marina
	name = "\improper Marina Station worker keycard"
	desc = "A master keycard, to open all the keycard-locked rooms on Marina Refueling Station.\nIt has an engraving on it that reads: \"Master Access\"."
	access_id = "marina"
	color = "#E55C01"

/obj/item/key_card/marina_master
	name = "\improper Marina Station manager keycard"
	desc = "A master keycard, to open all the keycard-locked rooms on Marina Refueling Station.\nIt has an engraving on it that reads: \"Master Access\"."
	access_id = "marina_manager"
	master_access = TRUE
	color = "#C4004E"

/obj/item/storage/box/ids/marina
	name = "box of spare keycards"
	desc = "Contains many spare Marina keycards."
	illustration = "id"

/obj/item/storage/box/ids/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/key_card/marina(src)
