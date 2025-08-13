extends CanvasLayer

##################################################
@onready var start_label_node: Label = $StartLabel
@onready var score_label_node: Label = $MarginContainer/ScoreLabel

##################################################
func _process(delta: float) -> void:
	start_label_node.visible = GameManager.get_is_game_over()
	score_label_node.text = "Score: " +  str(GameManager.get_game_score()).pad_zeros(4)
