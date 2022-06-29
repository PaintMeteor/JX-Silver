extends Node2D

var index = 0

var formations = preload("res://Objects/Formations/Formations.tscn")

func _ready():
	randomize()

func createWave():
	var wave = formations.instance()
	wave.position.y -= 640
	add_child(wave)
	
#func _process(delta):
	#pass
	


func _on_WaveDelay_timeout():
	createWave()
	pass # Replace with function body.
