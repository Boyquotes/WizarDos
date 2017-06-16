extends Area2D

func solveBodyCollision(body):
	if (body.has_method("amIWizard")):
		if (body.amIWizard() != get_parent().get_parent().property):
			body.damage(15)
			body.freeze()
			get_parent().get_parent().queue_free()
	if (body.has_method("amIWwall")):
		get_parent().get_parent().queue_free()

func _ready():
	connect('body_enter',self,'solveBodyCollision')