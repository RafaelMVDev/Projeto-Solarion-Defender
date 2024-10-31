image_xscale = image_xscale + (image_xscale * global.var_aspect_ratio_x)
image_yscale = image_xscale + (image_xscale * global.var_aspect_ratio_y)

x = x + (x * global.var_aspect_ratio_x)
y = y + (y * global.var_aspect_ratio_y)


/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//if !desativado{
	//desativado = true

	audio_play_sound(som_hit_inimigo,1,false)
	other.perderVida()
	
	instance_destroy(self)
	other.vivo = false 
	//self
//}