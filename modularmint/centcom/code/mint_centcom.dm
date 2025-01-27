/datum/job/mint_centcom
	department_head = list(JOB_CENTCOM)
	faction = FACTION_STATION

	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

	department_for_prefs = /datum/job_department/central_command

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/central_command
	)

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

	antagonist_restricted = TRUE
	veteran_only = TRUE
	allow_bureaucratic_error = FALSE
	req_admin_notify = TRUE
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS

/datum/outfit/job/mint_centcom/post_equip(mob/living/carbon/human/centcom_member, visuals_only = FALSE)
	. = ..()
	if(visuals_only)
		return

	var/obj/item/implant/mindshield/mindshield = new /obj/item/implant/mindshield(centcom_member)//hmm lets have centcom officials become revs
	mindshield.implant(centcom_member, null, silent = TRUE)

// Желательно завести отдельный трим для ЦК или в job_changes
/datum/id_trim/job/nanotrasen_consultant/admiral
	job = /datum/job/mint_centcom/admiral

/datum/id_trim/job/nanotrasen_consultant/admiral/New()
	minimal_access |= list(JOB_CENTCOM_ADMIRAL)
	. = ..()

/datum/id_trim/job/nanotrasen_consultant/officer
	job = /datum/job/mint_centcom/officer

/datum/id_trim/job/nanotrasen_consultant/officer/New()
	minimal_access |= list(JOB_CENTCOM_OFFICIAL)
	. = ..()
