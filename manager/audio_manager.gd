extends Node

##################################################
const COIN_AUDIO: AudioStream = preload("res://audio/coin.wav")
const JUMP_AUDIO: AudioStream = preload("res://audio/jump.wav")
const EXPLOSION_AUDIO: AudioStream = preload("res://audio/explosion.wav")
const BGM: AudioStream = preload("res://audio/time_for_adventure.mp3")

var sfx_player: AudioStreamPlayer
var bgm_player: AudioStreamPlayer

##################################################
func _ready() -> void:
	sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	
	bgm_player = AudioStreamPlayer.new()
	bgm_player.stream = BGM
	add_child(bgm_player)
	bgm_player.play()

##################################################
func coin_audio_play() -> void:
	sfx_player.stream = COIN_AUDIO
	sfx_player.play()

##################################################
func jump_audio_play() -> void:
	sfx_player.stream = JUMP_AUDIO
	sfx_player.play()

##################################################
func explosion_audio_play() -> void:
	sfx_player.stream = EXPLOSION_AUDIO
	sfx_player.play()
