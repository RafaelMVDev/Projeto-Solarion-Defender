if keyboard_check_pressed(vk_enter){
	audio_stop_all()
	room_goto(menu)
}

if keyboard_check_pressed(vk_space){
	audio_stop_all()
	room_goto(menu)
}

if keyboard_check_pressed(vk_backspace){
	audio_stop_all()
	room_goto(menu)
}

if keyboard_check_pressed(vk_escape){
	audio_stop_all()
	room_goto(menu)
}

if inst_418F75D6.image_index == quant_sprites{
	
	inst_418F75D6.image_speed = 0
}