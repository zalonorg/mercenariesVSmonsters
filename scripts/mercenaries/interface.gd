extends CanvasLayer
onready var PELOTA = preload("res://scenes/mercenaries/pelota.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$head.modulate = get_node("/root/world/player").Player_color
	
	pass # Replace with function body.

func addLoot(var item):
	var loot = get(item).instance()
	$ViewportContainer/Viewport/interface3D.add_child(loot)
	loot.translation = $ViewportContainer/Viewport/interface3D/spawnpoint.translation

	
func _process(delta):
	playerVar2interface("ammo","ammunition")
	playerVar2interface("item1","item1")
	playerVar2interface("item2","item2")
	playerVar2interface("item3","item3")
	
	
func playerVar2interface(var variable : String , var slot : String): 
	get_node("icons/"+slot+"/Label").text = str(get_node("/root/world/player").get(variable))


#	if 	$ViewportContainer/Viewport/interface3D/glass/Area
