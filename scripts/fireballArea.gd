extends Area2D

func solveBodyCollision(body):
	if (body.has_method("amIWizard")):
		if (body.amIWizard() != get_parent().get_parent().property):
			body.damage(10,"fire")
			body.burn()
			get_parent().get_parent().queue_free()
	elif (body.has_method("amIWall")):
		get_parent().get_parent().queue_free()

func _ready():
	connect('body_enter',self,'solveBodyCollision')