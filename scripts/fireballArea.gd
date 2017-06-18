extends Area2D

var damage = null

func solveBodyCollision(body):
	if (body.has_method("amIWizard")):
		if (body.amIWizard() != get_parent().get_parent().property):
			body.damage(damage,"fire")
			body.burn()
			get_parent().get_parent().queue_free()
	else:
		get_parent().get_parent().queue_free()

func _ready():
	damage = 10
	connect('body_enter',self,'solveBodyCollision')