extends KinematicBody2D

onready var GRENADE = preload("res://scenes/items/grenade.tscn")
onready var BENGAL = preload("res://scenes/items/bengal.tscn")
onready var STIMPACK = preload("res://scenes/items/stimpack.tscn")

export var accel = 4
export var speed = 64
export var camShift = 1.7
export var Player_color = Color(1,1,1)

export var maxAmmo = 50
var ammo = maxAmmo


export var upgrades = {amount = 0, rate = 0}
var gun_in_use

var vel = Vector2()
var stimOnUse = false


func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	gun_in_use = str("gun", upgrades.amount, "_", upgrades.rate)

	#put the color in the hands
	if get_node(gun_in_use).has_node("hand"):
		get_node(gun_in_use).get_node("hand").modulate = Player_color 
	else:
		get_node(gun_in_use).get_node("handR").modulate = Player_color
		get_node(gun_in_use).get_node("handL").modulate = Player_color

	get_node(gun_in_use).visible = true
	get_node(gun_in_use).color = Player_color 
	$Sprite.modulate = Player_color
	pass
	
func _input(event):
	pass


func _process(delta):
	
	##########
	#controls#
	##########
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
	var target_dir = Vector2(0, 0)
	if Input.is_action_pressed("up"):
		target_dir.y -= 1
	if Input.is_action_pressed("down"):
		target_dir.y += 1
	if Input.is_action_pressed("left"):
		target_dir.x -= 1
	if Input.is_action_pressed("right"):
		target_dir.x += 1
	
#	target_dir = target_dir.normalized().rotated(-rotation.y)
	target_dir = target_dir.normalized()
	
	vel.x = lerp(vel.x, target_dir.x * speed, accel * delta)
	vel.y = lerp(vel.y, target_dir.y * speed, accel * delta)

	move_and_slide(vel, Vector2(0, 0))
	
	
	######
	#shot#
	######
	if upgrades.rate < 2:
		if Input.is_action_just_pressed("shoot"):
			triggerGun()
	else:
		if Input.is_action_pressed("shoot"):
			triggerGun()
	
	
	#######
	#ITEMS#
	#######
	
	if Input.is_action_just_pressed("item1"):
		if !stimOnUse:
			stimOnUse = true
			throw(STIMPACK,20)
			$stimpackTimer.start()
			accel /= 2 
			speed *= 2
		
	if Input.is_action_just_pressed("item2"): 
		throw(BENGAL,500)
	
	if Input.is_action_just_pressed("item3"): 
		throw(GRENADE,500)
		
	
	
	########
	#Camera#
	########
	
	look_at(get_global_mouse_position())
	if get_local_mouse_position().x < 162:
		$Camera.position =  log(camShift) * get_local_mouse_position()
	#$Camera/interface.set_rotation(-rotation)
	#$interface.set_rotation(-rotation)
	
	########
	#cheats#
	########
	
	if Input.is_action_just_pressed("amountUp"):
		upgrades.amount += 1
		updateGun()
	if Input.is_action_just_pressed("amountDown"):
		upgrades.amount -= 1
		updateGun()
	if Input.is_action_just_pressed("rateUp"):
		upgrades.rate += 1
		updateGun()
	if Input.is_action_just_pressed("rateDown"):
		upgrades.rate -= 1
		updateGun()	

func triggerGun():
	get_node(gun_in_use).trigger()

func throw(var item, var force : float):
	var throwable = item.instance()
	#get_parent().add_child(throwable)
	get_node("/root/world").add_child(throwable)
	throwable.position = self.position + Vector2(cos(rotation)*10,sin(rotation)*10)
	throwable.apply_impulse(
		Vector2(0,0),
		Vector2(cos(rotation)*force,sin(rotation)*force)
		)
	

func _on_stimpackTimer_timeout():
	pass # Replace with function body.
	accel *= 2 
	speed /= 2
	stimOnUse = false

func updateGun():
	pass
	$gun0_0.visible = false
	$gun1_0.visible = false
	$gun0_1.visible = false
	$gun1_1.visible = false
	$gun0_2.visible = false
	$gun0_3.visible = false
	_ready()
