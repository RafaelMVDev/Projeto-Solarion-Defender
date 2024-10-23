if keyboard_check_pressed(vk_enter or vk_space){
	audio_stop_sound(game_over)
	room_goto(Gameplay)
}

if inst_418F75D6.image_index == quant_sprites{
	show_debug_message("ÉEEEEEE")
	inst_418F75D6.image_speed = 0
}