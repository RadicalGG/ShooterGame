extends CharacterBody2D

var moveSpeed = 500
var bullet_speed = 2000
var bullet = preload("res://bullet.tscn")


func _ready():
	pass
func _physics_process(delta):
	var motion = Vector2()
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x += 1
		
	motion = motion.normalized()
	motion = move_and_slide() 
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		fire()
	
	
func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_postition()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().reload_current_scene()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "enemy" in body.name:
		kill()
