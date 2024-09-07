extends PathFollow3D

@export
var speed:float=0.5
@export
var damage:float=25

@onready
var base=get_tree().get_first_node_in_group("base")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+=delta*speed
	if progress_ratio>=1.0:
		base.takeDamage(damage)
		queue_free()
