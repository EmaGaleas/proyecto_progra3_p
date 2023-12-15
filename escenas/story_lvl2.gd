extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var estado=VariablesGlobales.videoLVL2
	if estado==0:
		get_node("sms").text ="Escapaste de seguridad pero no de los rumores. Un grupo se entero\nque tienes información importante y la quieren a toda costa.\nDEFIENDETE O MUERES."
		get_node("btn").text="A SOBREVIVIR"
		$video1.play()
	elif estado==1:
		get_node("sms").text ="¡TE ATRAPARON!\nLos drones te han alcanzado.\nIntentalo de nuevo."
		get_node("btn").text="VOLVER AL MENU"
		$video2.play()
	elif estado==2:
		get_node("sms").text ="UPS...¡HAS MUERTO!\nNo has pensado bien tus movimientos.\nVuelve a intentarlo."
		get_node("btn").text="VOLVER AL MENU"
		$video3.play()


func _on_video_1_finished():
	if VariablesGlobales.videoLVL2==0:
		$video1.play()


func _on_video_2_finished():
	if VariablesGlobales.videoLVL2==1:
		$video2.play()


func _on_video_3_finished():
	if VariablesGlobales.videoLVL2==2:
		$video3.play()


func _on_btn_pressed():
	var estado=VariablesGlobales.videoLVL2
	if estado==0 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/final_alternativo_dlrn.tscn")
	elif estado==1 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	elif estado==2 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	else:
		VariablesGlobales.finalVista()
		get_tree().change_scene_to_file("res://escenas/finalOpciones.tscn")

