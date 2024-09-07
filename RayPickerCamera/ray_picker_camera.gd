extends Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var raycast_range:float=100
@export var grid_map:GridMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position:Vector2=get_viewport().get_mouse_position()
	ray_cast_3d.target_position=project_local_ray_normal(mouse_position)*raycast_range
	ray_cast_3d.force_raycast_update()
	if ray_cast_3d.is_colliding():
		var collider=ray_cast_3d.get_collider()
		if collider is GridMap:
			pass
			
