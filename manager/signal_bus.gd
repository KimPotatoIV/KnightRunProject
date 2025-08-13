extends Node

##################################################
signal slime_entered

##################################################
func emit_slime_entered_signal() -> void:
	emit_signal("slime_entered")
