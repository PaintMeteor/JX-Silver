extends Node2D
class_name game

var projectile = preload("res://Objects/Player/PlayerBullet.tscn")

onready var UI = $CanvasLayer
var global_manager = preload("res://Scripts/GameModes.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameModes.score = 0
	GameMusic.playIndex(1)
	pass # Replace with function body.

func shoot(location, angle, speed = 100):
	var instance = projectile.instance()
	instance.bullet_speed = speed
	instance.bullet_angle = angle
	instance.global_position = location
	add_child(instance)

func _process(delta):
	if GameModes.mode == "challenge":
		GameModes.time_left = clamp(GameModes.time_left - delta, 0, 60)
		if GameModes.time_left <= 0:
			goToResultsScreen()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_fireBullet(position, angle):
	shoot(position, angle, 900)

func _on_Spawners_displayMessage(name):
	pass # Replace with function body.

func goToResultsScreen():
	GameMusic.stop()
	get_tree().change_scene("res://Layouts/ResultsScreen.tscn")

func _on_Player_deathSound():
	$PlayerDeath.play()
	GameMusic.stop()
	yield(get_tree().create_timer(1.2), "timeout")
	goToResultsScreen()
