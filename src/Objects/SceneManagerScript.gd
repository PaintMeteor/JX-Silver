extends Node2D
class_name ScManager

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var animator = $AnimationPlayer

export var scenePath : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func switch_layout():
	get_tree().change_scene(scenePath)
	
func fade_to_scene(sc) -> void:
	scenePath = sc
	animator.stop(true)
	animator.play("FadeOut")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
