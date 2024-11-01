/// Para números aleatórios

randomize();

// -- Constantes -- //

esperar_game_over = 2.5; // tempo ocioso até ir pra sala da game over
alarme_ativado = false; // debounce para prevenir o alarme de ser ativado continuamente
game_over_desenhado = false;

// -- VARIAVÉIS GLOBAIS -- // 

global.player_dead_state = false; // Controlar estado do player
global.sala_atual = 0; // Usado?
global.vidas_restantes = 3; // Vidas do player
global.velocidade_fase = 0; // soma ao speed padrão dos objetos para aumentar a velocidade


// -- CONTROLE DA VELOCIDADE DA FASE -- // 

AUMENTO_VELOCIDADE = 3; // O quanto a velocidade deve ser aumentada 
VELOCIDADE_MAXIMA = 5; // Máximo de aumento de speed que se pode ter

intervalo_aumento = 200; // Aumentar a velocidade a cada 300 pontos
aumentar_velocidade = false; // Na etapa, vai controlar quando a velocidade deve ser aumentarda
score_desde_aumento = 0;  // Guarda em que o score a velocidade foi aumentada para comparação

// --- VIDAS --- //

scalex_coracoes = 2.5;  //quantas vezes preciso aumentar o sprite original ( ficar maior o coracao na gameplay)
scaley_coracoes = 2.5;

// --- ESTATÍSTICAS PLAYER ---- //

player_score = 0; // Variavél acumuladora de pontos
inimigos_derrotados = 0; 

ultimo_score_dado = get_timer() // Controlar a velocidade do score
tempo_debounce_score = 100000 // Em microsegundos 

// --- INIMIGOS ---- //


spawn_inimigo_permitido = false // 
tempo_entre_inim_spawns = 2.5 // 2.5 segundos 

inimigo_simples_escala = 2.9375 // tamanho (inutilizado)

INIMIGOS_DEFAULT_Y = 600 //+ //(600 * global.var_aspect_ratio_y)

// v Array para escolha aleatória de inimigos
tipos_inimigos =[ "inimigo_simples", "inimigo_desviar","inimigo_alto"] 

// v Dicionário que guarda os objetos e escala de redimensionamento das instâncias dos inimigos
objetos_inimigos = { 
	
	inimigo_simples : {
		_obj : obj_obstac,
		_scale_x : 4, //+ global.var_aspect_ratio_x,
		_scale_y : 4 //+ global.var_aspect_ratio_y,
	},
	
	inimigo_desviar : {
		_obj: obj_rastejador,
		_scale_x : 4, //+ global.var_aspect_ratio_x,
		_scale_y : 4 //+ global.var_aspect_ratio_y,
	},
	
	inimigo_alto : {
		_obj : obj_obstac_alto,
		_scale_x : 4,// + global.var_aspect_ratio_x,
		_scale_y : 4 //+ global.var_aspect_ratio_y,
	},
	
}


// --- FUNÇÕES --- //

// ** Coração **/

// Cria n ícones de coração baseado no argumento quantidade 

function criar_ui_coracao(quantidade){
	var pos_x,pos_y = 0 // Variavél para guardar a posição dos corações

	if !layer_exists("Vidas"){ // Checa se a camada onde os corações serão colocados existe
		show_debug_message("Sem coração"); // Debug
		alarm[1] = game_get_speed(gamespeed_fps) * 2; // Se a camada não existir, ativa um alarme para tentar novamente
		exit;
	}
	
	var layer_vidas = layer_get_id("Vidas"); 

	for (c = 0;c < quantidade; c++){ // Loop para começar a criar os corações ( 0 até quantidade )
	
		var vidas = layer_get_all_elements(layer_vidas); // Pega todos os corações já existentes na camada de vida
		var quant_vidas = array_length(vidas); // Checar quantos corações há na camada
		
		if (quant_vidas >= 1) { // Significa que a camada não ta vazia ( tem um instancia de coracao )
			
			var ultimo_coracao = layer_instance_get_instance(vidas[0]); // vidas[0] = ultimo icone de coração criado
			
			if ultimo_coracao{ 
				var pos_x = (ultimo_coracao.x + ultimo_coracao.sprite_width / 2) + 50;
				var pos_y = ultimo_coracao.y;
			}
			
		}
		else { // No caso da camada estar vazia, cria o primeiro coração na posição de referência
			
			//show_debug_message(string(array_length(coracoes)))
			var layer_referencias = layer_get_id("Referencias");
			if layer_referencias{
				var _referencias = layer_get_all_elements(layer_referencias);
				for (i = 0; i < array_length(_referencias); i++)
				{	
					
					var element = layer_instance_get_instance(_referencias[i]);
					if (element)
					{
						if (element.object_index == ref_spawn_coracao) // Checa se o elemento corresponde à referência correta
						{
							var pos_x = element.x;
							var pos_y = element.y;
						}
					 }
				}
			}
		}
		
		// Cria um novo coração na camada e posição especificadas, escalado de maneira correta
		
		novo_coracao = instance_create_layer(pos_x,pos_y,layer_vidas,obj_vida);
		novo_coracao.image_xscale = scalex_coracoes;
		novo_coracao.image_yscale = scaley_coracoes;
	}
}

// Remove um coração da layer de corações

function remover_ui_coracao(){

	if !layer_exists("Vidas") exit
	var layer_vidas = layer_get_id("Vidas")
	var coracoes = layer_get_all_elements(layer_vidas)
	if array_length(coracoes) >= 1 {
		
		instance_destroy(layer_instance_get_instance(coracoes[0])) // a posicao 0 corresponde à ultima instancia adicionada na camada (coração)
	}
}


// ** No GameOver **

function reset_inimigos(){

	var inimigos_layer_id = layer_get_id("Inimigos");
	var inimigos = layer_get_all_elements(inimigos_layer_id);
	
	for (i = 0; i < array_length(inimigos); i++;)
	{
		var inst = layer_instance_get_instance(inimigos[i]);
		
		if layer_get_element_type(inimigos[i]) != layerelementtype_instance{
			continue;
		}
		
		instance_destroy(inst);
	
	}
	
}

// desenha o sprite de morte do player

function anim_morte_player(){
	game_over_desenhado = true
	
	// Para animações do player, e o deixa invisivel, para que um novo sprite seja desenhado em cima dele
	inst_60ADEB33.image_speed = 0
	inst_60ADEB33.image_index = 0
	inst_60ADEB33.image_alpha = 0
	
	var inst = instance_create_layer(inst_60ADEB33.x, inst_60ADEB33.y, layer_get_id("Player"),obj_protag_morte)
	
}

function player_morreu(){
	
	// para a música do level e congela o player
	inst_60ADEB33.vspeed = 0 ;
	inst_60ADEB33.image_speed = 0;
	audio_stop_sound(level_music);
	
	// Pega os elementos do fundo que se movem e os congelam
	var background_layer = layer_get_id("Background");
	var chao_layer = layer_get_id("Chao");
	var montanhas_layer = layer_get_id("Montanhas");
	
	layer_hspeed(background_layer,0);
	layer_hspeed(chao_layer,0);
	layer_hspeed(montanhas_layer,0);
	
	if !game_over_desenhado{ 
		anim_morte_player();
	}
	
	if !alarme_ativado { // ativa um alarme para ir para tela de game over após 2 segundos
		alarm[0] = game_get_speed(gamespeed_fps) * esperar_game_over;
		alarme_ativado = true;
	}
	

	if (keyboard_check_pressed(ord("R"))) // *** Retirar depois
	{	

		// Resetando status do player
		controlador_cooldowns.alarm[0] = game_get_speed(gamespeed_fps) * 3 // resetar spawn de inimigos
		controlador_cooldowns.alarm[1] = game_get_speed(gamespeed_fps) * 0.5 // resetar lançamento de projetil
		
		var player = inst_60ADEB33 // mudar para uma função depois
		player.y = 683
		global.player_dead_state = false
		//player.vivo = true
		player.pulando = false
		player_score = 0 // Resetando score do player
		inimigos_derrotados = 0
		// Resetando inimigos
		controlador_projetil.deletar_projeteis()
		resetInimigos()
		audio_play_sound(level_music,0,true)
	}
}


// ** Score ** //

// Aumenta o score do tempo, com base nos argumentos quantidade ( quantidade a ser incrementada ), e tipo 
function aumentar_score_player(quantidade,tipo){
	if tipo == "Etapa"{ // incremento acontece continuamente, portanto usamos um debounce
		if (get_timer() - ultimo_score_dado) >= tempo_debounce_score{
			player_score += quantidade;
			ultimo_score_dado = get_timer();
		}
	}
	else{
		player_score += quantidade;
	}
}

// ** Inimigos ** //

function spawnar_inimigo(tipo_inimigo, pos_x, pos_y, _sprite_color, _random_color){
	
	if (_sprite_color == undefined) _sprite_color = false; // valores padrões para esses argumentos
	if (_random_color == undefined) _random_color = false;
	
	var inimigo = objetos_inimigos[$ tipo_inimigo]; // checa se o tipo passado está no dicionário


	if inimigo { // caso seja um inimigo válido:
		
		var inimigo_obj = objetos_inimigos[$ tipo_inimigo]._obj; // acessa o objeto do inimigo
	
		var _scale_x = inimigo._scale_x; // acessa a scala ( pra redimensionar o tamanho do inimigo )
		var _scale_y = inimigo._scale_y;
		
		if pos_x == "automatico"{ // Seta a posição Exatamente fora da tela
			pos_x = view_wport + sprite_get_width( object_get_sprite(inimigo_obj)) * _scale_x;
		}
		
		if pos_y == "automatico"{ // Seta pra posição default
			pos_y = INIMIGOS_DEFAULT_Y;
		}
		
		// Cria o novo inimigo na camada de Inimigos
		var clone_obj = instance_create_layer(pos_x,pos_y,"Inimigos",inimigo_obj); // cria o inimigo
		clone_obj.image_xscale = _scale_x; //Redimensionar sprite
		clone_obj.image_yscale = _scale_x;
		clone_obj.y = pos_y; //Posicionar Inimigo
		
		if _sprite_color{ // Colocar cor específica para o inimigo 
			clone_obj.image_blend = _sprite_color ;
		}
		
		if _random_color{ // Coloca uma cor aleatória para o inimigo [ ARRUMAR DEPOIS ]
			var color = make_color_hsv(255, random(122),200);
			clone_obj.image_blend = color;
		}
	}
}

// Seleciona um inimigo aleatoriamente para ser spawnado 
function selec_inimigo_aleatorio(){
	var quant_inimigos = array_length(tipos_inimigos); // Quantos tipos de inimigos tem
	var n_aleatorio = irandom(quant_inimigos -1);
	
	return  tipos_inimigos[n_aleatorio];
}

// ** Velocidade ** 

function handle_aumento_velocidade(){
	if (player_score - score_desde_aumento >= intervalo_aumento)
	{	
		var nova_velocidade = clamp(global.velocidade_fase + AUMENTO_VELOCIDADE,0,VELOCIDADE_MAXIMA)
		if (nova_velocidade != VELOCIDADE_MAXIMA)
		{	
			show_debug_message("Aumentando velocidade")
			score_desde_aumento = player_score
			global.velocidade_fase = nova_velocidade
			atualizar_velocidade_cenario() // Objetos ja lidam com o próprio aumento de velocidade, mas as camadas de fundo, não
		}
	}
}

function atualizar_velocidade_cenario(){
	var layer_montanhas = layer_get_id("Montanhas")
	var layer_chao = layer_get_id("Chao")
	if layer_montanhas // Subtrai pq a velocidade aumenta indo pra esquerda do plano ( x descresce )
	{
		layer_hspeed(layer_montanhas,layer_get_hspeed(layer_montanhas) - AUMENTO_VELOCIDADE)
	}
	
	if layer_chao
	{
		layer_hspeed(layer_chao,layer_get_hspeed(layer_chao) - AUMENTO_VELOCIDADE)
	}
}

// * "Runtime" <-- Não é esse nome mas me esqueci * //

// Criando corações pro player
show_debug_message("Chamando criar coracao");
criar_ui_coracao(3);
