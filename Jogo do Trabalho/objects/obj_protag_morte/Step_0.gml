image_xscale = image_xscale + (image_xscale * global.var_aspect_ratio_x)
image_yscale = image_xscale + (image_xscale * global.var_aspect_ratio_y)

x = x + (x * global.var_aspect_ratio_x)
y = y + (y * global.var_aspect_ratio_y)


if global.player_dead_state{
	
	if !caindo {
		vspeed -= 0.5
		if !alarme_ativado {
			alarme_ativado = true
			
			alarm[0] = game_get_speed(gamespeed_fps)  *   0.3
		}
		
	}
	else{
		vspeed += 0.4
	}
}
