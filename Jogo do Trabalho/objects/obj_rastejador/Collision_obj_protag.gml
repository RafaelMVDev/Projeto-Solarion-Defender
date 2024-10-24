/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if not(tocouPlayer) {
	tocouPlayer = true
	//hspeed += 0
	
	perderVida()
	if global.player_vidas == 0{
		inst_60ADEB33.vivo = false
	}
	//vivo = false
	//draw_text_transformed(480,200,"GAME OVER",0.5,0.5,0)
	//show_debug_message("Tocou player no tempo: {}, get_timer()")
}
else{
	//tocouPlayer = true
}