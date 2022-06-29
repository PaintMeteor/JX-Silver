class_name PlayerOb
extends Area2D

#Changeable attributes
export var speed: float = 10
export var fire_rate = 12



signal fireBullet(position, angle)
signal deathSound()

onready var col = $CollisionShape2D
onready var mgun = $MachineGun
onready var sprite = $Sprite
onready var gameManager = get_node("/root/GameModes")

var projectile = preload("res://Objects/Player/PlayerBullet.tscn")
var particle1 = preload("res://Objects/Player/PlayerDeath.tscn")

onready var barrels = mgun.get_children()

var currentside = 0
var period = 0
var horizontal_movement = null
var vertical_movement = null

# Called when the node enters the scene tree for the first time.
func _ready():
	GameMusic.play()
	pass

func updateCurrentPosition():
	gameManager.player_pos = self.global_position


func die() -> void:
		emit_signal("deathSound")
		
		var instance = particle1.instance()
		instance.global_position = global_position
		get_tree().get_root().add_child(instance)
		queue_free()
	
func _input(event):
	if event is InputEventScreenDrag:
		self.global_position += event.relative

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.global_position = Vector2(clamp(self.global_position.x,20,380), clamp(self.global_position.y, 0, 600))
	updateCurrentPosition()
	
func _process(delta):
	period += fire_rate * delta
	
	
	if period >= 1:
		currentside = (currentside + 1) % 2
		emit_signal("fireBullet", barrels[currentside].global_position, global_rotation_degrees)
		period = 0
	

func shoot(location, angle, speed = 100):
	var instance = projectile.instance()
	instance.bullet_speed = speed
	instance.bullet_angle = angle
	instance.global_position = location
	get_tree().get_root().add_child(instance)




func _on_Player_body_entered(body):
	if body is Silver:
		$PowerupOne.play()
		if GameModes.mode != "treasure":
			GameModes.addscore(100)
		else:
			GameModes.addscore(1)
		body.queue_free()
	if body is TimePowerup:
		$PowerupOne.play()
		GameModes.addscore(100)
		GameModes.time_left += 1
		body.queue_free()


func _on_Area2D_area_entered(area):
	if area is EnemyBullet:
		die()
		area.queue_free()
	if area is Enemy:
		die()
		area.destroy()
	if area is HealthPowerup:
		$PowerupTwo.play()
		area.queue_free()
	pass # Replace with function body.
