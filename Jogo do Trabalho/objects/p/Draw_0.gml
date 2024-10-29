/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()

image_xscale = clamp(image_xscale - 0.15, 1, 10)
image_yscale = clamp(image_yscale - 0.15, 1, 10)

if point_distance(x, y, inst_470EB9BB.x, inst_470EB9BB.y) > 5
{
    move_towards_point(inst_470EB9BB.x, inst_470EB9BB.y, 5);
}
else speed = 0;