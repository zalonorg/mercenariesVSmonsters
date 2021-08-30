extends KinematicBody2D
#var hola = get_parent().get_node_or_null("player")
#var target = get_parent().get_node("player") 
export var speed = 1000
export var rotation_amount  = 90 
export var targetName = "player" 

var target = self
var persecution  = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	#add_force(Vector2.ZERO ,  Vector2(cos(rotation)*20,sin(rotation)*20 ) )
	#add_force(Vector2(0,2), Vector2(5,0))
	#add_force(Vector2(0,-2), Vector2(-5,0))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	var forward = position + Vector2.RIGHT 
	

	
	move_and_slide( position-to_global( Vector2(-speed * delta,0)) , Vector2(0, 0))
	if $testFront.is_colliding()  and  $testFront.get_collider().name != targetName:
		rotation_degrees += 180
	
	if persecution:
		look_at(target.position )
		speed = 2000
	if !persecution:
		speed = 1000
		
func _on_shot(var collisionPoint ):
	queue_free()
	get_node("/root/world/interface").addLoot("PELOTA")
	
func hear_noise(var source : Vector2 ):
	look_at(source)

func _on_TimerDir_timeout():
	pass # Replace with function body.
	if !persecution:
		rotation_degrees += rand_range(-rotation_amount,rotation_amount)


func _on_vision_body_entered(body):
	pass # Replace with function body
	if body.name == targetName:
		$TimerDir.stop()
		persecution = true
		target = body
		look_at(body.position)
		

func _on_vision_body_exited(body):
	pass # Replace with function body.
	if body.name == targetName:
		persecution = false
		$TimerDir.start()
