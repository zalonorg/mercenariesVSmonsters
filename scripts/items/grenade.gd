extends RigidBody2D


const NOISE = preload("res://scripts/noise.gd")
const GUN = preload("res://scripts/guns/gun.gd")

var noise = NOISE.new()
var fragment = GUN.new()


func _on_Timer_timeout():
	pass # Replace with function body.
	if has_node("Collision"):
		$Particles.emitting = true
		$Collision.queue_free()
		$Light2D.enabled = true
		noise.make_noise(position,400, get_node("/root/world").get_children())
		
		$Timer.start()
		$TimerLight.start()
		
		fragment.shoot()
#		for child in get_node("/root/world").get_children():
#			if child.has_method("_on_shot") and position.distance_to(child.position) <= 50:
#				child._on_shot(position)
	
	
	
	else:
		queue_free()


func _on_TimerLight_timeout():
	$Light2D.enabled = false


