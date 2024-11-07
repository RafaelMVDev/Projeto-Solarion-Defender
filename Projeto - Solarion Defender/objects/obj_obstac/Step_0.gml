if self.vivo
{
	// Velocidade
	//show_debug_message("X: " + string(x) + "; Y: " + string(y))
	if global.player_dead_state == false{
		image_angle += irandom_range(3, 6)
	
		if global.velocidade_fase != abs(abs(hspeed) - abs(hspeed_inicial)){
			hspeed = hspeed_inicial - global.velocidade_fase
		}
	}
	else{
		hspeed = 0
	}
	
	if (x + self.sprite_width/2) + 50 < view_xport //-  view_wport
	{	
		instance_destroy(self)
	}
	

	// Loop do Meteoro



	// Reset
}

else 
{
	instance_destroy(self)
}
	
