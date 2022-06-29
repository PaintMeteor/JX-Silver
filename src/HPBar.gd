extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var HP1 = $TextureRect
onready var HP2 = $TextureRect2

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	HP1.rect_size.x = (GameModes.playerHP/100) * 100
	pass
