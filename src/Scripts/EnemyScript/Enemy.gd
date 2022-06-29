extends Enemy
class_name FirstEnemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var dive_delay: float = 0
onready var weapon = $MachineGun
onready var tween = $Tween

var diving: bool = true
var weaponPeriod : float = 0
var iterations : int = 0
var shooting : bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	$DiveDelay.start(dive_delay)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	weaponPeriod += 10 * delta
	
	if elite:
		if weaponPeriod > 1:
			if iterations < 3:
				emit_signal("shoot", 200, rad2deg(get_angle_to(GameModes.player_pos)), 100, 1, "purple", $MachineGun/PointOne.global_position)
				weaponPeriod = 0
				iterations += 1
			else:
				shooting = false
		
	pass



func _on_Enemy_area_entered(area):
	if area.is_in_group("PlayerBullets") && active:
		damage(10)


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "destroy":
		queue_free()
	pass # Replace with function body.

func _on_Tween_tween_all_completed():
	if diving:
		diving = false
		weapon.get_node("BehaviorTimer").start()
	pass # Replace with function body.


func _on_DiveDelay_timeout():
	tween.interpolate_property(self, "global_position", global_position, 
		Vector2(global_position.x, global_position.y + 640), 1.2, Tween.TRANS_BACK, Tween.EASE_OUT, 1)
	tween.start()
	pass # Replace with function body.

func _on_BehaviorTimer_timeout():
	iterations = 0
	if elite:
		shooting = true
	else:
		
		emit_signal("shoot", 200, 90, 100, 1, "purple", $MachineGun/PointOne.global_position)
	pass # Replace with function body.

