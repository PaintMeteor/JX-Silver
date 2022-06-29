extends Node2D
class_name spawners
signal displayMessage(name)

var S_Powerup = preload("res://Objects/Powerups/Silver.tscn")
var T_Powerup = preload("res://Objects/Powerups/Time.tscn")
var scenes = ["res://Objects/Formations/Formation1.tscn", "res://Objects/Formations/Formation2.tscn", "res://Objects/Formations/Formation3.tscn"]
var global_manager = preload("res://Scripts/GameModes.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()



func createWave():
	var scene_type = load(scenes[randi() % scenes.size()])
	var instance = scene_type.instance()
	instance.position.y = -640
	for c in instance.get_children():
		c.connect("shoot", self, "EnShootSignal")
		c.connect("spawnSilver", self, "spawn_silver_powerups")
		c.connect("spawnTime", self, "spawn_time_powerups")
	
	instance.connect("waveComplete", self, "waveDone")
	
	add_child(instance)

func shoot_enemy(
size : int = 1, 
damage : float = 10.0, 
color: String = "green", 
angle : float = 90, 
speed : float = 100,
pos : Vector2 = Vector2(0,0)) -> void:
	var path : String
	match color:
		"green":
			path = "green"
		"purple":
			path = "purple"
		_:
			path = "green"
	var bullet = load("res://Objects/EnemyBullets/" + path + "/bullet" + str(clamp(size, 1, 2)) + ".tscn")
	#The match statement just prevents further errors.
	var instance = bullet.instance()
	instance.global_position = pos
	instance.curr_Angle = angle
	instance.speed = speed
	instance.damage = damage
	
	add_child(instance)

func EnShootSignal(sp, an, dm, sz, cl, ps):
	shoot_enemy(sz, dm, cl, an, sp, ps)
	
func spawn_silver_powerups(ps : Vector2, amount : int) -> void:
	for a in amount:
		var instance = S_Powerup.instance()
		instance.global_position = ps
		add_child(instance)

func spawn_time_powerups(ps : Vector2, amount : int) -> void:
	for a in amount:
		var instance = T_Powerup.instance()
		instance.global_position = ps
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	
func waveDone():
	$WaveDelay.start()

func _on_WaveDelay_timeout():
	createWave()
	pass # Replace with function body.
