extends Node2D

var animationStep = null
var animationColumn = null
var animationSpeed = null
var animationTime = null
var sprite = null
var scene_plasma = null
var movement = Vector2()
var speed = 9
var plasma = null
var property = null
var direction = null

func amISpell():
	return "shock"

func generatePlasma():
	plasma = scene_plasma.instance()
	plasma.inicialize(get_node("shockKinem").get_global_pos(),direction)
	plasma.property = property
	get_parent().add_child(plasma)

func inicialize(pos, state):
	sprite = get_node("shockKinem/shockAnim")
	set_global_pos(pos)
	direction = state
	if (state == 1):
		animationColumn = 7
		get_node("shockKinem/shockArea").set_rotd(34)
		movement = Vector2(-2,1)*speed
	elif (state == 2):
		get_node("shockKinem/shockArea").set_rotd(-34)
		animationColumn = 5
		movement = Vector2(2,1)*speed
	elif (state == 3):
		get_node("shockKinem/shockArea").set_rotd(34)
		animationColumn = 3
		movement = Vector2(2,-1)*speed
	else:
		get_node("shockKinem/shockArea").set_rotd(-34)
		animationColumn = 1
		movement = Vector2(-2,-1)*speed
	sprite.set_frame(animationColumn*4)
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("shockKinem").move(movement)
	animationTime -= 1
	if (animationTime == 0):
		animationStep += 1
		animationTime = animationSpeed
	if (animationStep == 4):
		animationStep = 0
	elif (not plasma):
		sprite.set_frame(animationStep+animationColumn*4)

func _ready():
	scene_plasma = preload("res://scenes/plasma.tscn")
	speed = 9
	animationStep = 0
	animationSpeed = 2
	animationTime = animationSpeed