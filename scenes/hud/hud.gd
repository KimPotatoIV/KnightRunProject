extends CanvasLayer

##################################################
@onready var start_label_node: Label = $StartLabel
@onready var score_label_node: Label = $MarginContainerS/ScoreLabel
@onready var high_score_label_node: Label = $MarginContainerH/HighScoreLabel

##################################################
func _process(delta: float) -> void:
	start_label_node.visible = GameManager.get_is_game_over()
	score_label_node.text = \
	"Score: " +  str(GameManager.get_game_score()).pad_zeros(4)
	high_score_label_node.text = \
	"High Score: " +  str(GameManager.get_high_score()).pad_zeros(4)
