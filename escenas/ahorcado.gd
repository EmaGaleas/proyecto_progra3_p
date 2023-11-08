extends Node2D

var palabras:= ["SOPA", "FUTBOL", "CAMALEON", "DESIERTO", "HOLA", "ADIOS", "CUELLO", "BUENRETO"]
var hint:= ["SE COME Y ES\nLIQUIDO", "UN DEPORTE\nFAMOSO", "UN ANIMAL \n'INVISIBLE'", "TIENES SED\nPERO NO HAY AGUA", "FORMA DE\nSALUDO", "FORMA DE\nDESPEDIDA", "PARTE DEL \nCUERPO SUPERIOR", "PROYECTO \nDEL ING \nERICK"]
var ultimaPalabra:= ""
var palabraAdivinada:= ""
var intentos: int = 3
var palabraRandom = palabras[randi() % palabras.size()]
# Called when the node enters the scene tree for the first time.
func _ready():
	timerReset()
	_palabraRandom()
	_pista()
	#_botonPresionado()
	get_node("label_numIntentos").text = str(intentos)
	pass # Replace with function body.

func _palabraRandom():
	while palabraRandom == ultimaPalabra:
		palabraRandom = palabras[randi() % palabras.size()]
	ultimaPalabra = palabraRandom
	
func _pista():
	if(palabraRandom == palabras[0]):
		get_node("label_pista").text = "PISTA: "+hint[0]
	elif(palabraRandom == palabras[1]):
		get_node("label_pista").text = "PISTA: "+hint[1]
	elif(palabraRandom == palabras[2]):
		get_node("label_pista").text = "PISTA: "+hint[2]
	elif (palabraRandom == palabras[3]):
		get_node("label_pista").text = "PISTA: "+hint[3]
	elif(palabraRandom == palabras[4]):
		get_node("label_pista").text = "PISTA: "+hint[4]
	elif(palabraRandom == palabras[5]):
		get_node("label_pista").text = "PISTA: "+hint[5]
	elif(palabraRandom == palabras[6]):
		get_node("label_pista").text = "PISTA: "+hint[6]
	elif(palabraRandom == palabras[7]):
		get_node("label_pista").text = "PISTA: "+hint[7]
#funciona mejor on aceptar pressed
func _botonPresionado():
	if get_node("Aceptar").pressed || Input.is_action_just_pressed("ingrear_ahorcado"):
			palabraAdivinada = get_node("label_adivinar").text
			print(palabraAdivinada)
			print(palabraRandom)
			if palabraAdivinada == palabraRandom:
				get_node("label_palabra").text ="CORRECT PASSWORD. \nEN UNOS SEGUNDOS TENDRAS LA INFORMACION QUE NECESITAS"
				
				get_tree().change_scene_to_file("res://escenas/ahorcadoGana.tscn")
			elif intentos < 0:
				get_tree().change_scene_to_file("res://escenas/ahorcadoPierde.tscn")
			elif palabraAdivinada != palabraRandom and intentos >= 1:
				get_node("label_palabra").text ="INCORRECT PASSWORD."
				get_node("label_numIntentos").text = str(intentos)
			intentos= intentos - 1
	


func _on_audio_stream_player_finished():
	get_tree().change_scene_to_file("res://escenas/ahorcadoPierde.tscn")

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
		get_tree().change_scene_to_file("res://escenas/ahorcadoPierde.tscn")
		
	pass # Replace with function body.
	
func timerReset():
	sec=Dsec
	min=Dmin


#aqui es donde sirve al darle click
func _on_aceptar_pressed():
	if get_node("Aceptar").pressed || Input.is_action_just_pressed("ingrear_ahorcado"):
			palabraAdivinada = get_node("label_adivinar").text.to_upper()
			#print(palabraAdivinada)
			#print(palabraRandom)
			if palabraAdivinada == palabraRandom:
				#este mensaje se mostrara en historia despues
				get_node("label_palabra").text ="CORRECT PASSWORD. \nEN UNOS SEGUNDOS TENDRAS LA INFORMACION QUE NECESITAS"
				get_tree().change_scene_to_file("res://escenas/ahorcadoGana.tscn")
			elif intentos <= 1:
				get_tree().change_scene_to_file("res://escenas/ahorcadoPierde.tscn")
			elif palabraAdivinada != palabraRandom and intentos >= 1:
				intentos=intentos - 1
				get_node("label_palabra").text ="INCORRECT PASSWORD."
				get_node("label_numIntentos").text = str(intentos)
			


func _on_fondo_2_0_finished():
	$fondo2_0.play() # Replace with function body.
