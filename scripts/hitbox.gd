extends KinematicBody2D

var team = null

func amIWizard():
	return team

func _ready():
	team = get_parent().team