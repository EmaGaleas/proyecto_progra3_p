extends Node2D


@onready var add = $fondolvl
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_fondolvl_finished():
	add.play()
