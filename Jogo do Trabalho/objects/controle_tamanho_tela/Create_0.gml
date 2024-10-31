/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//window_set_fullscreen(true)


function update(){
	var room_starting_wport = view_wport[0]
	var room_starting_hport = view_hport[0]

	//view_wport[0] = display_get_width()
	//view_hport[0] = display_get_height()

	//window_set_size(view_wport[0],view_hport[0])
	//global.var_aspect_ratio_x = abs((room_starting_wport/view_wport[0])-1)
	//global.var_aspect_ratio_y = abs((room_starting_hport/view_hport[0])-1)
	//window_set_position(0,0)

	if (view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface))
	{
		surface_resize(application_surface,view_wport[0],view_hport[0])
	}
}



update()