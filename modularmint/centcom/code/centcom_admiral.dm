var/datum/martial_art/cqc/admiral_cqc
/datum/job/mint_centcom/admiral
	title = JOB_CCNT_ADMIRAL
	description = "A high-ranking official holding the highest executive power in Central Command."
	department_head = list(JOB_CENTCOM)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "NanoTrasen Supreme Command"
	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CENTCOM_ADMIRAL"

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/central_command
	)
	outfit = /datum/outfit/job/mint_centcom/admiral

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


/*datum/outfit/job/mint_centcom/admiral //MINT EDIT: START (possibly broken)
	name = "Central Command Admiral"
	jobtype = /datum/job/mint_centcom/admiral
	backpack_contents = list(
		/obj/item/clipboard = 1,
		/obj/item/folder = 1,
		/obj/item/gun/ballistic/revolver/ocelot = 1
)
	belt = /obj/item/modular_computer/pda/nanotrasen_consultant */

/datum/outfit/job/mint_centcom/admiral //MINT EDIT: START
	name = "Central Command Admiral"
	jobtype = /datum/job/mint_centcom/admiral
	id_trim = /datum/id_trim/centcom/official
	head = /obj/item/clothing/head/hats/centcom_cap
	neck = /obj/item/clothing/neck/pauldron/commander
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/naval
	uniform = /obj/item/clothing/under/rank/centcom/nova/naval/commander
	gloves = /obj/item/clothing/gloves/combat/naval
	backpack_contents = list(
		/obj/item/clipboard = 1,
		/obj/item/folder = 1,
		/obj/item/gun/ballistic/revolver/ocelot = 1
	)
/datum/outfit/job/mint_centcom/admiral/post_equip(mob/living/carbon/human/equipped_on, visualsOnly=FALSE)
	var/datum/martial_art/cqc/admiral_cqc = new();
	admiral_cqc.teach(equipped_on);

/datum/job/mint_centcom/admiral/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if (!ishuman(spawned))
		return
	var/mob/living/carbon/human/human_spawned = spawned

	if (human_spawned.mind)
		var/success = admiral_cqc.teach(human_spawned, make_temporary = FALSE)
		if (success)
			to_chat(human_spawned, span_boldnotice("You are trained in Close Quarters Combat!"))

//MINT EDIT: END
/*
/obj/effect/landmark/start/mint_centcom/admiral
	name = "CentCom Admiral"
	icon_state = "admiral"
	icon = 'modularmint/centcom/icons/landmarks.dmi'

	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/mint_centcom/admiral/after_round_start()
	return
*/
