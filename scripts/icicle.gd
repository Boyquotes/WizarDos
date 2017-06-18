extends Node2D

var animationStep = null
var animationColumn = null
var animationSpeed = null
var animationTime = null
var sprite = null
var movement = Vector2()
var speed = 5
var property = null

func amISpell():
	return "ice"

func inicialize(pos, state):
	sprite = get_node("icicleKinem/icicleAnim")
	set_global_pos(pos)
	if (state == 1):
		get_node("icicleKinem/icicleArea").set_rotd(34)
		animationColumn = 7
		movement = Vector2(-2,1)*speed
	elif (state == 2):
		get_node("icicleKinem/icicleArea").set_rotd(-34)
		animationColumn = 5
		movement = Vector2(2,1)*speed
	elif (state == 3):
		get_node("icicleKinem/icicleArea").set_rotd(34)
		animationColumn = 3
		movement = Vector2(2,-1)*speed
	else:
		get_node("icicleKinem/icicleArea").set_rotd(-34)
		animationColumn = 1
		movement = Vector2(-2,-1)*speed
	sprite.set_frame(animationColumn*8)
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("icicleKinem").move(movement)
	animationTime -= 1
	if (animationTime == 0):
		animationStep += 1
		animationTime = animationSpeed
	if (animationStep == 8):
		animationStep = 0
	else:
		sprite.set_frame(animationStep+animationColumn*8)

func _ready():
	speed = 5
	animationStep = 0
	animationSpeed = 4
	animationTime = animationSpeed