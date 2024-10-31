image_xscale = image_xscale + (image_xscale * global.var_aspect_ratio_x)
image_yscale = image_xscale + (image_xscale * global.var_aspect_ratio_y)

x = x + (x * global.var_aspect_ratio_x)
y = y + (y * global.var_aspect_ratio_y)

show_debug_message("Ratio x: " + string(global.var_aspect_ratio_x))
show_debug_message("Ratio y: " + string(global.var_aspect_ratio_y))
vivo = true
tocouPlayer = false


// Vidas

function perderVida(){
	if global.player_vidas == 3{
		controlador_jogo.remover_ui_coracao()
		instance_destroy(self)
		global.player_vidas = global.player_vidas - 1
		somDano()
	}
	
	else if global.player_vidas == 2{
		controlador_jogo.remover_ui_coracao()
		instance_destroy(self)
		global.player_vidas = global.player_vidas - 1
		somDano()
	}
	
	else if global.player_vidas == 1{
		controlador_jogo.remover_ui_coracao()
		//instance_destroy(self)
		global.player_vidas = global.player_vidas - 1
		somDano()
	}
	
}

// Som de Dano

function somDano(){
	var choice = irandom_range(1,4)
	
	if choice == 1{
		audio_play_sound(dano1,1,false)
	}
	
	if choice == 2{
		audio_play_sound(dano2,1,false)
	}
	
	if choice == 3{
		audio_play_sound(dano3,1,false)
	}
	
	if choice == 4{
		audio_play_sound(dano4,1,false)
	}
}