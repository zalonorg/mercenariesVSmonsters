extends "res://scripts/guns/gun.gd"

#var shot_available = true
#export var cooldown = 0.5
#export var dispersion = 5
#export var scope = 200
#export var color = Color(1,1,1)

#export var Player_color = Color(1,1,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
#	$cooldown.wait_time = 0.25
	$cooldown.wait_time = cooldown
#	$cooldown.wait_time = cooldowns[get_parent().upgrades.rate]
#	get_parent().upgrades.rate
#	print(cooldowns[get_parent().upgrades.rate])
	$TimerParticles.wait_time = 0.1
	$ray.cast_to.x  = scope
	#print(cooldown)
	
	#$AnimatedSprite.modulate = Player_color
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func trigger():
	if shoot_available:
		shoot()
#
#
#func shoot():
#		shot_available = false
#		$fire.emitting = true
#		$shell.emitting = true
#		$shotSound.playing = true
#		$Light.enabled = true
#		$hand.frame = 0
#		$gun.frame = 0
#		$ray.rotation_degrees = rand_range(-dispersion,dispersion)
#		get_parent().make_noise(to_global(position),400, get_parent().get_parent().get_children() )
#
#		if $ray.is_colliding():
#			var collider = $ray.get_collider()
#			var point 	 = $ray.get_collision_point()
#			#print(point)
#			if collider.has_method("_on_shot"):
#				collider._on_shot(point)
#			#print(collider.position)
#			#collider.apply_impulse(Vector2.ZERO, Vector2(-1,-1) )
#
#		$hand.play()
#		$gun.play()
#		$cooldown.start()
#		$TimerParticles.start()
#
#func _on_cooldown_timeout():
#	pass # Replace with function body.
#	shot_available = true
#
#
#
#func _on_TimerParticles_timeout():
#	pass # Replace with function body.
#	$fire.emitting = false
#	$shell.emitting = false
#	$Light.enabled = false
