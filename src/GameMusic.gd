extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var repeat : bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GameMusic_finished():
	if repeat:
		play()
	pass # Replace with function body.
