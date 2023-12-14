extends Node

var score: int = 0

func increment_score(v:int) -> void:
	score += v
	SignalManager.on_score_updated.emit(score)

func reset_score():
	score = 0
	SignalManager.on_score_updated.emit(score)
	

func get_score()->int:
	return score
