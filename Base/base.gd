extends Node3D
@onready var health_bar: ProgressBar = $MarginContainer/HealthBar
@export
var MAX_HEALTH:float=100
@export var difficulty_manager:Node
var health:float=100:
	set(value):
		health=value
		health_bar.value=health
		if health<=0 and difficulty_manager.is_victory:
			difficulty_manager.is_victory=false
			difficulty_manager.game_over.emit()
			difficulty_manager.timer.stop()
			
			
func _ready() -> void:
	health=MAX_HEALTH

func takeDamage(value:float)->void:
	health-=value
