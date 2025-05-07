extends Node2D

var unhappy_scene = preload("res://NEW Project/New Scenes/unhappy.tscn")

@onready var player = $player_character

func _on_timer_timeout() -> void:
	var unhappy = unhappy_scene.instantiate()
	
	unhappy.global_position = player.global_position

	while unhappy.global_position.distance_squared_to(player.global_position) < 10000:
		unhappy.global_position.x = randi_range(0, get_viewport_rect().size.x)
		unhappy.global_position.y = randi_range(0, get_viewport_rect().size.y)

	add_child()
