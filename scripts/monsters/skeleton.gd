extends RigidBody2D
export var speed = 20
export var torque = 400
export var target = "player" 

var walk2front = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if body_exists():
		if $testFront.is_colliding()  and  $testFront.get_collider().name == target:
			apply_impulse(Vector2(0,0),Vector2(cos(rotation)*speed,sin(rotation)*speed ))
			
	$Line2D.points[1] = $ironBall.position
	
	
func _on_shot(var collisionPoint):
	$body.queue_free()
	get_node("/root/world/interface").addLoot("PELOTA")	
	$ironBall/TimerBall.start()
#	linear_velocity = Vector2.ZERO
#	$ironBall.linear_velocity = Vector2.ZERO
#	$ironBall.mode = RigidBody2D.MODE_STATIC
#

func _on_TimerBall_timeout():
	$ironBall/TimerBall.wait_time = 0.1
	
	$ironBall/Sprite.modulate.a -= 0.1
	$Line2D.default_color.a -= 0.1
	if $ironBall/Sprite.modulate.a8 == 0:
		queue_free()
	
	
func hear_noise(var source : Vector2 ):
	if body_exists():
		look_at(source)
		apply_impulse(Vector2(0,0),Vector2(cos(rotation)*speed,sin(rotation)*speed ))

	
func _on_TimerDir_timeout():
	pass # Replace with function body.
	var Angualdir = rand_range(1,360)
	var dir = deg2rad(Angualdir)
	
	
	if walk2front:
#		apply_impulse(Vector2(0,0), Vector2(speed,0) )
		apply_impulse(Vector2(0,0),Vector2(cos(rotation)*speed,sin(rotation)*speed ))
		walk2front = false
	else:
		apply_torque_impulse(rand_range(-torque,torque))
		walk2front = true
	
#	var dir = rand_range(1,360)
#	apply_impulse(Vector2(0,0),Vector2(cos(dir)*speed,sin(dir)*speed ))
#	rotation = dir
#	$Collision.rotation = dir
	
func body_exists():
	if get_node_or_null("body") == null:
		return false
	else: 
		return true


