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