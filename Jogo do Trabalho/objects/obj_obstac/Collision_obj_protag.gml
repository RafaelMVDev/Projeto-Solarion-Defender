/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if not(tocouPlayer) {
	tocouPlayer = true
	hspeed += 0
	obj_protag.vivo = false
	vivo = false
	//show_debug_message("Tocou player no tempo: {}, get_timer()")
}


show_debug_message(string("Tocou player no tempo: {0}", get_timer()))
