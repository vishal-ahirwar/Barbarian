extends Path3D
@export var enemy_scene:PackedScene
@export var DifficultyManager:Node
@onready var spawn_timer: Timer = $SpawnTimer


func spawnEnemy():
	var enemy=enemy_scene.instantiate()
	enemy.max_health=DifficultyManager.getEnemyHealth()
	enemy.speed=DifficultyManager.getEnemySpeed()
	add_child(enemy)
	
func onSpawnTimerTimeout() -> void:
	spawnEnemy()
	spawn_timer.wait_time=DifficultyManager.getDifficultyValue()
	


func onGameOver() -> void:
	spawn_timer.stop()
