extends Area2D

##################################################
const JUMP_VELOCITY: float = -300.0

@onready var animated_sprite_node: AnimatedSprite2D = $AnimatedSprite2D
@onready var init_y_position: float = global_position.y

var velocity: Vector2 = Vector2.ZERO
var is_on_ground: bool = true

##################################################
func _ready() -> void:
	add_to_group("Knight")

##################################################
func _physics_process(delta: float) -> void:
	if GameManager.get_is_game_over():
		if Input.is_action_just_pressed("ui_accept"):
			_reset_game()
		
		animated_sprite_node.stop()
		return
	
	if not is_on_ground:
		velocity.y += gravity * delta
		animated_sprite_node.play("jump")
	else:
		animated_sprite_node.play("run")
	
	if Input.is_action_just_pressed("ui_accept") and is_on_ground:
		velocity.y = JUMP_VELOCITY
		is_on_ground = false
		AudioManager.jump_audio_play()
	
	position += velocity * delta
	
	if global_position.y >= init_y_position:
		global_position.y = init_y_position
		velocity = Vector2.ZERO
		is_on_ground = true

##################################################
func _reset_game() -> void:
	velocity = Vector2.ZERO
	
	GameManager.set_is_game_over(false)
	GameManager.set_game_score(0)
	
	var slimes = get_tree().get_nodes_in_group("Slime")
	for slime in slimes:
		slime.queue_free()
	
	var coins = get_tree().get_nodes_in_group("Coin")
	for coin in coins:
		coin.queue_free()
