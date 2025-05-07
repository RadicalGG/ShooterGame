extends CharacterBody2D

var bullet_scene = preload("res://NEW Project/New Scenes/bullet.tscn")
const SPEED = 200
@onready var ShootArea = $ShootArea

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	velocity.x = Input.get_axis("left", "right") * SPEED
	velocity.y = Input.get_axis("up", "down") * SPEED
	
	velocity = lerp(get_real_velocity(), velocity, 0.1)
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_postion = ShootArea.global_position
		bullet.diretion = (get_global_mouse_position() - global_position).normalized()
		
		
		$/root/Game.add_child(bullet)
		
		
	move_and_slide()
