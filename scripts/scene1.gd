extends Node2D

func fireCooldown(team):
	get_node("spellFrame"+team+"/coolDownFire/CDanimation").set_frame(0)
	get_node("spellFrame"+team+"/coolDownFire/CDanimation").set_self_opacity(1)
	get_node("spellFrame"+team+"/coolDownFire/CDanimation").play()
	get_node("spellFrame"+team+"/coolDownFire").set_self_opacity(0.7)
	get_node("spellFrame"+team+"/coolDownFire/circle").set_self_opacity(0.5)

func iceCooldown(team):
	get_node("spellFrame"+team+"/coolDownIce/CDanimation").set_frame(0)
	get_node("spellFrame"+team+"/coolDownIce/CDanimation").set_self_opacity(1)
	get_node("spellFrame"+team+"/coolDownIce/CDanimation").play()
	get_node("spellFrame"+team+"/coolDownIce").set_self_opacity(0.7)
	get_node("spellFrame"+team+"/coolDownIce/circle").set_self_opacity(0.5)

func shockCooldown(team):
	get_node("spellFrame"+team+"/coolDownShock/CDanimation").set_frame(0)
	get_node("spellFrame"+team+"/coolDownShock/CDanimation").set_self_opacity(1)
	get_node("spellFrame"+team+"/coolDownShock/CDanimation").play()
	get_node("spellFrame"+team+"/coolDownShock").set_self_opacity(0.7)
	get_node("spellFrame"+team+"/coolDownShock/circle").set_self_opacity(0.5)

func _fixed_process(delta):
	pass

func _ready():
	get_node("walls/wizardRed").change_team()
	get_node("walls/wizardBlue").scene = "scene1"
	get_node("walls/wizardRed").scene = "scene1"
	set_fixed_process(true)