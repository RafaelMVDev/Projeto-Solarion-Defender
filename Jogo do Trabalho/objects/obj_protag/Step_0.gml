
if (vivo = true)
{
	// Gravidade

	if (place_meeting(x,y+7,obj_chao))
	{
		vspeed = 0
		pulando = false
	}
		else
	{
		vspeed += 0.15
	}

	// Pulo

	if (keyboard_check_pressed(vk_space) && not(pulando))
	{
		pulando = true
		vspeed -= 9
	}

	
	
	// Música
	
}

else
{
	
	audio_stop_sound(level_music)

	if (keyboard_check_pressed(vk_space))
	{
		y = 683.50
		vivo = true
		audio_play_sound(level_music,0,true)
	}
}