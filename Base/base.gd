extends Node3D
@onready var health_bar: ProgressBar = $HealthBar
@export
var MAX_HEALTH:float=100

var health:float=100:
	set(value):
		health=value
		health_bar.value=health
		if health<=0:
			get_tree().reload_current_scene()
			
func _ready() -> void:
	health=MAX_HEALTH

func takeDamage(value:float)->void:
	health-=value
