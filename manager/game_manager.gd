extends Node

##################################################
var is_game_over: bool = true
var game_score: int = 0

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
