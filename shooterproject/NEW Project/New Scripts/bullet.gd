extends Area2D


var direction: Vector2
const SPEED = 2


func _physics_process(delta: float) -> void:
	global_position += direction * SPEED
