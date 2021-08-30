extends RigidBody2D
#onready var LIGHT = load("res://scripts/light.gd").new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var initDir = rand_range(1,360)
var F = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#apply_impulse(Vector2.ZERO ,  Vector2(cos(initDir)*F,sin(initDir)*F ) )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#LIGHT.light2player( self.position , get_parent().get_node("player") , $Light2D )
	$Light2D.position = to_local(get_parent().get_node("player").position)
	$Light2D.offset = -to_local(get_parent().get_node("player").position)

func _on_shot(var collisionPoint):
	pass
	apply_impulse(collisionPoint.normalized() , position.normalized()* 20 )
