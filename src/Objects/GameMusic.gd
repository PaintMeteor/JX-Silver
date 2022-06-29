extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var last_music := ""

var music := ["res://Audio/Music/JXSilverMenu2.mp3", "res://Audio/Music/JXSilverTheme.mp3", "res://Audio/Music/JXSilverResults.mp3"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func playIndex(i) -> void:
	if music[i] != last_music:
		var mus = load(music[i])
		set_stream(mus)
		play()
		last_music = music[i]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
