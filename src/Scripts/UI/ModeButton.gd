extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var desc : String
export var mode : String

signal updateLabel(text, score)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("mouse_entered", self, "_button_pressed")
	self.connect("pressed", self, "_start_button")
	pass # Replace with function body.

func _button_pressed():
	emit_signal("updateLabel", self.desc, self.mode)

func _start_button():
	GameModes.mode = mode
	get_tree().change_scene("res://Layouts/MainGame.tscn")
