extends CanvasLayer
onready var PELOTA = preload("res://scenes/mercenaries/pelota.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addLoot(var item):
	var loot = get(item).instance()
	$ViewportContainer/Viewport/interface3D.add_child(loot)
	loot.translation = $ViewportContainer/Viewport/interface3D/spawnpoint.translation

	
func _process(delta):
	$icons/ammunition/Label.text = str(get_node("/root/world/player").ammo)
	
#	if 	$ViewportContainer/Viewport/interface3D/glass/Area
