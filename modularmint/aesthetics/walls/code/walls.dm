/turf/closed/wall
	icon = 'modularmint/aesthetics/walls/icons/wall.dmi'
	smoothing_groups = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS

/turf/closed/wall/r_wall
	icon = 'modularmint/aesthetics/walls/icons/reinforced_wall.dmi'

/turf/closed/wall/rust
	icon = 'modularmint/aesthetics/walls/icons/wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/r_wall/rust
	icon = 'modularmint/aesthetics/walls/icons/reinforced_wall.dmi'
	icon_state = "reinforced_wall-0"
	base_icon_state = "reinforced_wall"
	base_decon_state = "r_wall"

/turf/closed/wall/material
	icon = 'modularmint/aesthetics/walls/icons/material_wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

// Modular false wall overrides
/obj/structure/falsewall
	icon = 'modularmint/aesthetics/walls/icons/wall.dmi'
	fake_icon = 'modularmint/aesthetics/walls/icons/wall.dmi'

/obj/structure/falsewall/reinforced
	name = "reinforced wall"
	desc = "A huge chunk of reinforced metal used to separate rooms."
	icon = 'modularmint/aesthetics/walls/icons/reinforced_wall.dmi'
	fake_icon = 'modularmint/aesthetics/walls/icons/reinforced_wall.dmi'

/obj/structure/falsewall/material
	icon = 'modularmint/aesthetics/walls/icons/material_wall.dmi'
	icon_state = "wall-open"
	base_icon_state = "wall"
	fake_icon = 'modularmint/aesthetics/walls/icons/material_wall.dmi'

// TG false walls, overridden back to the TG file because we overrode the base falsewall with our aesthetic icon. New ones from TG will have to be added here.
// Yes, this is dumb
/obj/structure/falsewall/uranium
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/gold
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/silver
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/diamond
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/plasma
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/sandstone
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/wood
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/iron
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'

/obj/structure/falsewall/plastitanium
	icon = 'modularmint/aesthetics/walls/icons/material/false_walls.dmi'


/obj/structure/alien/resin/wall
	icon = 'modularmint/aesthetics/walls/icons/resin_wall.dmi'

/turf/closed/indestructible/resin/membrane
	icon = 'modularmint/aesthetics/walls/icons/resin_membrane.dmi'

/obj/structure/alien/resin/membrane
	icon = 'modularmint/aesthetics/walls/icons/resin_membrane.dmi'

/obj/structure/mold/structure/wall
	icon = 'modularmint/aesthetics/walls/icons/resin_wall.dmi'

/turf/closed/indestructible/resin
	icon = 'modularmint/aesthetics/walls/icons/resin_wall.dmi'
