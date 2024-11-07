/// @description Inserir descrição aqui

if self.vivo
{
	// Velocidade
	//show_debug_message("X: " + string(x) + "; Y: " + string(y))
	
	if global.player_dead_state{
		hspeed = 0
	}
	else{
		if global.velocidade_fase != abs(abs(hspeed) - abs(hspeed_inicial)){
			hspeed = hspeed_inicial - global.velocidade_fase
		}
	}

	// Loop do Meteoro

	if (x + self.sprite_width/2) + 50 < view_xport //-  view_wport
	{	
		show_debug_message("Distruindo!")
		instance_destroy(self)
	}

	// Reset
}

else 
{
	instance_destroy(self)
}
	