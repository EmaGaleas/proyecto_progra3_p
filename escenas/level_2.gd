extends Node2D

var label=null
func _process(delta):
	if label:
		label.position.x = position.x
		get_node("label").text = "intas"
