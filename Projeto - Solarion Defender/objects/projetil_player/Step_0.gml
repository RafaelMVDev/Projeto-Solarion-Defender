/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (x >= view_wport )
	{	
		instance_destroy(self)
	}
else{
	if global.player_dead_state == false {
		x += 5
	}

}