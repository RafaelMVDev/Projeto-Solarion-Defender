if (vivo = true)
{
	// Velocidade

	x -= 5

	// Loop do Meteoro

	if (x >= -120 and x <= -100)
	{
		x = 1450
	}

	// Reset

	if (place_meeting(x-16,y,obj_protag))
	{
		hspeed += 0
		vivo = false
	}
}

else if (keyboard_check_pressed(vk_space))
{
	x = 1450
	vivo = true
}