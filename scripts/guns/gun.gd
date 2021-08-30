extends Node2D

const NOISE = preload("res://scripts/noise.gd")
var noise = NOISE.new()

var shoot_available = true
export var cooldown = 0.5
export var dispersion = 5
export var scope = 200
export var color = Color(1,1,1)
export var rafaga_size = 3
var rafaga_state = rafaga_size
var rafaga_side


func shoot(var side : String = ""):
	print("ray"+side)
	if !has_node("ray"+side ):
		print("ERROR, no has ray cast whit name: ", "ray"+side)
	else:
		if get_parent().ammo > 0:
			shoot_available = false
			get_parent().ammo -= 1
			get_node("ray"+side).rotation_degrees = rand_range(-dispersion,dispersion)
			if get_node("ray"+side).is_colliding():
				var collider = get_node("ray"+side).get_collider()
				var point 	 = get_node("ray"+side).get_collision_point()
				#print(point)
				if collider.has_method("_on_shot"):
					collider._on_shot(point)
				#print(collider.position)
				#collider.apply_impulse(Vector2.ZERO, Vector2(-1,-1) )
			chknode("cooldown").start()
		
			
			#get_parent().make_noise(to_global(position),400, get_parent().get_parent().get_children())
			noise.make_noise(to_global(position),400, get_node("/root/world").get_children())
			
			
			chknode("fire"+side).emitting = true
			chknode("shell"+side).emitting = true
			chknode("shotSound").playing = true
			#$Light.enabled = true
			chknode("hand"+side).frame = 0
			chknode("hand"+side).play()
			chknode("gun"+side).play()
			chknode("TimerParticles").start()

func chknode(var node : String):
	if has_node(node):
		return get_node(node)


func _on_cooldown_timeout():
	shoot_available = true

func rafaga(var side : String = ""):
	
	if rafaga_state > 0:
		shoot(side)
		
		get_node("rafaga" + side ) .start()
		rafaga_state -=  1
	else:
		rafaga_state = rafaga_size
	

func _on_rafaga_timeout():
	pass
	rafaga()
	
func _on_rafagaR_timeout():
	pass # Replace with function body.
	rafaga("R")
	#print("r")

func _on_rafagaL_timeout():
	pass # Replace with function body.
	rafaga("L")
	#print("l")
	
func _on_TimerParticles_timeout():
	if has_node("fire"):
		$fire.emitting = false
		$shell.emitting = false
	else:
		$fireR.emitting = false
		$fireL.emitting = false
		$shellR.emitting = false
		$shellL.emitting = false
		
		

