/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

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
