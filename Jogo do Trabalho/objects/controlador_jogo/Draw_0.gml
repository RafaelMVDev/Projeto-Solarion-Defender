/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//desenharPausaMenu()

// Morte do player

if global.player_dead_state{
	show_debug_message("Desenhado")
	game_over_desenhado = true
	//draw_sprite_ext
	inst_60ADEB33.image_speed = 0
	inst_60ADEB33.image_index = 0
	
	draw_sprite_ext(spr_prot_morte,image_index,inst_60ADEB33.x, inst_60ADEB33.y,4.5,4.5,0,c_white,1) 
}