extends CanvasLayer
@export var enemy_path:Path3D
@export var bank:MarginContainer
@export var base:Node
@export var effect_manager:Node
@export var label: Label
@export var h_box_container: HBoxContainer
@export var difficulty_manager:Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	effect_manager.playFadeOut()
	visible=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func onGameOver() -> void:
	enemy_path.spawn_timer.stop()
	effect_manager.playFadeIn()
	visible=true
	if difficulty_manager.is_victory:
		onWin()
	else:
		onLoose()

func onWin()->void:
	label.text="Victory"
	h_box_container.modulate=Color.WHITE
	
func onLoose()->void:
	label.text="You Loose :("
	h_box_container.modulate=Color.BLACK
	
func onBtnNextPressed() -> void:
	get_tree().reload_current_scene()

func onBtnQuitPressed() -> void:
	get_tree().quit()
