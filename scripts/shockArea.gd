extends Area2D

var damage = null

func solveBodyCollision(body):
	if (body.has_method("amIWizard")):
		if (body.amIWizard() != get_parent().get_parent().property):
			body.damage(damage,"shock")
			body.stun()
			get_parent().get_parent().queue_free()
	else:
		get_parent().get_parent().queue_free()

func solveAreaCollision(area):
	if (area.get_parent().get_parent().has_method("amISpell") and area.get_parent().get_parent().amISpell() == "fire"):
		self.get_parent().get_parent().generatePlasma()
		area.get_parent().get_parent().queue_free()
		get_parent().get_parent().queue_free()

func _ready():
	damage = 25
	connect('body_enter',self,'solveBodyCollision')
	connect("area_enter",self,"solveAreaCollision")