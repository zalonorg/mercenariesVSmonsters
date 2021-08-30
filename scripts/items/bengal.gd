extends RigidBody2D
#onready var LIGHT = load("res://scripts/light.gd").new()

func _ready():
	angular_velocity = rand_range(-10,10)
	#apply_torque_impulse(rand_range(-1,1))		

func _process(delta):
	#LIGHT.light2player( self.position , get_parent().get_node("player") , $Light )
	$Light.position = to_local(get_parent().get_node("player").position)
	$Light.offset = -to_local(get_parent().get_node("player").position)
	
func _on_fireOn_timeout():
	$Particles.emitting = true
	$Light.enabled = true
	
func _on_fireLow_timeout():
	#primero empieza con un tiempo de 20 pero una vez se ejecuta cambia su tiempo a 0.1
	$Particles.amount -= 0.1 
	$Light.energy -= 0.1
	
	$Audio.pitch_scale -= 0.05
	$Audio.volume_db -= 1
		
	$fireLow.wait_time = 0.1
	$fireLow.start()
	if	$Particles.amount <= 1:
		$Particles.emitting = false
		$Light.enabled = false

	
func _on_TTL_timeout():
	queue_free()

var i = 0
func _on_fireBlink_timeout():
	i += 1
	$Light.energy += sin(i)/10
