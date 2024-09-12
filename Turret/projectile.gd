extends Area3D

var direction:=Vector3.FORWARD
@export var speed:=30.0
@export var damage:=10
func _physics_process(delta: float) -> void:
	position+=direction*speed*delta
	
func destroyProjectile() -> void:
	queue_free()


func onAreaEntered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		area.get_parent().current_health-=damage
		queue_free()
