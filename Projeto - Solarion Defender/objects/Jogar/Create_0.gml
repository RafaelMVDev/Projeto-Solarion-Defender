/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


//tamanho = (Intro.inst_330A2296.tamanho_intro)/1000


function activate_fade_out(){

	
	if layer_exists("FadeOut"){
		var fade_out_objects = layer_get_all_elements("FadeOut")
		show_debug_message("Tamnho layer" + string(array_length(fade_out_objects)))
		if ( array_length(fade_out_objects)) >= 1{
			var fade_out_obj = layer_instance_get_instance(fade_out_objects[0])
			show_debug_message(string(fade_out_obj))
			if fade_out_obj != -1 {
				show_debug_message("ajuda")
				fade_out_obj._fade_out = true
			}

		}
		else{
			room_goto(Gameplay)
		}
	}
	else{
		//room_goto(Gameplay)
	}
}