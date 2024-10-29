/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

_musica_menu = audio_play_sound(som_menu,1,true,1,12.76)

_fade_out = false
a = 0
b = 1

//image_alpha = 1

x = view_wport /2
y = view_hport / 2


//tamanho = (Intro.inst_330A2296.tamanho_intro)/1000


function fade_out_screen(){
	_fade_out = true
}