extends Node2D

var animationStep = null
var animationColumn = null
var animationSpeed = null
var animationTime = null
var sprite = null
var movement = Vector2()
var property = null

func inicialize(pos, state):
	sprite = get_node("fireballKinem/fireballAnim")
	set_global_pos(pos)
	if (state == 1):
		animationColumn = 7
		movement = Vector2(-8,4)
	elif (state == 2):
		animationColumn = 5
		movement = Vector2(8,4)
	elif (state == 3):
		animationColumn = 3
		movement = Vector2(8,-4)
	else:
		animationColumn = 1
		movement = Vector2(-8,-4)
	sprite.set_frame(animationColumn*8)
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("fireballKinem").move(movement)
	animationTime -= 1
	if (animationTime == 0):
		animationStep += 1
		animationTime = animationSpeed
	if (animationStep == 8):
		animationStep = 0
	else:
		sprite.set_frame(animationStep+animationColumn*8)

func _ready():
	animationStep = 0
	animationSpeed = 4
	animationTime = animationSpeed