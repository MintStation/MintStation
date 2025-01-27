/datum/job/mint_centcom/officer
	title = JOB_CCNT_OFFICER
	description = "Elite NanoTrasen officers that work in Central Command. They should work with requests from the station and provide support if necessary."
	supervisors = "Central Command Admiral"
	total_positions = 4
	spawn_positions = 4
	config_tag = "CENTCOM_OFFICER"
	outfit = /datum/outfit/job/mint_centcom/officer

/datum/outfit/job/mint_centcom/officer
	name = "Central Command Officer"
	jobtype = /datum/job/mint_centcom/officer
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/nanotrasen_consultant
	belt = /obj/item/modular_computer/pda/nanotrasen_consultant
	head = /obj/item/clothing/head/hats/centcom_cap
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/naval
	uniform = /obj/item/clothing/under/rank/centcom/nova/naval/commander
	gloves = /obj/item/clothing/gloves/combat

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
