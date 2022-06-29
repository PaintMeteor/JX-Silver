extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for b in $ButtonList.get_children():
		b.connect("updateLabel", self, "renderLabel")
	GameModes.loadScores()
	
	GameMusic.playIndex(0)
	pass # Replace with function body.

func renderLabel(t : String, s : String):
	$ModeDescription.text = t
	$"Best Score".text = "Best score: " + str(GameModes.bestScores.get(s))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
