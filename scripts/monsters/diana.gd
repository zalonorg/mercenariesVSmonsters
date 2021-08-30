extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func num2sign (var num : float):
	if num > 0:
		return 1
	elif num < 0:
		return -1
	else:
		return 0
func position2dir(var coord : Vector2):
	return Vector2(
		num2sign( self.position.x- coord.x),
		num2sign( self.position.y- coord.y))
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func hear_noise(var source : Vector2 ):
	look_at(source)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	pass
	
func _on_shot(var collisionPoint):
	pass
	print("ahy!!")
	#apply_impulse(collisionPoint.normalized() , position.normalized()* 20 )
	get_node("/root/world/interface").addLoot("PELOTA")
	
	
	#print(position2dir(shoter.global_position))
	#apply_impulse(Vector2(0,0) , self.position - shoter.global_position)
	#apply_impulse(Vector2(0,0), Vector2(cos(collisionPoint.rotation)*10,sin(collisionPoint.rotation)*10 ))
	#print(cos(shoter.rotation)*10 , ":::", sin(collisionPoint.rotation)*10)
	#print(self.position , ":::" , shoter.global_position )
