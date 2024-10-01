draw_self()

//draw_text(x,y-200,y)

if (place_meeting(x+16,y,obj_obstac))
{
	draw_text_transformed(480,200,"GAME OVER",5,5,0)
}

if (place_meeting(x+16,y,obj_rastejador))
{
	draw_text_transformed(480,200,"GAME OVER",5,5,0)
}