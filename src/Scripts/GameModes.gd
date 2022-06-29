extends Node
class_name GameManager

var score

var highScorePath = "user://score.save"
var bestScores : Dictionary = {
	"endless": 0,
	"challenge": 0,
	"treasure": 0
}
var mode := "endless"
var time_left := 60.0
var player_pos: Vector2 = Vector2()

func addscore(points : int) -> void:
	score += points

func _ready():
	score = 0
	pass # Replace with function body.

func setupTimed():
	time_left = 60

func on_enemy_add_Score(points):
	addscore(points)

func set_high_score(mode : String):
	match mode:
		"endless":
			bestScores.endless = score
		"challenge":
			bestScores.challenge = score
		"treasure":
			bestScores.treasure = score
		_:
			pass
func saveScores():
	var file = File.new()
	file.open(highScorePath, File.WRITE)
	file.store_var(bestScores)
	file.close()

func loadScores():
	var file = File.new()
	if file.file_exists(highScorePath):
		file.open(highScorePath, File.READ)
		bestScores = file.get_var()
	file.close()

