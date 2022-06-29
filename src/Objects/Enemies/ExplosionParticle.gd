extends Node2D
class_name SpriteParticle2D

onready var death = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("main")
	death.play()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "main":
		queue_free()
	
