#define SOLFED_AMT "amount"
#define SOLFED_VOTES "votes"
#define SOLFED_DECLARED "declared"
#define SOLFED_FINE_AMOUNT -20000

#define EMERGENCY_RESPONSE_POLICE "WOOP WOOP THAT'S THE SOUND OF THE POLICE"
#define EMERGENCY_RESPONSE_ATMOS "DISCO INFERNO"
#define EMERGENCY_RESPONSE_EMT "AAAAAUGH, I'M DYING, I NEEEEEEEEEED A MEDIC BAG"
#define EMERGENCY_RESPONSE_EMAG "AYO THE PIZZA HERE"

/// Internal. Polls ghosts and sends in a team of space cops according to the alert level, accompanied by an announcement.
/obj/machinery/computer/centcom_console/proc/call_911(ordered_team)
	var/team_size
	var/datum/antagonist/ert/cops_to_send
	var/announcement_message = "sussus amogus"
	var/announcer = "Sol Federation Marshal Department"
	var/poll_question = "fuck you leatherman"
	var/cell_phone_number = "911"
	var/list_to_use = "911_responders"
	switch(ordered_team)
		if(EMERGENCY_RESPONSE_POLICE)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/police
			announcement_message = "Crewmembers of [station_name()]. this is the Sol Federation. We've received a request for immediate marshal support, and we are \
				sending our best marshals to support your station.\n\n\
				If the first responders request that they need SWAT support to do their job, or to report a faulty 911 call, we will send them in at additional cost to your station to the \
				tune of $20,000.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Sol Federation Marshal Department"
			poll_question = "The station has called for the Marshals. Will you respond?"
		if(EMERGENCY_RESPONSE_ATMOS)
			team_size = tgui_input_number(usr, "How many techs would you like dispatched?", "How badly did you screw up?", 3, 3, 1)
			cops_to_send = /datum/antagonist/ert/request_911/atmos
			announcement_message = "Crewmembers of [station_name()]. this is the Sol Federation's 811 dispatch. We've received a report of stationwide structural damage, atmospherics loss, fire, or otherwise, and we are \
				sending an Advanced Atmospherics team to support your station.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Sol Federation 811 Dispatch - Advanced Atmospherics"
			poll_question = "The station has called for an advanced engineering support team. Will you respond?"
			cell_phone_number = "911"	//This needs to stay so they can communicate with SWAT
		if(EMERGENCY_RESPONSE_EMT)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/request_911/emt
			announcement_message = "Crewmembers of [station_name()]. this is the Sol Federation. We've received a request for immediate medical support, and we are \
				sending our best emergency medical technicians to support your station.\n\n\
				If the first responders request that they need SWAT support to do their job, or to report a faulty 911 call, we will send them in at additional cost to your station to the \
				tune of $20,000.\n\n\
				The transcript of the call is as follows:\n\
				[GLOB.call_911_msg]"
			announcer = "Sol Federation EMTs"
			poll_question = "The station has called for medical support. Will you respond?"
		if(EMERGENCY_RESPONSE_EMAG)
			team_size = 8
			cops_to_send = /datum/antagonist/ert/pizza/false_call
			announcement_message = "Thank you for ordering from Dogginos, [GLOB.pizza_order]! We're sending you that extra-large party package pizza delivery \
				right away!\n\n\
				Thank you for choosing our premium Fifteen Minutes or Less delivery option! Our pizza will be at your doorstep at [station_name()] as soon as possible thanks \
				to our lightning-fast warp drives installed on all Dogginos delivery shuttles!\n\
				Distance from your chosen Dogginos: 70,000 Lightyears"
			announcer = "Dogginos"
			poll_question = "The station has ordered $35,000 in pizza. Will you deliver?"
			cell_phone_number = "Dogginos"
			list_to_use = "dogginos"
	priority_announce(announcement_message, announcer, 'sound/effects/families_police.ogg', has_important_message=TRUE, color_override = "yellow")
	var/list/candidates = SSpolling.poll_ghost_candidates(
		poll_question,
		check_jobban = ROLE_DEATHSQUAD,
		alert_pic = /obj/item/solfed_reporter,
		role_name_text = cops_to_send::name,
	)

	if(length(candidates))
		//Pick the (un)lucky players
		var/agents_number = min(team_size, candidates.len)

		var/list/spawnpoints = GLOB.emergencyresponseteamspawn
		var/index = 0
		GLOB.solfed_responder_info[list_to_use][SOLFED_AMT] = agents_number
		while(agents_number && candidates.len)
			var/spawn_loc = spawnpoints[index + 1]
			//loop through spawnpoints one at a time
			index = (index + 1) % spawnpoints.len
			var/mob/dead/observer/chosen_candidate = pick(candidates)
			candidates -= chosen_candidate
			if(!chosen_candidate.key)
				continue

			//Spawn the body
			var/mob/living/carbon/human/cop = new(spawn_loc)
			chosen_candidate.client.prefs.safe_transfer_prefs_to(cop, is_antag = TRUE)
			cop.key = chosen_candidate.key

			//Give antag datum
			var/datum/antagonist/ert/request_911/ert_antag = new cops_to_send

			cop.mind.add_antag_datum(ert_antag)
			cop.mind.set_assigned_role(SSjob.GetJobType(ert_antag.ert_job_path))
			SSjob.SendToLateJoin(cop)
			cop.grant_language(/datum/language/common, source = LANGUAGE_SPAWNER)

			if(cops_to_send == /datum/antagonist/ert/request_911/atmos) // charge for atmos techs
				var/datum/bank_account/station_balance = SSeconomy.get_dep_account(ACCOUNT_CAR)
				station_balance?.adjust_money(GLOB.solfed_tech_charge)
			else
				var/obj/item/gangster_cellphone/phone = new() // biggest gang in the city
				phone.gang_id = cell_phone_number
				phone.name = "[cell_phone_number] branded cell phone"
				phone.w_class = WEIGHT_CLASS_SMALL	//They get that COMPACT phone hell yea
				var/phone_equipped = phone.equip_to_best_slot(cop)
				if(!phone_equipped)
					to_chat(cop, "Your [phone.name] has been placed at your feet.")
					phone.forceMove(get_turf(cop))

			//Logging and cleanup
			log_game("[key_name(cop)] has been selected as an [ert_antag.name]")
			if(cops_to_send == /datum/antagonist/ert/request_911/atmos)
				log_game("[abs(GLOB.solfed_tech_charge)] has been charged from the station budget for [key_name(cop)]")
			agents_number--
	GLOB.cops_arrived = TRUE
	return TRUE

/obj/machinery/computer/centcom_console/proc/pre_911_check(mob/user)
	if (!authenticated_as_silicon_or_captain(user))
		return FALSE

	if (GLOB.cops_arrived)
		to_chat(user, span_warning("911 has already been called this shift!"))
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return FALSE

	if (!issilicon(user))
		var/obj/item/held_item = user.get_active_held_item()
		var/obj/item/card/id/id_card = held_item?.GetID()
		if (!istype(id_card))
			to_chat(user, span_warning("You need to swipe your ID!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
		if (!(ACCESS_CAPTAIN in id_card.access))
			to_chat(user, span_warning("You are not authorized to do this!"))
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return FALSE
	else
		to_chat(user, "The console refuses to let you dial 911 as an AI or Cyborg!")
		return FALSE
	return TRUE

/obj/machinery/computer/centcom_console/proc/calling_911(mob/user, called_group_pretty = "EMTs", called_group = EMERGENCY_RESPONSE_EMT)
	message_admins("[ADMIN_LOOKUPFLW(user)] is considering calling the Sol Federation [called_group_pretty].")
	var/call_911_msg_are_you_sure = "Are you sure you want to call 911? Faulty 911 calls results in a $20,000 fine and a 5 year superjail \
		sentence."
	if(tgui_input_list(user, call_911_msg_are_you_sure, "Call 911", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has acknowledged the faulty 911 call consequences.")
	if(tgui_input_list(user, GLOB.call911_do_and_do_not[called_group], "Call [called_group_pretty]", list("Yes", "No")) != "Yes")
		return
	message_admins("[ADMIN_LOOKUPFLW(user)] has read and acknowleged the recommendations for what to call and not call [called_group_pretty] for.")
	var/reason_to_call_911 = stripped_input(user, "What do you wish to call 911 [called_group_pretty] for?", "Call 911", null, MAX_MESSAGE_LEN)
	if(!reason_to_call_911)
		to_chat(user, "You decide not to call 911.")
		return
	GLOB.cops_arrived = TRUE
	GLOB.call_911_msg = reason_to_call_911
	GLOB.caller_of_911 = user.name
	log_game("[key_name(user)] has called the Sol Federation [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	message_admins("[ADMIN_LOOKUPFLW(user)] has called the Sol Federation [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]")
	deadchat_broadcast(" has called the Sol Federation [called_group_pretty] for the following reason:\n[GLOB.call_911_msg]", span_name("[user.real_name]"), user, message_type = DEADCHAT_ANNOUNCEMENT)

	call_911(called_group)
	to_chat(user, span_notice("Authorization confirmed. 911 call dispatched to the Sol Federation [called_group_pretty]."))
	playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)

#undef EMERGENCY_RESPONSE_POLICE
#undef EMERGENCY_RESPONSE_ATMOS
#undef EMERGENCY_RESPONSE_EMT
#undef EMERGENCY_RESPONSE_EMAG
