extends "res://scripts/guns/gun.gd"

func _ready():
	pass # Replace with function body.
#	$cooldown.wait_time = 0.25
	#$gunL.modulate = color
	#$gunR.modulate = color
	
	$cooldown.wait_time = cooldown
	$latency.wait_time = cooldown/2
	$rafagaR.wait_time = cooldown/6
	$rafagaL.wait_time = cooldown/6
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
		rafaga("R")
		rafaga("L")
		#$latency.start()
		
	
func _on_latency_timeout():
	pass

