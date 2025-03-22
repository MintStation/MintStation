#define COMPANY_DELTA "It has <b>[span_purple("Delta Arsenal")]</b> minted on gun's barrel."

// Intervention Ninth

/obj/item/gun/ballistic/automatic/delta/inter9
	name = "\improper Intervention Ninth"
	desc = "An automatic .35 Sol submachine gun. A submachine gun designed for sustained firepower, with a drum magazine that maximizes round count."

	icon = 'modularmint/modules/delta_armory/icons/obj/automatic.dmi'
	icon_state = "inter9"

	lefthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_l.dmi'
	righthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_r.dmi'
	inhand_icon_state = "inter9"

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/inter9
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/inter9

	//fire_sound = ''

	burst_size = 5
	fire_delay = 0.25 SECONDS
	actions_types = list(/datum/action/item_action/toggle_firemode)

	spread = 9

	projectile_damage_multiplier = 0.66

/obj/item/gun/ballistic/automatic/delta/inter9/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/inter9/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/inter9/examine_more(mob/user)
	. = ..()

	. += "The Intervention Ninth was originally produced in the Delta Arsenal. \
		These weapons were supplied to effective assault."

	return .

/obj/item/ammo_box/magazine/delta/inter9
	name = "\improper Intervention Ninth submachine gun magazine"
	desc = "A long size magazine for Intervention Ninth, holds thirty five rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "inter9"
	base_icon_state = "inter9-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c35sol
	caliber = CALIBER_SOL35SHORT
	max_ammo = 35

/obj/item/ammo_box/magazine/delta/inter9/empty
	start_empty = TRUE

// C-SMG 35

/obj/item/gun/ballistic/automatic/delta/csmg35
	name = "\improper C-SMG 35"
	desc = "A compact submachine .35 Sol gun. A compact submachine gun that balances firepower and portability, making it a top choice for special forces."

	icon = 'modularmint/modules/delta_armory/icons/obj/automatic.dmi'
	icon_state = "csmg35"

	lefthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_l.dmi'
	righthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_r.dmi'
	inhand_icon_state = "csmg35"

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/csmg35
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/csmg35

	//fire_sound = ''

	//burst_size = 1
	fire_delay = 0.15 SECONDS
	actions_types = list()

	spread = 20

	projectile_damage_multiplier = 0.18

/obj/item/gun/ballistic/automatic/delta/csmg35/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/csmg35/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/csmg35/examine_more(mob/user)
	. = ..()

	. += "The Intervention Ninth was originally produced in the Delta Arsenal. \
		These weapons were supplied to effective assault."

	return .

/obj/item/gun/ballistic/automatic/delta/csmg35/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/ammo_box/magazine/delta/csmg35
	name = "\improper C-SMG 35 submachine gun magazine"
	desc = "A long size magazine for C-SMG 35, holds twenty five rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "csmg35"
	base_icon_state = "csmg35-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c35sol
	caliber = CALIBER_SOL35SHORT
	max_ammo = 25

/obj/item/ammo_box/magazine/delta/csmg35/empty
	start_empty = TRUE

#undef COMPANY_DELTA
