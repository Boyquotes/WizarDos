extends Node2D

var animationStep = null
var animationSpeed = null
var animationTime = null
var sprite = null
var movement = Vector2()
var speed = 9
var property = null

func amISpell():
	return "plasma"

func inicialize(pos, state):
	sprite = get_node("plasmaKinem/plasmaAnim")
	set_pos(pos)
	if (state == 1):
		get_node("plasmaKinem").set_rotd(0)
		movement = Vector2(-2,1)*speed
	elif (state == 2):
		get_node("plasmaKinem").set_rotd(112)
		movement = Vector2(2,1)*speed
	elif (state == 3):
		get_node("plasmaKinem").set_rotd(180)
		movement = Vector2(2,-1)*speed
	else:
		get_node("plasmaKinem").set_rotd(-68)
		movement = Vector2(-2,-1)*speed
	sprite.set_frame(0)
	print(state)

func _fixed_process(delta):
	get_node("plasmaKinem").move(movement)
	animationTime -= 1
	if (animationTime == 0):
		animationStep += 1
		animationTime = animationSpeed
	if (animationStep == 4):
		animationStep = 0
	else:
		sprite.set_frame(animationStep)

func _ready():
	speed = 12
	animationStep = 0
	animationSpeed = 2
	animationTime = animationSpeed
	set_fixed_process(true)