extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://NEW Project/New Scenes/World.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
