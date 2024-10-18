#define WHITELISTFILE "[global.config.directory]/whitelist.txt"

/datum/tgs_chat_command/clear_character_prefs
	name = "clearcache"
	help_text = "Clears the chatacter preferences cache for a specific player ckey. Useful after importing save files. Usage: clearcache <ckey>"
	admin_only = TRUE

/datum/tgs_chat_command/clear_character_prefs/Run(datum/tgs_chat_user/sender, params)
	var/player_key = ckey(params)
	var/character_preference = GLOB.preferences_datums[player_key]
	if(!character_preference)
		return new /datum/tgs_message_content("Failed to clear character preferences for player \"[player_key]\". (User hasn't logged in yet, or prefs were already cleared!)")

	GLOB.preferences_datums[player_key] = null
	return new /datum/tgs_message_content("Successfully cleared character preferences for player \"[player_key]\".")

/datum/tgs_chat_command/whitelist_player
	name = "whitelist"
	help_text = "Adds a player ckey to the whitelist file. Usage: whitelist <ckey>"
	admin_only = TRUE

/datum/tgs_chat_command/whitelist_player/Run(datum/tgs_chat_user/sender, params)
	var/player_key = ckey(params)
	if(player_key in GLOB.whitelist)
		return new /datum/tgs_message_content("Failed to whitelist player \"[player_key]\". (Player is already whitelisted!)")

	var/whitelist_file = file(WHITELISTFILE)
	whitelist_file << player_key + "\n"
	return new /datum/tgs_message_content("Successfully whitelisted player \"[player_key]\".")

#undef WHITELISTFILE
