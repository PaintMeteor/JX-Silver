extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var path : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "onPressed")
	pass # Replace with function body.

func onPressed():
	goToScene(path)
	pass
	
func goToScene(p : PackedScene):
	get_tree().change_scene_to(p)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
