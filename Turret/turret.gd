extends Node3D
@export var projectile:PackedScene
@onready var fire_timer: Timer = $FireTimer
@onready var barrel: MeshInstance3D = $Base/Visor/Barrel
var enemy_path:Path3D


func _ready() -> void:
	fire_timer.timeout.connect(spawnProjectile)

	
func spawnProjectile():
	var shot=projectile.instantiate()
	add_child(shot)
	shot.global_position=barrel.global_position
