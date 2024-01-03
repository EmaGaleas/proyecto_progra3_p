extends Area2D




func _on_body_entered(body):
	body.hide()
	$del.play("default")
	$sdd.play()


func _on_del_animation_finished():
	if VariablesGlobales.enFinal==false:
		VariablesGlobales.videoLVL2=0
		get_tree().change_scene_to_file("res://escenas/storyLine_3y4.tscn")
	else:
		VariablesGlobales.finalVista()
		get_tree().change_scene_to_file("res://escenas/storyLine_3y4.tscn")
