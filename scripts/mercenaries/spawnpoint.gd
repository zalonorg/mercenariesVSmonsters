extends Node2D

onready var PLAYER = preload("res://scenes/player.tscn")
var player

func _ready():
	spawnPlayer()
#	player = PLAYER.instance()
#	#get_parent().add_child(player)
##	get_node("/root/world").add_child(player)
#	get_node("/root").add_child(player)
##	player.position = self.position + Vector2(cos(rotation)*10,sin(rotation)*10)
#	pass
	
func spawnPlayer():
	player = PLAYER.instance()
	#get_parent().add_child(player)
#	get_node("/root/world").add_child(player)
	get_node("/root").add_child(player)
#	player.position = self.position + Vector2(cos(rotation)*10,sin(rotation)*10)
	pass
	
