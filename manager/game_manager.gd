extends Node

##################################################
var is_game_over: bool = true
var game_score: int = 0
var high_score: int = 0

##################################################
func _ready() -> void:
	load_high_score()

##################################################
func get_is_game_over() -> bool:
	return is_game_over

##################################################
func set_is_game_over(game_over_value: bool) -> void:
	is_game_over = game_over_value

##################################################
func get_game_score() -> int:
	return game_score

##################################################
func set_game_score(game_score_value: int) -> void:
	game_score = game_score_value
	
	if high_score < game_score:
		high_score = game_score
		save_high_score()

##################################################
func save_high_score() -> void:
	var config = ConfigFile.new()
	config.set_value("Game", "HighScore", high_score)
	config.save("user://high_score.cfg")

##################################################
func load_high_score() -> void:
	var config = ConfigFile.new()
	config.load("user://high_score.cfg")
	high_score = config.get_value("Game", "HighScore", 0)

##################################################
func get_high_score() -> int:
	return high_score
