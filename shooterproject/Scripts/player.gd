extends CharacterBody2D

var moveSpeed = 500
var bullet_speed = 2000
var bullet = preload("res://Scencs/bullet.tscn")

@onready var shoot_point: Marker2D = $ShootPoint


func _ready():
	pass
func _physics_process(delta):
	
	get_input()
	move_and_slide()
	player_weapon()
	
	
	#var motion = Vector2()
	#if Input.is_action_pressed("up"):
		#motion.y -= 1
	#if Input.is_action_pressed("down"):
		#motion.y += 1
	#if Input.is_action_pressed("right"):
		#otion.x += 1
	#if Input.is_action_pressed("left"):
		#motion.x += 1
		
	#motion = motion.normalized()
	#motion = move_and_slide() 
	#look_at(get_global_mouse_position())
	
	#f Input.is_action_just_pressed("shoot"):
		#ire()
	
	
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.global_position = shoot_point.global_position
	bullet_instance.rotation_degrees = rotation_degrees
	#bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

#unc kill():
	#et_tree().reload_current_scene()

#func _on_area_2d_body_entered(body: Node2D) -> void:
#	if "enemy" in body.name:
#		kill()

func get_input():
	var input_direction = Input.get_vector("left","right","up", "down" )
	velocity = input_direction * moveSpeed
	look_at(get_global_mouse_position())
	
	
func player_weapon():
	if Input.is_action_just_pressed("shoot"):
		fire()
