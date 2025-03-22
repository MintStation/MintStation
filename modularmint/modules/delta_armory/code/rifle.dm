#define COMPANY_DELTA "It has <b>[span_purple("Delta Arsenal")]</b> minted on gun's barrel."

// Falcon-28

/obj/item/gun/ballistic/automatic/delta/falcon28
	name = "\improper Falcon-28"
	desc = "An full-auto .40 Sol assault rifle. A versatile assault rifle designed for rapid fire and reliable performance in combat situations."

	icon = 'modularmint/modules/delta_armory/icons/obj/rifles_48.dmi'
	icon_state = "falcon28"

	lefthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_l.dmi'
	righthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_r.dmi'
	inhand_icon_state = "falcon28"

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/falcon28
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/falcon28

	fire_sound = 'modularmint/modules/delta_armory/sound/falcon28.ogg'

	burst_size = 5
	fire_delay = 0.35 SECONDS
	actions_types = list(/datum/action/item_action/toggle_firemode)

	//spread = 0

	projectile_damage_multiplier = 0.6

/obj/item/gun/ballistic/automatic/delta/falcon28/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/falcon28/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/falcon28/examine_more(mob/user)
	. = ..()

	. += "The Intervention Ninth was originally produced in the Delta Arsenal. \
		These weapons were supplied to effective assault."

	return .

/obj/item/ammo_box/magazine/delta/falcon28
	name = "\improper Falcon-28 magazine"
	desc = "Huge magazine for assault rifle. Holds 30 rounds."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "falcon28"
	base_icon_state = "falcon28-full"

	multiple_sprites = AMMO_BOX_FULL_EMPTY

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG
	max_ammo = 30

/obj/item/ammo_box/magazine/delta/falcon28/empty
	start_empty = TRUE

// Ranger

/obj/item/gun/ballistic/automatic/delta/ranger
	name = "\improper Ranger"
	desc = "Long barreled .310 rifle. A rugged and reliable long-range rifle designed for military and law enforcement snipers."

	icon = 'modularmint/modules/delta_armory/icons/obj/rifles_48.dmi'
	icon_state = "ranger"

	lefthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_l.dmi'
	righthand_file = 'modularmint/modules/delta_armory/icons/mob/guns_r.dmi'
	inhand_icon_state = "ranger"

	special_mags = TRUE

	bolt_type = BOLT_TYPE_LOCKING

	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT

	accepted_magazine_type = /obj/item/ammo_box/magazine/delta/ranger
	spawn_magazine_type = /obj/item/ammo_box/magazine/delta/ranger

	fire_sound = 'modularmint/modules/delta_armory/sound/ranger.ogg'

	burst_size = 1
	fire_delay = 1.2 SECONDS
	actions_types = list()

	//spread = 0

	projectile_damage_multiplier = 0.6

/obj/item/gun/ballistic/automatic/delta/ranger/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_DELTA)

/obj/item/gun/ballistic/automatic/delta/ranger/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/delta/ranger/examine_more(mob/user)
	. = ..()

	. += "The Intervention Ninth was originally produced in the Delta Arsenal. \
		These weapons were supplied to effective assault."

	return .

/obj/item/gun/ballistic/automatic/delta/ranger/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/ammo_box/magazine/delta/ranger
	name = "\improper Ranger magazine"
	desc = "Five-chambered Ranger magazine."

	icon = 'modularmint/modules/delta_armory/icons/obj/mags.dmi'
	icon_state = "ranger"
	base_icon_state = "ranger-full"

	multiple_sprites = AMMO_BOX_PER_BULLET

	w_class = WEIGHT_CLASS_SMALL

	ammo_type = /obj/item/ammo_casing/strilka310
	caliber = CALIBER_STRILKA310
	max_ammo = 5

/obj/item/ammo_box/magazine/delta/ranger/empty
	start_empty = TRUE

#undef COMPANY_DELTA
