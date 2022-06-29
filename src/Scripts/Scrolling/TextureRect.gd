extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var factor: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.material.set_shader_param("scroll_speed", factor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
