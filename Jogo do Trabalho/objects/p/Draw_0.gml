/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()

image_xscale = clamp(image_xscale - 0.4, 0.75, 10)
image_yscale = clamp(image_yscale - 0.4, 0.75, 10)

if point_distance(x, y, inst_4841DFCE.x, inst_4841DFCE.y) > 100
{	
	show_debug_message("Indo ali")
	show_debug_message(string(point_distance(x, y, inst_4841DFCE.x, inst_4841DFCE.y) ))
    move_towards_point(inst_4841DFCE.x, inst_4841DFCE.y, 100)
}

else {
	x = inst_4841DFCE.x
	y = inst_4841DFCE.y
	show_debug_message("chegou")
	reached = true
	speed = 0;
}