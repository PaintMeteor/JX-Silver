extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var play_new_score_sound : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if GameModes.score > GameModes.bestScores.get(GameModes.mode):
		play_new_score_sound = true
		GameModes.set_high_score(GameModes.mode)
		$"New Record".visible = true
		GameModes.saveScores()
	else:
		$"New Record".visible = false
	$Control/Label.text = GameModes.score as String
	pass # Replace with function body.
	
	yield(get_tree().create_timer(0.2),"timeout")
	GameMusic.playIndex(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play_sound():
	if play_new_score_sound:
		$AudioStreamPlayer.play()
