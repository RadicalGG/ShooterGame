extends Area2D


var direction: Vector2
const SPEED = 9

var deathAnim = preload("res://NEW Project/New Scenes/enemy_death_anim.tscn")

func _physics_process(delta: float)  -> void:
	global_position += direction * SPEED


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
		GlobalScore.score += 1
		queue_free()
		
		#var death = deathAnim.instantiate()
		#death.global_postition = global_position
		#death.emitting = true
		#death.lifetime = randf_range(0.3, 0.7)
		
		var death = deathAnim.instantiate()
		death.global_position = Vector2(global_position) 
		
		get_tree().current_scene.add_child(death)
