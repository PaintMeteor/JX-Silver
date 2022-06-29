extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var score := 0
var current_mode := "arcade"

func addScore(points : int):
	if current_mode == "arcade":
		score += points

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
