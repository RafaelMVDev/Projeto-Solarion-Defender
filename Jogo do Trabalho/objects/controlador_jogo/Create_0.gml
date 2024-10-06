/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Variaveis para controle do pause do jogo
jogoPausado = false
superficieId = -1 //Pra fazer a tela de pause, a gente vai precisar usar uma superficie
telaMorte = false
jogoRecomecou = false

// --- ESTATISTICAS PLAYER ---- //

player_score = 0
inimigos_derrotados = 0

ultimo_score_dado = get_timer()
tempo_debounce_score = 100000 // em microsegundos == 




// Pausar //
function jogoPausadoHandler(){
	controlador_jogo.jogoPausado = !jogoPausado
	
	if not(controlador_jogo.jogoPausado){
		instance_activate_all()
		surface_free(superficieId)
		superficieId = -1
	}
	else {
		// Talvez seja util depois
	}
}

// desenho do menu e detecção da mudança da var jogoPausado
function desenharPausaMenu(){ 
	
	
		if (controlador_jogo.jogoPausado && inst_60ADEB33.vivo)
		{
			if !surface_exists(superficieId) // se a superficie não existir, a gente cria uma ( as vezes retorna false se o jogo tiver minimazado, por isso checamos abaixo o id da superficie )
			{ 
				if superficieId == -1 // signfica q a gente pode ir para o estado pausado (-1 = superficie ja foi limpada desde o ultimo pause )
				{
					instance_deactivate_all(true) // desativar todas as instancias na sala ( exceto a controlador_jogo obviamente )
				}
				
				controlador_jogo.superficieId = surface_create(room_width, room_height) // inicializa a superficie com o tamanho da nossa sala
				surface_set_target(controlador_jogo.superficieId) // todos os "desenhos" vão passar a ser feitos nessa superficie
				draw_surface(application_surface,0,0) // desenha na superficie a application surface ( o que ta sendo desenhado no momento )
				surface_reset_target() // Permite que a gente faça novos desenhos nessa superficie ( ver documentação )
			}
			else{
				draw_surface(controlador_jogo.superficieId, 0, 0);
				draw_set_alpha(0.5);
				draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_font(MenuFont)
				draw_text_transformed_colour(view_wport / 2, view_hport / 2, "JOGO PAUSADO", 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
				draw_set_halign(fa_left);
			}
		}
	
	
}

// Player Morreu 


function desenharTelaGameOver(){
	show_debug_message("GAME OVER")
	draw_set_font(GameOverFont)
	draw_set_halign(fa_center)
	draw_text_transformed(view_wport / 2, (view_hport / 2) - 100,"GAME OVER",0.5,0.5,0)
}


function resetInimigos(){
	show_debug_message(string(instance_number(all)))
	for (i = 0; i < instance_number(all); i++;)
	{	
		
		var inst = instance_id[i]
		show_debug_message("HERE: "+string(inst))
		show_debug_message(object_get_name(inst.object_index))
		if inst.object_index == obj_obstac.object_index
		{	
			inst.x = 1450
			inst.vivo = true
			inst.tocouPlayer = false
		}
	}
}




function playerMorreu(){
	
	inst_60ADEB33.vspeed = 0 
	audio_stop_sound(level_music)
	show_debug_message("Player Morreu")
	

	if (keyboard_check_pressed(ord("R")))
	{	
		show_debug_message("Apertou fii")
		// Resetando status do player
		var player = inst_60ADEB33 // mudar para uma função depois
		player.y = 683
		player.vivo = true
		player.pulando = false
		player_score = 0 // Resetando score do player
		
		// Resetando inimigos
		controlador_projetil.deletar_projeteis()
		resetInimigos()
		audio_play_sound(level_music,0,true)
	}
}

function aumentarScorePlayer(quantidade,tipo){
	if tipo == "Etapa"{ // incremento acontece continuamente, portanto usamos um debounce
		if (get_timer() - ultimo_score_dado) >= tempo_debounce_score{
			player_score += quantidade
			ultimo_score_dado = get_timer()
		}
	}
	else{
		player_score += quantidade
	}
}

