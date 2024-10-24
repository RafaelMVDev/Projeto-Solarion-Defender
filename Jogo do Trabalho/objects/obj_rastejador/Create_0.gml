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
		draw_sprite(spr_prot_morte,image_index,inst_60ADEB33.x, inst_60ADEB33.y) 
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