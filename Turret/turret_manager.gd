extends Node3D

@export var turret:PackedScene
@export var enemy_path:Path3D

func spawnTurret(spawn_position:Vector3)->void:
	var new_turret:Node3D=turret.instantiate()
	new_turret.position=spawn_position
	add_child(new_turret)
	new_turret.enemy_path=enemy_path
