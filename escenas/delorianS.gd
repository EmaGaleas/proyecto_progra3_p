extends Area2D


func _on_del_animation_finished():
	VariablesGlobales.videoLVL2=0
	get_tree().change_scene_to_file("res://escenas/story_lvl2.tscn")


func _on_body_entered(body):
	$del.play("default")
	$sdd.play()
