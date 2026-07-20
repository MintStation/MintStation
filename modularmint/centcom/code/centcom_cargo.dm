/obj/item/circuitboard/computer/cargo/express/centcom
	name = "CentCom Express Supply Console"
	build_path = /obj/machinery/computer/cargo/express/centcom
	contraband = FALSE

/obj/machinery/computer/cargo/express/centcom
	name = "centcom express supply console"
	desc = "This console allows the user to purchase a package \
		with 1/40th of the delivery time: made possible by Nanotrasen's new \"1500mm Orbital Railgun\".\
		All sales are near instantaneous - please choose carefully"
	circuit = /obj/item/circuitboard/computer/cargo/express/centcom
	req_access = list(ACCESS_CENT_GENERAL)
	cargo_account = ACCOUNT_NT
	contraband = FALSE
	interface_type = "CentComCargoExpress"

	pod_type = /obj/structure/closet/supplypod/centcompod

/obj/machinery/computer/cargo/express/centcom/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(user)
		to_chat(user, span_notice("You try to change the routing protocols, however the machine displays a runtime error and reboots."))
	return FALSE//never let this console be emagged

/obj/machinery/computer/cargo/express/centcom/packin_up(forced = FALSE)
	meme_pack_data = list()
	if (!forced && !SSshuttle.initialized)
		SSshuttle.express_consoles += src
		return
	for(var/pack in SSshuttle.supply_packs)
		var/datum/supply_pack/P = SSshuttle.supply_packs[pack]
		if (!P.iscentcom)
			continue
		if(!meme_pack_data[P.group])
			meme_pack_data[P.group] = list(
				"name" = P.group,
				"packs" = list()
			)
		if((P.special) || (P.hidden && !P.iscentcom))
			continue
		if(P.contraband && !contraband)
			continue
		meme_pack_data[P.group]["packs"] += list(list(
			"name" = P.name,
			"cost" = P.get_cost() * get_discount(),
			"id" = pack,
			"desc" = P.desc || P.name
		))


/obj/machinery/computer/cargo/express/centcom/ui_act(action, params, datum/tgui/ui)
	if(action == "add")//if we're generating a supply order
		if (!beacon || !using_beacon)//if not using beacon
			say("Error! Destination is not whitelisted, aborting.")
			return
		var/id = params["id"]
		id = text2path(id) || id
		var/datum/supply_pack/is_supply_pack = SSshuttle.supply_packs[id]
		if(!is_supply_pack || !istype(is_supply_pack))//if we're ordering a company import pack, add a temp pack to the global supply packs list, and remove it
			var/datum/armament_entry/armament_order = locate(id)
			params["id"] = length(SSshuttle.supply_packs) + 1
			var/datum/supply_pack/armament/temp_pack = new
			temp_pack.name = initial(armament_order.item_type.name)
			temp_pack.cost = armament_order.cost
			temp_pack.contains = list(armament_order.item_type)
			SSshuttle.supply_packs += temp_pack
			. = ..()
			SSshuttle.supply_packs -= temp_pack
			return .
	return ..()
