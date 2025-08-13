extends Node2D

##################################################
@onready var parallax_b_node: Parallax2D = $Parallax2DB
@onready var parallax_f_node: Parallax2D = $Parallax2DF
@onready var score_area_node: Area2D = $ScoreArea2D

##################################################
func _ready() -> void:
	score_area_node.area_entered.connect(_on_score_area_entered)

##################################################
func _process(delta: float) -> void:
	if GameManager.get_is_game_over():
		parallax_b_node.autoscroll = Vector2.ZERO
		parallax_f_node.autoscroll = Vector2.ZERO
	else:
		parallax_b_node.autoscroll = Vector2(-25.0, 0.0)
		parallax_f_node.autoscroll = Vector2(-100.0, 0.0)

##################################################
func _on_score_area_entered(area: Area2D) -> void:
	if area.is_in_group("Slime"):
		GameManager.set_game_score(GameManager.get_game_score() + 10)
