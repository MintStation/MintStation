/datum/job/mint_centcom/admiral
	title = JOB_CCNT_ADMIRAL
	description = "A high-ranking official holding the highest executive power in Central Command."
	supervisors = "NanoTrasen Supreme Command"
	total_positions = 1
	spawn_positions = 1
	config_tag = "CENTCOM_ADMIRAL"
	outfit = /datum/outfit/job/mint_centcom/admiral

/datum/outfit/job/mint_centcom/admiral
	name = "Central Command Admiral"
	jobtype = /datum/job/mint_centcom/admiral
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/nanotrasen_consultant/admiral
	belt = /obj/item/modular_computer/pda/nanotrasen_consultant
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
	. = ..()
	var/datum/martial_art/cqc/admiral_cqc = new()
	admiral_cqc.teach(equipped_on)

/*datum/outfit/job/mint_centcom/admiral //MINT EDIT: START (possibly broken)
	name = "Central Command Admiral"
	jobtype = /datum/job/mint_centcom/admiral
	backpack_contents = list(
		/obj/item/clipboard = 1,
		/obj/item/folder = 1,
		/obj/item/gun/ballistic/revolver/ocelot = 1
)
	belt = /obj/item/modular_computer/pda/nanotrasen_consultant */

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
