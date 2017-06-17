extends KinematicBody2D

var animationStep = null
var animationSpeed = null
var animationTime = null
var scene_fireball = preload("res://scenes/fireball.tscn")
var scene_icicle = preload("res://scenes/icicle.tscn")
var scene_shock = preload("res://scenes/shock.tscn")
var scene_particle = preload("res://scenes/particles.tscn")
var state
var sprite
var able_to_fire = true
var able_to_ice = true
var able_to_shock = true
var burning = null
var burnTimer = null
var freezed = null
var freezeTimer = null
var stunned = null
var stunTimer = null
var particle = null
var team = 1
var teamName = "Blue"
var scene = ""
var speed = null
var health = null
var elapsedTime = null
var controls = { 'up': KEY_W, 'down' : KEY_S, 'left' : KEY_A, 'right' : KEY_D, 'fire' :  KEY_T, 'ice' :  KEY_Y, 'shock' :  KEY_U}

func amIWizard():
	return team

func damage(damage,elemental):
	health -= damage
	particle = scene_particle.instance()
	particle.set_global_pos(Vector2(get_global_pos().x+15,get_global_pos().y-30))
	particle.setDirection(state)
	particle.startAnim(elemental)
	particle.set_scale(Vector2(4,4))
	get_node("/root/"+scene+"/walls").add_child(particle)

func burn():
	get_node("Timer_burn").start()
	get_node("wizardSprite").set_modulate(Color(0.88,0.24,0.24,1))
	elapsedTime = 0
	burning  = true
	unFreeze()

func unBurn():
	burning = false
	get_node("wizardSprite").set_modulate(Color(1,1,1,1))

func freeze():
	get_node("Timer_freeze").start()
	get_node("wizardSprite").set_modulate(Color(0.18,0.26,0.76,1))
	freezed = true
	speed = speed / 2

func unFreeze():
	if (freezed):
		speed = speed * 2
		freezed = false
		get_node("wizardSprite").set_modulate(Color(1,1,1,1))

func stun():
	get_node("Timer_stun").start()
	get_node("wizardSprite").set_modulate(Color(0.87,0.86,0.3,1))
	stunned = true

func unStun():
	stunned = false
	get_node("wizardSprite").set_modulate(Color(1,1,1,1))

func change_state(accio):
	if (state == 1):
		if (accio == "up"):
			state = 4
		if (accio == "right"):
			state = 2
	elif (state == 2):
		if (accio == "up"):
			state = 3
		if (accio == "left"):
			state = 1
	elif (state == 3):
		if (accio == "down"):
			state = 2
		if (accio == "left"):
			state = 4
	else: # state == 4
		if (accio == "down"):
			state = 1
		if (accio == "right"):
			state = 3
	refresh_sprite()

func refresh_sprite():
	if (state == 1):
		sprite.set_frame(1)
		animate()
		sprite.set_flip_h(false)
	elif (state == 2):
		sprite.set_frame(1)
		animate()
		sprite.set_flip_h(true)
	elif (state == 3):
		sprite.set_frame(0)
		sprite.set_flip_h(false)
	else:
		sprite.set_frame(0)
		sprite.set_flip_h(true)

func animate():
	animationTime -= 1
	if (animationTime == 0):
		animationStep += 1
		animationTime = animationSpeed
	if (animationStep == 6):
		animationStep = 1
	else:
		sprite.set_frame(animationStep)

func change_team():
	controls = { 'up': KEY_UP, 'down' : KEY_DOWN, 'left' : KEY_LEFT, 'right' : KEY_RIGHT, 'fire' :  KEY_END, 'ice' :  KEY_INSERT, 'shock' :  KEY_DELETE}
	sprite = get_node("wizardSprite")
	var texture = load("res://assets/redWizard.png")
	sprite.set_texture(texture)
	team = 2
	teamName = "Red"

func _on_Timer_fire_timeout():
	able_to_fire = true

func _on_Timer_ice_timeout():
	able_to_ice = true

func _on_Timer_shock_timeout():
	able_to_shock = true

func _on_Timer_burn_timeout():
	unBurn()

func _on_Timer_freeze_timeout():
	unFreeze()

func _on_Timer_stun_timeout():
	unStun()

func checkPlayerControls():
	if (Input.is_key_pressed(controls['left'])):
		change_state("left")
		move(Vector2(-1,0)*speed)
	if (Input.is_key_pressed(controls['right'])):
		change_state("right")
		move(Vector2(1,0)*speed)
	if (Input.is_key_pressed(controls['up'])):
		change_state("up")
		move(Vector2(0,-1)*speed)
	if (Input.is_key_pressed(controls['down'])):
		change_state("down")
		move(Vector2(0,1)*speed)
	if (Input.is_key_pressed(controls['fire']) and able_to_fire):
		get_node("/root/"+scene).fireCooldown(teamName)
		var fire = scene_fireball.instance()
		fire.property = team
		fire.inicialize(Vector2(get_global_pos().x+15,get_global_pos().y-30),state)
		get_node("/root/"+scene+"/walls").add_child(fire)
		get_node("Timer_fire").start()
		able_to_fire = false
	if (Input.is_key_pressed(controls['ice']) and able_to_ice):
		get_node("/root/"+scene).iceCooldown(teamName)
		var ice = scene_icicle.instance()
		ice.property = team
		ice.inicialize(Vector2(get_global_pos().x+15,get_global_pos().y-30),state)
		get_node("/root/"+scene+"/walls").add_child(ice)
		get_node("Timer_ice").start()
		able_to_ice = false
	if (Input.is_key_pressed(controls['shock']) and able_to_shock):
		get_node("/root/"+scene).shockCooldown(teamName)
		var shock = scene_shock.instance()
		shock.property = team
		shock.inicialize(Vector2(get_global_pos().x+15,get_global_pos().y-30),state)
		get_node("/root/"+scene+"/walls").add_child(shock)
		get_node("Timer_shock").start()
		able_to_shock = false

func _fixed_process(delta):
	if (not stunned):
		checkPlayerControls()
	if (burning):
		elapsedTime += delta
		if (elapsedTime > 0.9):
			health -= 3
			elapsedTime = 0
	get_node("healthBar").set_value(health)

func _ready():
	sprite = get_node("wizardSprite")
	burnTimer = get_node("Timer_burn")
	freezeTimer = get_node("Timer_freeze")
	stunTimer = get_node("Timer_stun")
	burning = false
	freezed = false
	stunned = false
	speed = 2.5
	state = 1
	health = 100
	get_node("healthBar").set_value(health)
	animationStep = 1
	animationSpeed = 10
	animationTime = animationSpeed
	set_fixed_process(true)