
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
		show_debug_message("Pulando")
		vspeed -= 9
	}

	// Reset e Restart

	if (place_meeting(x+16,y,obj_obstac))
	{
		vspeed = 0
		show_debug_message("Não ta mais pulando")
		vivo = false
	}
	
	if (place_meeting(x+16,y,obj_rastejador))
	{
		vspeed = 0
		vivo = false
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