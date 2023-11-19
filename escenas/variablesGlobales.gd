extends Node

var salud=100
var videoLVL2=1
var videoAhorcado=0
var toquePong=false
var estadoPong=false
var fondoFinal=false
var videoStory34=0

var enFinal=false

func menosVida():
	salud-=25
	
func tocado():
	toquePong=true
	
func destocado():
	toquePong=false

func finalVista():
	fondoFinal=true
	
func menuVista():
	fondoFinal=false

func final():
	enFinal=true
	
func quedado():
	enFinal=false
