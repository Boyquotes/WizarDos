extends Node2D

var arrel = null
var finished = null
var healthBlue = null
var healthRed = null
var winner = null
var scene = null

func checkWinners():
	healthBlue = arrel.get_node("walls/wizardBlue/healthBar").get_value()
	healthRed = arrel.get_node("walls/wizardRed/healthBar").get_value()
	if (healthBlue == 0 or healthRed == 0):
		if (healthBlue == 0):
			winner = "Red"
		else:
			winner = "Blue"
		return 1
	else:
		return 0

func _on_buttonReset_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://scenes/"+scene+".tscn")

func _on_buttonMenu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://scenes/menu.tscn")

func _fixed_process(delta):
	finished = checkWinners()
	if (finished):
		get_node("popup/background/window/announcment").set_text(winner+" wins!")
		if (winner == "Blue"):
			get_node("popup/background/window/announcment").add_color_override("font_color", Color(0.22,0.26,0.91,1))
		else:
			get_node("popup/background/window/announcment").add_color_override("font_color", Color(0.96,0.3,0.3,1))
		get_tree().set_pause(true)
		get_node("popup").popup()

func _ready():
	arrel = get_parent()
	scene = arrel.scene
	finished = -1
	winner = ""
	healthBlue = arrel.get_node("walls/wizardBlue/healthBar").get_value()
	healthRed = arrel.get_node("walls/wizardRed/healthBar").get_value()
	set_fixed_process(true)