extends Node2D

func _fixed_process(delta):
	pass

func _ready():
	get_node("walls/wizardRed").change_team()
	set_fixed_process(true)