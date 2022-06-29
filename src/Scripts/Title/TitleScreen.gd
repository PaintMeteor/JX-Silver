extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var music = preload("res://Audio/Music/JXSilverMenu2.mp3")

export var start : bool = false
var once : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/AnimationPlayer.play("Startup")
	GameModes.setupTimed()
	GameMusic.playIndex(0)
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey || event is InputEventMouseButton:
		if start && !once:
			SceneManager.fade_to_scene("res://Layouts/ModeSelect.tscn")
			once = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
