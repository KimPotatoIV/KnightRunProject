extends Node2D

##################################################
const SLIME_PURPLE_SCENE: PackedScene = \
preload("res://scenes/slime/purple/slime_purple.tscn")
const SLIME_GREEN_SCENE: PackedScene = \
preload("res://scenes/slime/green/slime_green.tscn")
const COIN_SCENE: PackedScene = preload("res://scenes/coin/coin.tscn")

const PURPLE_SLIME_SPAWN_POSITION: Vector2 = Vector2(656.0, 132.0)
const GREEN_SLIME_SPAWN_POSITION: Vector2 = Vector2(656.0, 119.0)
const COIN_SPAWN_POSITION: Vector2 = Vector2(656.0, 137.0)
const SPAWN_DELAY_1: Vector2 = Vector2(1.0, 2.0)
const SPAWN_DELAY_2: Vector2 = Vector2(0.75, 1.5)

@onready var spawn_timer_node: Timer = $SpawnTimer

##################################################
func _ready() -> void:
	spawn_timer_node.wait_time = 1.0
	spawn_timer_node.one_shot = false
	spawn_timer_node.start()
	spawn_timer_node.timeout.connect(_on_spawn_timer_timeout)

##################################################
func _on_spawn_timer_timeout() -> void:
	if not GameManager.get_is_game_over():
		var spawn: int = randi() % 3
		
		match spawn:
			0:
				var slime_instance: Area2D = SLIME_PURPLE_SCENE.instantiate()
				slime_instance.global_position = PURPLE_SLIME_SPAWN_POSITION
				add_child(slime_instance)
			1:
				var slime_instance: Area2D = SLIME_GREEN_SCENE.instantiate()
				slime_instance.global_position = GREEN_SLIME_SPAWN_POSITION
				add_child(slime_instance)
			2:
				var coin_instance: Area2D = COIN_SCENE.instantiate()
				coin_instance.global_position = COIN_SPAWN_POSITION
				add_child(coin_instance)
		
		if GameManager.get_game_score() <= 300:
			spawn_timer_node.wait_time = randf_range(SPAWN_DELAY_1.x, SPAWN_DELAY_1.y)
		else:
			spawn_timer_node.wait_time = randf_range(SPAWN_DELAY_2.x, SPAWN_DELAY_2.y)
