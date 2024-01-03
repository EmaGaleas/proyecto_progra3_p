extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var estado=VariablesGlobales.videoStory34
	if estado==0 :
		get_node("sms").text ="Te has implantado el Bestandteil.\nA relajarse en el arcade pero primero debes pensar como llegar...\nManeja el Delorian por la ciudad y ten cuidado de chocar, recuerda \nque vuela arriba y abajo."
		get_node("btn").text="FAHREN TIME"
		$ganaShoot.play()
		$Final.visible=false
	elif estado==1 :
		get_node("sms").text ="¡HAS MUERTO!\nTe robaron el Bestandteil.\nIntentalo de nuevo."
		get_node("btn").text="VOLVER AL MENU"
		$pierdeShoot.play()
		$Final.visible=false
	elif estado==2:
		get_node("sms").text ="GAME OVER...¿o no? Has llegado al ARCADE apesar de todo\nJugaras PONG contra la computadora.\nEl gandor es quien llegue a los 5 puntos primero."
		get_node("btn").text="JUGAR"
		$flappyStory.play()
		$Final.visible=false
	elif estado==3:
		get_node("sms").text ="Ha llegado al final, hora de descansar.\nPudes jugar el que desees de nuevo o volver al menu."
		get_node("btn").text="CONTINUAR"
		$Final.visible=true


func _on_gana_shoot_finished():
	if VariablesGlobales.videoStory34==0:
		$ganaShoot.play()

func _on_pierde_shoot_finished():
	if VariablesGlobales.videoStory34==1:
		$pierdeShoot.play()

func _on_flappy_story_finished():
	if VariablesGlobales.videoStory34==2:
		$flappyStory.play()




func _on_btn_pressed():
	if VariablesGlobales.videoStory34==0 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/final_alternativo_dlrn.tscn")
	elif VariablesGlobales.videoStory34==1 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/menu.tscn")
	elif VariablesGlobales.videoStory34==2 and VariablesGlobales.enFinal==false:
		get_tree().change_scene_to_file("res://escenas/final2.tscn")
	elif VariablesGlobales.videoStory34==3:
		get_tree().change_scene_to_file("res://escenas/finalOpciones.tscn")
	else:
		VariablesGlobales.finalVista()
		get_tree().change_scene_to_file("res://escenas/finalOpciones.tscn")
		


