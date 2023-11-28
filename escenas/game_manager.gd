extends Node

const gravity: float = 1900.0
const power: float = -400.0
var _dead: bool = false

signal on_game_over
signal on_score_updated

const grupo_delorian: String = "del"

var menu_scene : PackedScene = preload("res://escenas/menu.tscn")
var game_scene : PackedScene = preload("res://escenas/final_alternativo_dlrn.tscn")
var story_line : PackedScene = preload("res://escenas/storyLine_3y4.tscn")
var score:int = 0
var high_score:int =0

func get_score()->int:
	return score

func get_highscore()->int:
	return high_score

func set_score(v:int)->void:
	score = v
	if score > high_score:
		high_score = score
	on_score_updated.emit()
	if score>=50:
		if _dead == true:
			return
		#$crasch.play() 
		VariablesGlobales.crash=true
		_dead = true
		GameManager.on_game_over.emit()
		set_physics_process(false)
	print("sc:%s hs:%s" % [score, high_score])


func increment_score()->void:
	set_score(score +1)

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_menu_scene() -> void:
	VariablesGlobales.videoStory34=2
	VariablesGlobales.flyer=false
	set_score(0)
	get_tree().change_scene_to_packed(story_line)
