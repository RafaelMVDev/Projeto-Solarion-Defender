/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if ir_menu{
	if initialpos != 0{
		initialpos = clamp(initialpos - 25,0, 1100)
		camera_set_view_pos(view_camera[0], initialpos,0)
	}
	else{
		ir_menu = false
	}
	
}



meio_x = view_wport / 2
if fade_out_texto{
	draw_set_font(MainFont)
	draw_text_color(x,y ,"Aperte qualquer tecla para continuar",c_white,c_white,c_white,c_white,texto_alpha)
	texto_alpha = clamp(texto_alpha - 0.01,0,1)
	if texto_alpha == 0{
		fade_out_texto = false
		fade_in_texto = true
	}
}

if fade_in_texto{
	draw_set_font(MainFont)
	draw_text_color(x,y,"Aperte qualquer tecla para continuar",c_white,c_white,c_white,c_white,texto_alpha)
	texto_alpha = clamp(texto_alpha + 0.01,0,1)
	if texto_alpha == 1{
		fade_out_texto = true
		fade_in_texto = false
	}
}