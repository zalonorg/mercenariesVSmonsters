extends Node2D
onready var ZOMBI = preload("res://scenes/monsters/zombi.tscn")
onready var SKELETON = preload("res://scenes/monsters/skeleton.tscn")
onready var FIRE = preload("res://scenes/monsters/fire.tscn")

export var spawneables = ["ZOMBI", "SKELETON", "FIRE"]

func _on_Timer_timeout():
	var nspawneables = spawneables.size()
	#print(nspawneables)
	spaw( spawneables[rand_range(0,nspawneables) ] )
	#spaw( spawneables[1] )
	#print(spawneables[rand_range(0,nspawneables) ])
	
	
func spaw(var spawneable):
	var mob = get(spawneable).instance()
	#get_parent().add_child( mob )
	#get_tree().get_root().add_child( mob )
	get_node("/root/world").add_child(mob)
	######## get el contenido de una variable
#	mob.position = self.position
	mob.position = to_global(position)
	mob.rotation_degrees = rand_range(1,360)
