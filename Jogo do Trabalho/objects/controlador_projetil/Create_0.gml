/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

tempo_entre_disparos = 500000 // 0.5 segundo
ultimo_disparo = get_timer()
projeteis = []



function atirar_projetil(){
	var _projetil = instance_create_layer(inst_60ADEB33.x + 32, inst_60ADEB33.y - 80, layer_get_id("Instances"), projetil_player)
	array_push(projeteis,_projetil)
}

function parar_projetil(){
	hspeed = 0
}


function deletar_projetil(){
	instance_destroy(self)
}


function deletar_projeteis(){
	for (i = 0; i < array_length(projeteis); i++;)
	{
		var inst = projeteis[i]
	
		if inst.object_index == projetil_player.object_index
		{	
			instance_destroy(inst)
		}
	}
	
	projeteis = []
}