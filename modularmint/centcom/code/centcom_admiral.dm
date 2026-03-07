/datum/job/centcom_admiral
	title = JOB_CCNT_ADMIRAL
	description = "A high-ranking official who is the highest executive power in Central Command"
	department_head = list(JOB_CENTCOM)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "Central Command"
	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CENTCOM_ADMIRAL"

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/central_command
	)

	outfit = /datum/outfit/centcom/naval/admiral_centcom_admiral

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
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS

/datum/id_trim/centcom/naval/centcom_admiral
	assignment = JOB_CCNT_ADMIRAL

/datum/outfit/centcom/naval/admiral_centcom_admiral
	id_trim = /datum/id_trim/centcom/naval/centcom_admiral
/*
/obj/effect/landmark/start/centcom_admiral
	name = "CentCom Admiral"
	icon_state = "admiral"
	icon = 'modularmint/centcom/icons/landmarks.dmi'

	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/centcom_admiral/after_round_start()
	return
*/
