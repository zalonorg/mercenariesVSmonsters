extends Node2D

func light2player(var fountOfLight:Vector2, var player:Node2D, var light:Node2D):
	#esta funcion es para hacer que la fuente de luz sea el jugador
	#asu le tapa la luz que no puede ver
	
	#light.offset = -to_local(player.position)+fountOfLight
	light.position = to_local(player.position) - to_local(fountOfLight)
