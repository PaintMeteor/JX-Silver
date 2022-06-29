extends Area2D
class_name EnemyBullet

export var damage: float = 20
var speed: float
var curr_Angle: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += Vector2(cos(deg2rad(curr_Angle)) * speed * delta, sin(deg2rad(curr_Angle)) * speed * delta)
	global_rotation = deg2rad(curr_Angle)
	
	if global_position.y <= 0 || global_position.y >= 640:
		queue_free()
	pass

func _on_BulletShape_tree_exiting():
	queue_free()

