/obj/item/storage/lockbox/timeclock
	name = "crew equipment lockbox"
	desc = "Holds a crew's restricted equipment while they are temporarily assigned off-duty. A service contract between Nanotrasen and Lustwish stipulates that company issued batons, masks, restraints, and other equipment are not to be used for recreational purposes. Employees may purchase recreational provisions from an approved vendor."
	icon = 'modular_nova/modules/crew_self_serve/icons/shame_box.dmi'
	icon_state = "crewbox+l"
	icon_locked = "crewbox+l"
	icon_closed = "crewbox"
	icon_broken = "crewbox+b"
	w_class = WEIGHT_CLASS_NORMAL
	req_access = list(ACCESS_ALL_PERSONAL_LOCKERS)
	/// The ID card associated with the box
	var/obj/item/card/id/associated_card

/obj/item/storage/lockbox/timeclock/Initialize(mapload, obj/item/card/id/crew_id)
	. = ..()
	// We allow any size item from the restriction list to be added to the box on creation. Players can't add items to the box themselves.
	atom_storage.allow_big_nesting = TRUE
	atom_storage.max_slots = 99
	atom_storage.max_specific_storage = WEIGHT_CLASS_GIGANTIC
	atom_storage.max_total_storage = 99
	if(!isnull(crew_id) || !istype(crew_id))
		associated_card = crew_id

	if(associated_card && associated_card.trim)
		var/datum/id_trim/card_trim = associated_card.trim
		name = "[lowertext(card_trim.assignment)] equipment lockbox ([associated_card.registered_name])"

/// Timeclock boxes can only be opened while the crew member is on duty, or by a command member with the proper access.
/obj/item/storage/lockbox/timeclock/check_access(obj/item/crew_id)
	if(isnull(crew_id))
		return FALSE

	var/obj/item/card/id/access_card
	if(istype(crew_id, /obj/item/modular_computer/pda))
		var/obj/item/modular_computer/pda/crew_pda = crew_id
		access_card = crew_pda.computer_id_slot
	else
		access_card = crew_id

	if(isnull(access_card))
		return FALSE
	if(!istype(access_card))
		return FALSE
	if(check_access_list(access_card.GetAccess()))
		release_contents()
		return TRUE
	if(access_card != associated_card)
		return FALSE

	var/datum/id_trim/job/current_trim = access_card.trim
	if(isnull(current_trim))
		return FALSE
	if(istype(current_trim, /datum/id_trim/job/assistant))
		return FALSE

	release_contents()
	return TRUE

/// Timeclock boxes are one time use. When unlocked, release the contents and go away.
/obj/item/storage/lockbox/timeclock/proc/release_contents()
	emptyStorage()
	usr.visible_message(span_notice("[usr] activates the lockbox mechanism, releasing its contents before vanishing in a puff of bluespace smoke!"))
	associated_card = null
	do_admin_sparks(number = 10, cardinals_only = FALSE, source = src)
	qdel(src)
