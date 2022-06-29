extends Node2D


var projectile = preload("res://Objects//Player/PlayerBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func shoot(location, angle, speed):
	var instance = projectile.instance()
	instance.bullet_speed = speed
	instance.bullet_angle = angle
	instance.global_position = location
	add_child(instance)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_fireBullet(position, angle):
	pass # Replace with function body.
	shoot(position, angle, 900)



