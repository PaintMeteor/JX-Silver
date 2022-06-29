extends Area2D
class_name player_bullet

#Node attributes
onready var Explosion = $ParticleExplosion
onready var anim = $AnimationPlayer
onready var audio_sound = $AudioPlayer

var active: bool = false
export var bullet_speed = 0
export var bullet_angle = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("Regular")
	active = true
	audio_sound.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	global_position += Vector2(cos(deg2rad(bullet_angle)) * bullet_speed * delta, sin(deg2rad(bullet_angle)) * bullet_speed * delta)
	global_rotation = deg2rad(bullet_angle)
	
	#destroy the bullet outside of the layout
	if global_position.y < 0:
		queue_free()
	
	#destroy the bullet once it has finished the destroy animaiton.


func destroy():
	#spawn an explosion effect.
	anim.play("Destroy")
	active = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Destroy":
		queue_free()


func _on_PlayerBullet_area_entered(area):
	if area.is_in_group("enemies") && area.active:
		area.damage(20)
		destroy()
	pass # Replace with function body.
