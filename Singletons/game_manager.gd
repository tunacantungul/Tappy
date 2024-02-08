extends Node

const GROUP_PLAYER : String = "player"
const SCROLL_SPEED : float = 120.0

var game_scene : PackedScene = preload("res://scenes/game/game.tscn")
var main_scene : PackedScene = preload("res://scenes/main/main.tscn")

var score : int = 0
var high_score : int = 0

func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)
	
func load_main_scene():
	get_tree().change_scene_to_packed(main_scene)
	

func get_score():
	return score

func get_high_score():
	return high_score
	
func set_score(v: int):
	score = v
	#print("score is: ", score)
	if score > high_score:
		high_score = score
		#print("high score is: ", high_score)
	SignalManager.on_score_updated.emit()
		
func increment_score():
	set_score(score + 1)
