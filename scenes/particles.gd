extends Node2D

var ramp = null

func startAnim(element):
	if (element == "ice"):
		ramp = preload("res://resources/particlesIce.tres")
		get_node("particleRight").set_color_ramp(ramp)
		get_node("particleLeft").set_color_ramp(ramp)
	elif (element == "shock"):
		ramp = preload("res://resources/particlesShock.tres")
		get_node("particleRight").set_color_ramp(ramp)
		get_node("particleLeft").set_color_ramp(ramp)
	get_node("particleRight").set_emitting(true)
	get_node("particleLeft").set_emitting(true)

func setDirection(state):
	if (state == 3):
		get_node("particleRight").set_param(5,135)
		get_node("particleLeft").set_param(5,135)
		get_node("particleRight").set_param(0,45)
		get_node("particleLeft").set_param(0,225)
	elif (state == 4):
		get_node("particleRight").set_param(5,45)
		get_node("particleLeft").set_param(5,45)
		get_node("particleRight").set_param(0,315)
		get_node("particleLeft").set_param(0,135)
	elif (state == 1):
		get_node("particleRight").set_param(5,315)
		get_node("particleLeft").set_param(5,315)
		get_node("particleRight").set_param(0,225)
		get_node("particleLeft").set_param(0,45)
	else:
		get_node("particleRight").set_param(5,225)
		get_node("particleLeft").set_param(5,225)
		get_node("particleRight").set_param(0,135)
		get_node("particleLeft").set_param(0,315)

func _fixed_process(delta):
	if (get_node("particleRight").is_emitting() or get_node("particleLeft").is_emitting()):
		queue_free()

func _ready():
	set_fixed_process(true)