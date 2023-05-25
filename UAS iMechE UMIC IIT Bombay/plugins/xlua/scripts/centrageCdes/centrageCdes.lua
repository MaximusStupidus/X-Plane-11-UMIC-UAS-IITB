-- SET UP DATAREFS ===================
pitch = find_dataref("sim/joystick/yoke_pitch_ratio")
roll = find_dataref("sim/joystick/yoke_roll_ratio")
heading = find_dataref("sim/joystick/yoke_heading_ratio")
vvi = find_dataref("sim/flightmodel/position/vh_ind_fpm")
slider_11 = find_dataref("sim/cockpit2/switches/custom_slider_on[11]")  -- 1 = centrage commandes - en cde "slider#12"
throtmaxFWD = find_dataref("sim/aircraft/engine/acf_throtmax_FWD")
weight_vide = find_dataref("sim/aircraft/weight/acf_m_empty")
c2_throtlles = find_dataref("sim/cockpit2/engine/actuators/throttle_ratio_all")
weight_utile = find_dataref("sim/flightmodel/weight/m_fixed")

-- FUNCTIONS =========================

function flight_start()
	--throtmaxFWD = 0.40
	c2_throtlles = 0.040
--	weight_utile = 3.0
end

function after_physics()

    if c2_throtlles < 0.039 then 	
		c2_throtlles = 0.040
	end
 
	if slider_11 == 1 then 	
		throtmaxFWD = 0.285
	end
	
	if slider_11 == 1 then 	
		pitch = 0 
	end
	
	if slider_11 == 1 and vvi > 500 then 	
		c2_throtlles = 1
	end
	
	if slider_11 == 1 and vvi < 500 then 	
		c2_throtlles = 0.5
	end
	
	if slider_11 == 1 and vvi > -500 then 	
		c2_throtlles = 0.5
	end
	
	if slider_11 == 1 and vvi < -500 then 	
		c2_throtlles = 1
	end
	
	if slider_11 == 1 then 	
		roll = 0
	end		
		
	if slider_11 == 1 then 	
		heading = 0
	end

end