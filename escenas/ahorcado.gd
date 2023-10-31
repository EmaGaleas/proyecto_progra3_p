extends Node2D

var palabras:= ["SOPA", "FUTBOL", "CAMALEON", "DESIERTO", "HOLA", "ADIOS", "CUELLO", "BUENRETO"]
var hint:= ["SE COME Y ES\nLIQUIDO", "UN DEPORTE\nFAMOSO", "UN ANIMAL \n'INVISIBLE'", "TIENES SED\nPERO NO HAY AGUA", "FORMA DE\nSALUDO", "FORMA DE\nDESPEDIDA", "PARTE DEL \nCUERPO", "PROYECTO \nDEL ING \nERICK"]
var ultimaPalabra:= ""
var palabraAdivinada:= ""
var intentos: int = 6
var palabraRandom = palabras[randi() % palabras.size()]
# Called when the node enters the scene tree for the first time.
func _ready():
	timerReset()
	_palabraRandom()
	_pista()
	_botonPresionado()
	get_node("label_numIntentos").text = str(intentos)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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

func _botonPresionado():
	if get_node("Aceptar").is_action_pressed:
			palabraAdivinada = get_node("label_adivinar").text
			if palabraAdivinada == palabraRandom:
				get_node("label_palabra").text ="CORRECT PASSWORD. \nEN UNOS SEGUNDOS TENDRAS LA INFORMACION QUE NECESITAS"
				get_tree().change_scene_to_file("res://escenas/level_2.tscn")
			elif palabraAdivinada != palabraRandom:
				intentos-1
				get_node("label_numIntentos").text = str(intentos)
			elif intentos == 0:
				get_tree().change_scene_to_file("res://escenas/menu.tscn")
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

