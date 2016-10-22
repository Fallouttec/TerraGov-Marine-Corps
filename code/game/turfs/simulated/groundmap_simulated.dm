/turf/simulated/floor/gm //Basic groundmap turf parent
	name = "ground dirt"
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "desert"
//	floor_tile = null
	heat_capacity = 500000 //Shouldn't be possible, but you never know...

	ex_act(severity) //Should make it indestructable
		return

	fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
		return

	attackby() //This should fix everything else. No cables, etc
		return

/turf/simulated/floor/gm/dirt
	name = "dirt"
	icon_state = "desert"

/turf/simulated/floor/gm/dirt/New()
	..()
	if(rand(0,15) == 0)
		icon_state = "desert[pick("0","1","2","3")]"

/turf/simulated/floor/gm/grass
	name = "grass"
	icon_state = "grass1"

//Ground map walls
/turf/simulated/wall/gm
	name = "dense jungle"
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "wall2"
	desc = "Some thick jungle."
	density = 1
	opacity = 1

	//Not yet
	ex_act(severity)
		switch(severity)
			if(1.0)
				src.ChangeTurf(/turf/simulated/floor/gm/grass)
				return
			if(2.0)
				return
			if(3.0)
				return
	fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
		return

	attackby() //Put machete-cutting here later
		return


/turf/simulated/wall/gm/dense
	name = "dense jungle wall"
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "wall2"

	New()
		spawn(1)
			if(rand(0,15) == 0)
				icon_state = "wall1"
			else if (rand(0,20) == 0)
				icon_state = "wall3"
			else
				icon_state = "wall2"


/turf/simulated/floor/gm/dirtgrassborder
	name = "grass"
	icon_state = "grassdirt_edge"

/turf/simulated/floor/gm/river
	name = "river"
	icon_state = "seashallow"

/turf/simulated/floor/gm/river/New()
	..()
	overlays += image("icon"='icons/turf/ground_map.dmi',"icon_state"="riverwater","layer"=MOB_LAYER+0.1)

/turf/simulated/floor/gm/river/proc/cleanup(var/mob/living/carbon/human/M)
	if(!M || !istype(M)) return

	if(M.back)
		if(M.back.clean_blood())
			M.update_inv_back(0)
	if(M.wear_suit)
		if(M.wear_suit.clean_blood())
			M.update_inv_wear_suit(0)
	if(M.w_uniform)
		if(M.w_uniform.clean_blood())
			M.update_inv_w_uniform(0)
	if(M.gloves)
		if(M.gloves.clean_blood())
			M.update_inv_gloves(0)
	if(M.shoes)
		if(M.shoes.clean_blood())
			M.update_inv_shoes(0)
	M.clean_blood()

/turf/simulated/floor/gm/coast
	name = "coastline"
	icon_state = "beach"

/turf/simulated/floor/gm/riverdeep
	name = "river"
	icon_state = "seadeep"

/turf/simulated/floor/gm/riverdeep/New()
	..()
	overlays += image("icon"='icons/turf/ground_map.dmi',"icon_state"="water","layer"=MOB_LAYER+0.1)