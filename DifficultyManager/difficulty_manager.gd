extends Node
@export var game_time:=30.0
@export var difficulty_curve:Curve
@export var enemy_health:Curve
@onready var timer: Timer = $Timer
signal game_over
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_time)
	timer.timeout.connect(gameOver)
	
func getRemainingGameTime():
	return 1-(timer.time_left/game_time)

func getDifficultyValue():
	return difficulty_curve.sample(getRemainingGameTime())
	
func getEnemyHealth():
	return enemy_health.sample(getRemainingGameTime())

func getRemaningGameTimeInSeconds():
	return timer.time_left

func gameOver():
	game_over.emit()
