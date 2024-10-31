/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Pausar //


global.jogo_pausado = false; 

superficie_id = -1 //Pra fazer a tela de pause, a gente vai precisar usar uma superficie
nao_desativar = {
	cont_cooldown: controlador_cooldowns,
	obj_vidas: obj_vida
}

function jogoPausadoHandler(){
	global.jogo_pausado = !global.jogo_pausado
	
	if not(global.jogo_pausado) && global.player_dead_state == false{
		instance_activate_all()
		surface_free(superficie_id)
		superficie_id = -1
		//controlador_projetil.ultimo_disparo = tempo_atual - controlador_projetil.ultimo_disparo
		show_debug_message( "Despausando timer: " + string(controlador_projetil.ultimo_disparo))
	}
	else {
		//controlador_projetil.ultimo_disparo = tempo_atual - controlador_projetil.ultimo_disparo
		show_debug_message( "Pausando timer: " + string(controlador_projetil.ultimo_disparo))
		// Talvez seja util depois
	}
}

// desenho do menu e detecção da mudança da var jogoPausado
function desenharPausaMenu(){ 
	
		
		if (global.jogo_pausado && global.player_dead_state == false)
		{	
			//alarm[0] ++
			if !surface_exists(superficie_id) // se a superficie não existir, a gente cria uma ( as vezes retorna false se o jogo tiver minimazado, por isso checamos abaixo o id da superficie )
			{ 
				if superficie_id == -1 // signfica q a gente pode ir para o estado pausado (-1 = superficie ja foi limpada desde o ultimo pause )
				{	
					
					instance_deactivate_all(true) // desativar todas as instancias na sala ( exceto a controlador_jogo obviamente )
					for (i = 0; i < struct_names_count(nao_desativar); i++){
						//TRABALHAR
					}
					
				}
				
				superficie_id = surface_create(room_width, room_height) // inicializa a superficie com o tamanho da nossa sala
				surface_set_target(superficie_id) // todos os "desenhos" vão passar a ser feitos nessa superficie
				draw_surface(application_surface,0,0) // desenha na superficie a application surface ( o que ta sendo desenhado no momento )
				surface_reset_target() // Permite que a gente faça novos desenhos nessa superficie ( ver documentação )
			}
			else{
				
				draw_surface(superficie_id, 0, 0);
				draw_set_alpha(0.5);
				draw_rectangle_colour(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_set_font(MainFont)
				draw_text_transformed_colour(view_wport / 2, view_hport / 2, "JOGO PAUSADO", 1, 1, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);
				draw_text_transformed_colour(view_wport / 2, (view_hport / 2) + 50, "M - Voltar ao menu", 0.8, 0.8, 0, c_white, c_white, c_white, c_white, 1);
				
				
			
				draw_set_halign(fa_left);
			}
		}
	
	
}