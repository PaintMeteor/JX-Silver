extends RigidBody2D
class_name Silver


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	apply_central_impulse(Vector2(rand_range(-30,30), rand_range(-100,-50)))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if global_position.y >= 640:
		queue_free()
	pass
