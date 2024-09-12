extends Path3D
@export var enemy_scene:PackedScene

func spawnEnemy():
	var enemy=enemy_scene.instantiate()
	add_child(enemy)
	
func onSpawnTimerTimeout() -> void:
	spawnEnemy()
