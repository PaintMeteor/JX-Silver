extends Area2D
class_name Enemy

signal add_Score(points)
signal shoot(speed, angle, damage, size, color, pos)
signal spawnSilver(pos, amount)
signal spawnTime(pos, amount)

export var hp: float
export var points_on_death: int
export var elite : bool = false

onready var gameManager = get_node("/root/GameModes")
onready var anim = $AnimationPlayer

var targetPosition: Vector2 = Vector2()
var active: bool = false
var particledeath = preload("res://Objects/Enemies/Explosion.tscn")

#In this scenario, with respect to the randomize item algorithm, there's a 50% chance
#they get nothing, 10% chance of getting a heart, and a 40% chance of getting silver.
var probTable = ["", "", "", "", "silver", "silver","","","silver","","","silver","","silver", "silver", ""]

var selecteditem : String

func angleToTarget(pos : Vector2) -> float:
	return rad2deg(get_angle_to(pos))

func damage(damage):
	
	hp -= damage
	if hp <= 0:
		if GameModes.mode != "treasure":
			gameManager.addscore(points_on_death)
		destroy()

func randomItem() -> void:
	selecteditem = probTable[int(rand_range(0, probTable.size()))]
	#We use this algorithm to prevent two or more unique items spawning at the same time.

# Called when the node enters the scene tree for the first time.
func _ready():
	active = true
	randomize()
	randomItem()
	pass # Replace with function body.
	
func destroy():
	
	if selecteditem == "silver":
		if GameModes.mode != "challenge":
			emit_signal("spawnSilver", self.global_position, int(rand_range(1,2)))
		else:
			emit_signal("spawnTime", self.global_position, int(rand_range(1,2)))
	var instance = particledeath.instance()
	instance.global_position = global_position
	get_tree().get_root().add_child(instance)
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
