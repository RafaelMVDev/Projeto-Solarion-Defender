/// @description Inserir descrição aqui
draw_self()
draw_set_font(MainFont)
draw_set_color(c_white)


camera_get_view_x(view_camera[0])

centro_x = (camera_get_view_x(view_camera[0]) +   (camera_get_view_width(view_camera[0])/2)) 
centro_y = (camera_get_view_y(view_camera[0]) +   (camera_get_view_height(view_camera[0])/2))

topo_y = camera_get_view_y(view_camera[0])

//draw_text(centro_x/2, centro_y / 2, "CONTROLE1")

texto_ajuda = "Virulon- Um inimigo simples.\n\n Você pode desviar, \n\n ou atirar projetéis para derrotá-lo.\n\n  Bacvirux - Esse é um dos grandes! \nVocê só passa por ele se derrotá-lo.\n\n Plak - Cuidado, ele é seu amigo!\nVocê perde vidas se acertá-lo."


draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(MainFont)
draw_text(centro_x,topo_y + 80, "Inimigos")
draw_set_font(MainFont)
draw_text_transformed(centro_x,centro_y - 30, texto_ajuda,0.8,0.8,0)

//draw_text(1300,250 , "Gameplay")