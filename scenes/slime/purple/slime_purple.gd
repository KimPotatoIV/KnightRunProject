extends Area2D

##################################################
const RUN_SPEED: float = -100.0

@onready var animated_sprite_node: AnimatedSprite2D = $AnimatedSprite2D

##################################################
func _ready() -> void:
	area_entered.connect(_on_area_entered)
	add_to_group("Slime")

##################################################
func _process(delta: float) -> void:
	if not GameManager.get_is_game_over():
		global_position.x += RUN_SPEED * delta
		animated_sprite_node.play("run")
	else:
		animated_sprite_node.stop()
	
	if global_position.x <= -16.0:
		queue_free()

##################################################
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Knight"):
		GameManager.set_is_game_over(true)
		AudioManager.explosion_audio_play()
