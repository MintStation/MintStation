/datum/supply_pack
	var/iscentcom = FALSE

// CentCom categories

/datum/supply_pack/centcom
	hidden = TRUE
	iscentcom = TRUE
	crate_type = /obj/structure/closet/crate/centcom

/datum/supply_pack/centcom/general
	group = "General"

/datum/supply_pack/centcom/weapon
	group = "Weaponry"

/datum/supply_pack/centcom/armor
	group = "Armory"

/datum/supply_pack/centcom/limited
	group = "Limited"

// CentCom General

/datum/supply_pack/centcom/general/clear_pda
	name = "Mint Condition Nanotrasen Clear PDA"
	desc = "Mint condition, freshly repackaged! A valuable collector's item normally valued at over 2.5 million credits, now available for a steal!"
	cost = 100000
	contains = list(/obj/item/modular_computer/pda/clear)

// CentCom Weaponry

/datum/supply_pack/centcom/weapon/pulse_rifle
	name = "Pulse rifle"
	desc = "A heavy-duty, multifaceted energy rifle with three modes. Preferred by front-line combat personnel."
	cost = 50000
	contains = list(/obj/item/gun/energy/pulse)

/datum/supply_pack/centcom/weapon/ar
	name = "NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	cost = 30000
	contains = list(/obj/item/gun/ballistic/automatic/ar)

// CentCom Armory

/datum/supply_pack/centcom/armor/mod_responsory
	name = "Responsory MOD control"
	desc = "A high-speed rescue suit by Nanotrasen, intended for its emergency response teams."
	cost = 30000
	contains = list(/obj/item/mod/control/pre_equipped/responsory)


// CentCom Limited

/datum/supply_pack/centcom/limited/door_remote_civilian
	name = "Сivilian door remote"
	desc = "Door remote for civilian and service departments."
	cost = 5000
	contains = list(/obj/item/door_remote/civilian)

/datum/supply_pack/centcom/limited/door_remote_medbay
	name = "Medical door remote"
	desc = "Door remote for medbay department."
	cost = 5000
	contains = list(/obj/item/door_remote/chief_medical_officer)

/datum/supply_pack/centcom/limited/door_remote_cargo
	name = "Cargo door remote"
	desc = "Door remote for cargo department."
	cost = 5000
	contains = list(/obj/item/door_remote/quartermaster)

/datum/supply_pack/centcom/limited/door_remote_security
	name = "Security door remote"
	desc = "Door remote for security department."
	cost = 5000
	contains = list(/obj/item/door_remote/head_of_security)

/datum/supply_pack/centcom/limited/door_remote_rnd
	name = "Research door remote"
	desc = "Door remote for research department."
	cost = 5000
	contains = list(/obj/item/door_remote/research_director)

/datum/supply_pack/centcom/limited/door_remote_engineering
	name = "Engineering door remote"
	desc = "Door remote for engineering department."
	cost = 5000
	contains = list(/obj/item/door_remote/chief_engineer)

/datum/supply_pack/centcom/limited/door_remote_captain
	name = "Command door remote"
	desc = "Door remote for command department."
	cost = 5000
	contains = list(/obj/item/door_remote/captain)


/datum/supply_pack/centcom/limited/protolathe_engineering
	name = "Departmental Protolathe - Engineering"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/engineering)

/datum/supply_pack/centcom/limited/protolathe_medical
	name = "Departmental Protolathe - Medical"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/medical)

/datum/supply_pack/centcom/limited/protolathe_service
	name = "Departmental Protolathe - Service"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/service)

/datum/supply_pack/centcom/limited/protolathe_cargo
	name = "Departmental Protolathe - Cargo"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/cargo)

/datum/supply_pack/centcom/limited/protolathe_science
	name = "Departmental Protolathe - Science"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/science)

/datum/supply_pack/centcom/limited/protolathe_security
	name = "Departmental Protolathe - Security"
	desc = "Protolathe circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/protolathe/department/security)

/datum/supply_pack/centcom/limited/protolathe_security
	name = "Circuit Imprinter"
	desc = "Circuit Imprinter circuitboard."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/circuit_imprinter)
