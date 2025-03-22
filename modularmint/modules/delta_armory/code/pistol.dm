#define COMPANY_DELTA "It has <b>[span_purple("Delta Arsenal")]</b> minted on gun's barrel."

/obj/item/gun/ballistic/automatic/delta
	can_suppress = FALSE

// HP65

/obj/item/gun/ballistic/automatic/delta/hp65
	name = "\improper HP-65"
	desc = "A light handle pistol firing 9mm. Built for close-quarters combat, this compact pistol offers rapid target acquisition and reliable performance."

	icon = 'modularmint/modules/delta_armory/icons/obj/pistols.dmi'
	icon_state = "hp65"

	//lefthand_file = ''
	//righthand_file = ''
	//inhand_icon_state = ""

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/hp65
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/hp65

	//fire_sound = ''

	burst_size = 1
	fire_delay = 0.3 SECONDS

	//spread = 0

	projectile_damage_multiplier = 0.65

	actions_types = list()

/obj/item/gun/ballistic/automatic/delta/hp65/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/hp65/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/hp65/examine_more(mob/user)
	. = ..()

	. += "The Handle Pistol 65 was originally produced in the Delta Arsenal. \
		These weapons were supplied to lethal civil defense."

	return .

/obj/item/ammo_box/magazine/delta/hp65
	name = "\improper HP-65 pistol magazine"
	desc = "A standard size magazine for HP-65 pistols, holds twelve rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "hp65"
	base_icon_state = "hp65-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 12

/obj/item/ammo_box/magazine/delta/hp65/empty
	start_empty = TRUE

// Cyn-7

/obj/item/gun/ballistic/automatic/delta/cyn7
	name = "\improper Cyn-7"
	desc = "A full-automatic pistol firing 9mm. A lightweight tactical sidearm designed for rapid deployment and seamless integration."

	icon = 'modularmint/modules/delta_armory/icons/obj/pistols.dmi'
	icon_state = "cyn7"

	//lefthand_file = ''
	//righthand_file = ''
	//inhand_icon_state = ""

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/cyn7
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/cyn7

	//fire_sound = ''


	burst_size = 1
	fire_delay = 0.35 SECONDS

	spread = 7

	projectile_damage_multiplier = 0.5

	actions_types = list()

/obj/item/gun/ballistic/automatic/delta/cyn7/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/cyn7/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/cyn7/examine_more(mob/user)
	. = ..()

	. += "The Cyn-7 was originally produced in the Delta Arsenal. \
		These weapons were supplied to lethal civil defense."

	return .

/obj/item/gun/ballistic/automatic/delta/cyn7/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/ammo_box/magazine/delta/cyn7
	name = "\improper Cyn-7 pistol magazine"
	desc = "A standard size magazine for Cyn-7 pistols, holds twenty rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "cyn7"
	base_icon_state = "cyn7-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 20

/obj/item/ammo_box/magazine/delta/cyn7/empty
	start_empty = TRUE

// Democrator

/obj/item/gun/ballistic/automatic/delta/democrator
	name = "\improper Democrator"
	desc = "A compact handle pistol firing 9mm. Sleek and compact, this pistol is ideal for everyday carry without compromising on firepower."

	icon = 'modularmint/modules/delta_armory/icons/obj/pistols.dmi'
	icon_state = "democrator"

	//lefthand_file = ''
	//righthand_file = ''
	//inhand_icon_state = ""

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/democrator
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/democrator

	//fire_sound = ''

	burst_size = 3
	fire_delay = 0.2 SECONDS

	spread = 0

	projectile_damage_multiplier = 0.6


/obj/item/gun/ballistic/automatic/delta/hp65/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/hp65/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/hp65/examine_more(mob/user)
	. = ..()

	. += "The Democrator was originally produced in the Delta Arsenal. \
		These weapons were supplied to lethal civil defense."

	return .

/obj/item/ammo_box/magazine/delta/democrator
	name = "\improper Democrator pistol magazine"
	desc = "A standard size magazine for Democrator pistols, holds twelve rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "democrator"
	base_icon_state = "democrator-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 12

/obj/item/ammo_box/magazine/delta/democrator/empty
	start_empty = TRUE

#undef COMPANY_DELTA
