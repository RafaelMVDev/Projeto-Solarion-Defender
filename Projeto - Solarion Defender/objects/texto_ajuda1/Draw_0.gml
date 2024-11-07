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


texto_ajuda = "Você é Cyto, um bravo paladino de Solarion\n\n, e precisa defender seu planeta da invasão dos Virox !\n\n Avance e derrote os inimigos para aumentar seu score\n\n,Mas nao deixe que eles te atinjam !\n\n Você tem apenas 3 vidas !"

draw_set_font(MainFont)
draw_text(centro_x,topo_y + 80, "Gameplay")
draw_set_font(MainFont)
draw_text_transformed(centro_x,centro_y - 30, texto_ajuda,0.7,0.7,0)

//draw_text(1300,250 , "Gameplay")