extends Node3D
@export var projectile:PackedScene
@onready var fire_timer: Timer = $FireTimer
@onready var barrel: MeshInstance3D = $Base/Visor/Barrel
var enemy_path:Path3D


func _ready() -> void:
	fire_timer.timeout.connect(spawnProjectile)
	
	
func _physics_process(_delta: float) -> void:
	var nearby_enemy=enemy_path.get_children().back()
	look_at(nearby_enemy.global_position,Vector3.UP,true)
	
func spawnProjectile():
	var shot=projectile.instantiate()
	add_child(shot)
	shot.global_position=barrel.global_position
	shot.direction=global_transform.basis.z
