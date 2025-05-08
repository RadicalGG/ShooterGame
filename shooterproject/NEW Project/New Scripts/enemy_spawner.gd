extends Node2D

var unhappy_scene = preload("res://NEW Project/New Scenes/unhappy.tscn")




func _on_timer_timeout() -> void:
	print("spawned enemy")
	var unhappy = unhappy_scene.instantiate()
	unhappy.position = position
	get_parent().get_node("EnemySpawner").add_child(unhappy)
	
