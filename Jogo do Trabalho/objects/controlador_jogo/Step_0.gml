/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Detectar Pulo
if keyboard_check_pressed(ord("P")) && inst_60ADEB33.vivo{
	//show_debug_message("Usuário pausou")
	jogoPausadoHandler()
}

// Player morreu
if inst_60ADEB33.vivo == false{
	playerMorreu()
}
else{
	// -- Score -- //
	aumentarScorePlayer(1,"Etapa")
	
	// -- Spawn Inimigos -- //
	if (get_timer() - spawn_ultimo_inimigo ) > tempo_entre_inim_spawns && !jogoPausado 
	{
		spawn_ultimo_inimigo = get_timer()
		//show_debug_message("Spawnando inimigo!")
		var inim_aleatorio = selec_inimigo_aleatorio()
		//show_debug_message("Inim aleatorio: " + object_get_name(objetos_inimigos[$ inim_aleatorio]._obj))
		spawnar_inimigo(inim_aleatorio, "automatico", "automatico",false,true)
	}
	else{
		
		//spawn_ultimo_inimigo = get_timer() 
	}
}


// Spawn de Inimigos SIMPLES

// Score


