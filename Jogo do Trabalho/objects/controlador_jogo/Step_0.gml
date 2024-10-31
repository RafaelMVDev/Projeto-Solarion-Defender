/// @description Atualizar estado do jogo

// Checa se a vida do player chegou à 0
if global.player_vidas <= 0
{ 
	global.player_dead_state = true;
}

// Ativar funções de game over caso o player tenha morrido, caso contrário a gameplay ainda ta rolando
if global.player_dead_state
{
	player_morreu();
}

else
{
	// Se o jogo não estiver pausado, executar a gameplay normalmente
	if !global.jogo_pausado
	{ 
		// -- Score -- //
		aumentar_score_player(1,"Etapa")
		
		// -- Spawn Inimigos -- //
		if spawn_inimigo_permitido // Varivavél para controlar o spawn de inimigos
		{	
			spawn_inimigo_permitido = false
			var inim_aleatorio = selec_inimigo_aleatorio()
			//show_debug_message("Inim aleatorio: " + object_get_name(objetos_inimigos[$ inim_aleatorio]._obj))
			spawnar_inimigo(inim_aleatorio, "automatico", "automatico",false,true)
		}
		
	 }
}





