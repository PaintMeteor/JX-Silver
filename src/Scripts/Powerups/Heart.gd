extends Area2D
class_name HealthPowerup

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var period := 0.0

export var wave_speed := 0.0
export var amplitude := 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self.global_position.x += cos(period) * wave_speed * delta
	period += delta
	self.global_position.y += 30 * delta
	
	if self.global_position.y >= 640:
		queue_free()
