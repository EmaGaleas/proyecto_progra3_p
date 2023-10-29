extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	timerReset()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_audio_stream_player_finished():
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


var sec=0
var min=0
var Dsec=1
var Dmin=2
func _on_timer_timeout():
	if sec==0:
		if min>0:
			min-=1
			sec=60
	sec-=1
	if (sec==1 && min==2) || (min==0 && sec==00): 
		$timer_mostrar.text="00:00"
	elif sec>=0 && sec<=9:
		$timer_mostrar.text="0"+str(min)+":0"+str(sec)
	else:
		$timer_mostrar.text="0"+str(min)+":"+str(sec)
	if sec==-1 && min==0:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
		
	pass # Replace with function body.
	
func timerReset():
	sec=Dsec
	min=Dmin
