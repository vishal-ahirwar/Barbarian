extends Node3D
@export var projectile:PackedScene
@onready var fire_timer: Timer = $FireTimer
@onready var barrel: MeshInstance3D = $Base/Visor/Barrel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var turret_range:=10.0	
var enemy_path:Path3D
var nearby_target:PathFollow3D

func _ready() -> void:
	fire_timer.timeout.connect(spawnProjectile)
	
	
func _physics_process(_delta: float) -> void:
	nearby_target=findBestTarget()
	if nearby_target:
		look_at(nearby_target.global_position,Vector3.UP,true)
	
func spawnProjectile():
	if nearby_target:
		animation_player.play("fire")
		var shot=projectile.instantiate()
		add_child(shot)
		shot.global_position=barrel.global_position
		shot.direction=global_transform.basis.z
	
func findBestTarget()->PathFollow3D:
	var best_target=null
	var best_progress=0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			if enemy.progress>best_progress:
				var distance:=global_position.distance_to(enemy.global_position)
				if distance<turret_range:
					best_progress=enemy.progress
					best_target=enemy
	return best_target
