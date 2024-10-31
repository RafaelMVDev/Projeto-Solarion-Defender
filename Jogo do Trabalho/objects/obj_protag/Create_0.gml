//image_xscale = image_xscale + (1 * global.var_aspect_ratio_x)
//image_yscale = image_yscale + (1 * global.var_aspect_ratio_y)

//x = x + (x * global.var_aspect_ratio_x)
//y = y + (y * global.var_aspect_ratio_y)



vivo = true
pulando = false
tocandoChao = true
global.player_vidas = 3


audio_play_sound(level_music,0,true)

ALTURA_MAX_PULO = 10
puloInitYPos = y // Segurar posição do player (cheque de altura


function handlePulo(){
	
	
	if (keyboard_check_pressed(vk_space) && not(pulando))
	{	
		pulando = true
		puloInitYPos = y
		audio_play_sound(som_pulo,1,false)
		vspeed -= 9
		self.image_index = 1
	}
	
	else{
		
		if abs( ( y - puloInitYPos )) > ALTURA_MAX_PULO{
			vspeed += 0.25
			self.image_index = 1
		}
	
	}

}