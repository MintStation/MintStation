#define COMPANY_DELTA "It has <b>[span_purple("Delta Arsenal")]</b> minted on gun's barrel."

// Kite-12

/obj/item/gun/ballistic/automatic/delta/kite12
	name = "\improper Kite-12"
	desc = "An automatic shotgun. A rugged automatic shotgun designed for hunting, offering rapid target acquisition and reliable performance in the field."

	icon = 'modularmint/modules/delta_armory/icons/obj/shotguns_48.dmi'
	icon_state = "kite12"

	lefthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_l.dmi'
	righthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_r.dmi'
	inhand_icon_state = "kite12"

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_OCLOTHING

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/kite12
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/kite12

	bolt_wording = "pump"
	cartridge_wording = "shell"

	fire_sound = 'modularmint/modules/delta_armory/sound/kite12.ogg'

	burst_fire_selection = FALSE
	burst_size = 1
	fire_delay = 0.8 SECONDS

	spread = 0

	projectile_damage_multiplier = 1
	semi_auto = TRUE

/obj/item/gun/ballistic/automatic/delta/kite12/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/delta/kite12/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/kite12/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/kite12/examine_more(mob/user)
	. = ..()

	. += "The Kite-12 was originally produced in the Delta Arsenal. \
		These weapons were supplied to effective hunting."

	return .

/obj/item/ammo_box/magazine/delta/kite12
	name = "\improper Kite-12 shotgun magazine"
	desc = "A standard size shotgun magazine for Kite-12 shotguns, holds twelve rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "kite12"
	base_icon_state = "kite12-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = CALIBER_SHOTGUN
	max_ammo = 12

/obj/item/ammo_box/magazine/delta/kite12/empty
	start_empty = TRUE

#undef COMPANY_DELTA
