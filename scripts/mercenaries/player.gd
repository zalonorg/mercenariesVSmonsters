extends KinematicBody2D

onready var GRENADE = preload("res://scenes/items/grenade.tscn")
onready var BENGAL = preload("res://scenes/items/bengal.tscn")
onready var STIMPACK = preload("res://scenes/items/stimpack.tscn")

onready var GUN0_0 = preload("res://scenes/guns/gun0-0.tscn")
onready var GUN1_0 = preload("res://scenes/guns/gun1-0.tscn")
onready var GUN0_1 = preload("res://scenes/guns/gun0-1.tscn")
onready var GUN1_1 = preload("res://scenes/guns/gun1-1.tscn")
onready var GUN0_2 = preload("res://scenes/guns/gun0-2.tscn")
onready var GUN0_3 = preload("res://scenes/guns/gun0-3.tscn")

export var accel = 4
export var speed = 64
export var camShift = 1.7
export var Player_color = Color(1,1,1)

export var maxAmmo = 50
var ammo

export var maxItem1 = 5
export var maxItem2 = 5
export var maxItem3 = 5

var item1 = maxItem1
var item2 = maxItem2
var item3 = maxItem3

export var upgrades = {amount = 0, rate = 0}
var gun
var gun_in_use

var vel = Vector2()
var stimOnUse = false

var cursor = Vector2.ZERO

func _ready():
	updateGun(false)
	
	$Sprite.modulate = Player_color
	ammo = maxAmmo
	
func _input(event):
	pass
######################################################
var joystik_sens= 3000.0

func _physics_process(delta):
	
	##################
	#joystik to mouse#
	##################
	
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()

	var movement = joystik_sens * direction * delta
	if (movement):  
		get_viewport().warp_mouse( Vector2(213,120) + movement ) 
#		get_viewport().warp_mouse( get_local_mouse_position()+movement ) 
########################################################
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
		if item1 > 0:
			if !stimOnUse:
				stimOnUse = true
				throw(STIMPACK,20)
				$stimpackTimer.start()
				accel /= 2 
				speed *= 2
				
				item1 -= 1
		
	if Input.is_action_just_pressed("item2"): 
		if item2 > 0:
			throw(BENGAL,500)
			item2 -= 1
	if Input.is_action_just_pressed("item3"): 
		if item3 > 0:
			throw(GRENADE,500)
			item3 -= 1 
	
	
	########
	#Camera#
	########
	cursor = get_global_mouse_position()
	look_at(cursor)
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
	gun.trigger()

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

func updateGun(var delete_old_gun : bool = true):
	if delete_old_gun:
		gun.queue_free()
		
	gun_in_use = str("GUN", upgrades.amount, "_", upgrades.rate)
	gun = get(gun_in_use).instance()
	
#	for child in $gun.get_children():
#		print(child.name)
#		print(gun.name)
#		$gun.get_node(child.name).queue_free()
##		gun.queue_free()
#		pass
	
	add_child(gun)
	
	#put the color in the hands
	if  gun.has_node("hand"):
		gun.get_node("hand").modulate = Player_color 
	else:
		gun.get_node("handR").modulate = Player_color
		gun.get_node("handL").modulate = Player_color	

func resupply():
	ammo = maxAmmo
	item1 = maxItem1
	item2 = maxItem2
	item3 = maxItem3
	pass

