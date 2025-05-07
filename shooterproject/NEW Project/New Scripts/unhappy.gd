extends CharacterBody2D

@onready var player_character = $/root/World/player_character

const SPEED = 100

func _physics_process(delta: float) -> void:
	velocity = (player_character.global_position - global_position).normalized() * SPEED
	
	look_at(player_character.global_position)
	
	move_and_slide()
