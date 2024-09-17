extends Node
@export var effect:AnimationPlayer

func playFadeIn()->void:
	effect.play("fade_in")
	
func playFadeOut()->void:
	effect.play("fade_out")
