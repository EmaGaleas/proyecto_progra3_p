extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer
@onready var score = $CanvasLayer/Score
@onready var sonido_fondo = $fondo
@onready var carCrash = $CarCrash
# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over)
	GameManager.on_score_updated.connect(on_score_updated)
	spawn_pipes()
	score.text = str(GameManager.score)
	VariablesGlobales.flyer=true
	sonido_fondo.play()


func spawn_pipes() -> void:
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	
	new_pipes.position = Vector2(spawn_l.position.x, y_pos)
	pipes_holder.add_child(new_pipes)

func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawn_pipes()

func on_score_updated()->void:
	score.text = str(GameManager.get_score())

func on_game_over():
	stop_pipes()    
	sonido_fondo.stop() 
	carCrash.play()
	score.text = str(0)
	GameManager.set_score(0)


func _on_plane_died():
	GameManager.load_menu_scene()  

func _on_fondo_finished():
	$fondo.play()
