extends MarginContainer
@onready var label: Label = $Label
@export var difficulty_manager:Node
@export var STARTING_BALANCE:=100
@onready var game_time: Label = $Label3

var current_balance:int:
	set(current_balance_in):
		current_balance=max(current_balance_in,0)
		label.text="Current Balance : "+str(current_balance)
		
func _process(_delta: float) -> void:
	game_time.text="Remaining Time : "+str(int(difficulty_manager.getRemaningGameTimeInSeconds()))
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_balance=STARTING_BALANCE
