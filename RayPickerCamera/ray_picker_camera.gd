extends Camera3D
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@export var raycast_range:float=100
@export var grid_map:GridMap
@export var turret:PackedScene
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
				var collision_point=ray_cast_3d.get_collision_point()
				var cell=grid_map.local_to_map(collision_point)
				if grid_map.get_cell_item(cell)==0:
					Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
					if Input.is_action_just_pressed("add_base"):
						grid_map.set_cell_item(cell,1)
						spawnTurret(cell)
						
						
		else:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			

func spawnTurret(spawn_position:Vector3):
	var new_turret:Node3D=turret.instantiate()
	new_turret.position=spawn_position
	grid_map.add_child(new_turret)
