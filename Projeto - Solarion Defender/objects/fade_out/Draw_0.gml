/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if _fade_out{
	
	a = clamp(a + ( 1 * 0.007),0,1)
	b = clamp(b - ( 1 * 0.007),0,1)
	
	if a == 1 {
		audio_stop_all()
		room_goto(Gameplay)
	}
	
	x = 0
	y = 0
	
	image_xscale = view_wport
	image_yscale = view_hport
	
	audio_sound_gain(_musica_menu, b, 1);
	image_alpha = a
	show_debug_message(string(x) + " " + string(y))
	show_debug_message(string(image_alpha))
	
}