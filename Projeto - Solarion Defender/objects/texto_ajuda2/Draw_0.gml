/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()
draw_set_font(MainFont)
draw_set_color(c_white)


camera_get_view_x(view_camera[0])

centro_x = (camera_get_view_x(view_camera[0]) +   (camera_get_view_width(view_camera[0])/2)) 
centro_y = (camera_get_view_y(view_camera[0]) +   (camera_get_view_height(view_camera[0])/2))

topo_y = camera_get_view_y(view_camera[0])

//draw_text(centro_x/2, centro_y / 2, "CONTROLE1")



draw_set_halign(fa_center)
draw_set_valign(fa_middle)

texto = " Pular - Barra de Espaço\n\nAtirar - Botão Esquerdo do Mouse\n\n Pausar/Despausar - Tecla P\n\n Sair/Voltar da tela cheia - Botão Esc"

draw_set_font(MainFont)
draw_text(centro_x,topo_y + 80, "Controles")
draw_set_font(MainFont)
draw_text_transformed(centro_x,centro_y - 30, texto,0.8,0.8,0)

//draw_text(1300,250 , "Gameplay")