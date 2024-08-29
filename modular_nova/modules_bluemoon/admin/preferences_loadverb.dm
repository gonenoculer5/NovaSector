ADMIN_VERB(character_preferences_upload, R_DEBUG, "Character Preferences - Upload", "Upload a character preferences JSON file to the server.", ADMIN_CATEGORY_MAIN)
	var/jsonfile = input(user, "Choose a JSON file to upload to replace a player save","Upload Character Preferences") as null|file
	if(!jsonfile)
		return
	if(copytext("[jsonfile]", -5) != ".json")//5 == length(".json")
		to_chat(user, span_warning("Filename must end in '.json': [jsonfile]"), confidential = TRUE)
		return
	var/player_key = input(user, "Enter player CKey to replace their save file", "Enter Player CKey")  as null|text
	if(!player_key)
		return

	var/savefile = file(jsonfile)
	var/tree
	try
		tree = json_decode(savefile)
	catch(var/exception/err)
		log_admin("Failed to load json savefile: [err]")
		message_admins("Failed to load json savefile: [err]")
		return

	var/savepath = "data/player_saves/[player_key[1]]/[player_key]/preferences.json"
	var/bacpath = savepath + ".updatebac"
	fdel(savepath)
	fdel(bacpath)
	file(savepath) << json_encode(tree)
	if(GLOB.preferences_datums[player_key])
		GLOB.preferences_datums[player_key] = null
		var/client/target_client = GLOB.directory[player_key]
		if(!target_client)
			return
		to_chat(target_client, span_danger("Kicked to finish preference file importing. Please re-connect to the server."), confidential = TRUE)
		log_admin("Kicked [player_key] to complete preference file importing.")
		message_admins("Kicked [player_key] to complete preference file importing.")
		qdel(target_client)
