extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if GameModes.mode == "challenge":
		$Control/TimedLabel.visible = true
	else:
		$Control/TimedLabel.visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/Label.text = "Score: " + GameModes.score as String
	$Control/TimedLabel.text = int(GameModes.time_left) as String
	
	if GameModes.time_left <= 11:
		$Control/TimedLabel.modulate = Color(1,0,0,1)
	else:
		$Control/TimedLabel.modulate = Color(1,1,1,1)

