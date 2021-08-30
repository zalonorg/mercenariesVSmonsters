extends "res://scripts/guns/gun.gd"
#
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
	#$gunL.modulate = color
	#$gunR.modulate = color
	
	$cooldown.wait_time = cooldown
	$latency.wait_time = cooldown/2
	 #print($latency.wait_time)
#	$cooldown.wait_time = cooldowns[get_parent().upgrades.rate]
#	get_parent().upgrades.rate
#	print(cooldowns[get_parent().upgrades.rate])
	$TimerParticles.wait_time = 0.1
	$rayR.cast_to.x  = scope
	$rayL.cast_to.x  = scope
	#print(cooldown)
	
	#$AnimatedSprite.modulate = Player_color
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func trigger():
	if shoot_available:	
		shoot("R")
		#shoot("L")
		$latency.start()
	
func _on_latency_timeout():
	shoot("L")
#
#func shoot(var side : String):
#	shot_available = false
#	get_node("fire"+side).emitting = true
#	get_node("shell"+side).emitting = true
#	$shotSound.playing = true
#	#$Light.enabled = true
#	get_node("hand"+side).frame = 0
#	get_node("ray"+side).rotation_degrees = rand_range(-dispersion,dispersion)
#	get_parent().make_noise(to_global(position),400, get_parent().get_parent().get_children() )
#
#	if get_node("ray"+side).is_colliding():
#		var collider = get_node("ray"+side).get_collider()
#		var point 	 = get_node("ray"+side).get_collision_point()
#		#print(point)
#		if collider.has_method("_on_shot"):
#			collider._on_shot(point)
#		#print(collider.position)
#		#collider.apply_impulse(Vector2.ZERO, Vector2(-1,-1) )
#
#	get_node("hand"+side).play()
#	get_node("gun"+side).play()
#	$cooldown.start()
#	$TimerParticles.start()
#
#
##func _on_latency_timeout():
##	shoot("R")
##
##	$fireL.emitting = true
##	$shellL.emitting = true
##	$shotSound.playing = true
###	$Light.enabled = true
##	$handL.frame = 0
##	$rayL.rotation_degrees = rand_range(-dispersion,dispersion)
##	get_parent().make_noise(to_global(position),400, get_parent().get_parent().get_children() )
##
##	if $rayL.is_colliding():
##		var collider = $rayL.get_collider()
##		var point 	 = $rayL.get_collision_point()
##		#print(point)
##		if collider.has_method("_on_shot"):
##			collider._on_shot(point)
##		#print(collider.position)
##		#collider.apply_impulse(Vector2.ZERO, Vector2(-1,-1) )
##
##	$handL.play()
##	$cooldown.start()
##	$TimerParticles.start()
#
#
#func _on_cooldown_timeout():
#	pass # Replace with function body.
#	shot_available = true
#
#
#
#func _on_TimerParticles_timeout():
#	pass # Replace with function body.
#	$fireR.emitting = false
#	$shellR.emitting = false
#	#$LightR.enabled = false
#
#	$fireL.emitting = false
#	$shellL.emitting = false
#	#$LightL.enabled = false
#
#
