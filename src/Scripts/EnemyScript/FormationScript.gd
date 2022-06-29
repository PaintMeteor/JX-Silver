extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal waveComplete()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0:
		emit_signal("waveComplete")
		queue_free()
	pass
