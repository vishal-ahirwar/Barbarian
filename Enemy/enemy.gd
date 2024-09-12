extends PathFollow3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export
var speed:float=0.5
@export
var damage:float=25

@export var max_health:=100
var current_health:int:
	set(health_in):
		if health_in<current_health:
			animation_player.play("takeDamage")
		current_health=health_in
		if current_health<=0:
			queue_free()
	
@onready
var base=get_tree().get_first_node_in_group("base")

func _ready() -> void:
	current_health=max_health
	speed+=randf_range(0.0,8.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+=delta*speed
	if progress_ratio>=1.0:
		base.takeDamage(damage)
		queue_free()
