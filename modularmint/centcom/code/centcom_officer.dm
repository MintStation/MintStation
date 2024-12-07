/datum/job/centcom_officer
	title = JOB_CCNT_OFFICER
	description = "Elite NanoTrasen officers that work in Central Command. They should work with requests from the station and provide support if necessary."
	department_head = list(JOB_CENTCOM)
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	supervisors = "Central Command Admiral"
	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CENTCOM_OFFICER"

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/central_command
	)

	outfit = /datum/outfit/centcom/naval/lieutenant

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD

	display_order = JOB_DISPLAY_ORDER_NANOTRASEN_CONSULTANT
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/cigarette/cigar/havana = 20,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 15,
		/obj/item/reagent_containers/cup/glass/bottle/champagne = 10
	)

	banned_quirks = list(HEAD_RESTRICTED_QUIRKS)
	banned_augments = list(HEAD_RESTRICTED_AUGMENTS)

	veteran_only = TRUE
	allow_bureaucratic_error = FALSE
	req_admin_notify = TRUE
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS


/datum/outfit/job/centcom_officer //MINT EDIT: START (possibly broken)
	name = "Central Command Officer"
	jobtype = /datum/job/centcom_officer
	backpack_contents = list(
		/obj/item/modular_computer/pda/nanotrasen_consultant = 1,
		/obj/item/clipboard = 1,
		/obj/item/folder = 1
	) //MINT EDIT: END


/*
/obj/effect/landmark/start/centcom_officer
	name = "CentCom Officer"
	icon_state = "officer"
	icon = 'modularmint/centcom/icons/landmarks.dmi'

	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/centcom_officer/after_round_start()
	return
*/
