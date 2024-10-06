/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if inst_60ADEB33.vivo == false{
	
	vspeed = 0 
}
else
{
	if (mouse_check_button_pressed(mb_left)) && (get_timer() - ultimo_disparo) > tempo_entre_disparos
	{	
		ultimo_disparo = get_timer()
		show_debug_message("Clicado")
		atirar_projetil()
	}
}