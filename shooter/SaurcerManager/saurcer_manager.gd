extends Node2D

var saurcer_scene: PackedScene = preload("res://shooter/enemies/saurcer.tscn")

const WAIT_TIME: float = 8.0
const WAIT_VAR: float = 1.0

@onready var timer = $Timer
@onready var paths = $Paths.get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_saurcer()

func spawn_saurcer() -> void:
	var p = paths.pick_random()
	var s = saurcer_scene.instantiate()
	p.add_child(s)
	Utils.set_and_start_timer(timer, WAIT_TIME, WAIT_VAR)


func _on_timer_timeout():
	spawn_saurcer()
