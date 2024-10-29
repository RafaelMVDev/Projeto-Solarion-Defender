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