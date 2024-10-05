vivo = true
pulando = false
tocandoChao = true

audio_play_sound(level_music,0,true)

ALTURA_MAX_PULO = 5
puloInitYPos = 0 // Segurar posição do player (cheque de altura





function handlePulo(){
	
	
	if (keyboard_check_pressed(vk_space) && not(pulando))
	{	
		pulando = true
		puloInitYPos = y
		vspeed -= 9
	}
	
	else{
		if abs( ( y - puloInitYPos )) > ALTURA_MAX_PULO{
			vspeed += 0.25
		}
		else{
			//show_debug_message( y - puloInitYPos)
		}
	}

}