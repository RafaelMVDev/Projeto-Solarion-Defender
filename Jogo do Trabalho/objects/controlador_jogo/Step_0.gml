/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Detectar Pulo
if keyboard_check_pressed(ord("P")) && inst_60ADEB33.vivo{
	show_debug_message("Usuário pausou")
	jogoPausadoHandler()
}

// Player morreu
if inst_60ADEB33.vivo == false{
	playerMorreu()
}
else{
	aumentarScorePlayer(1,"Etapa")
}

// Score


