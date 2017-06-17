extends AnimatedSprite

func onFinish():
	get_parent().set_self_opacity(1)
	get_parent().get_node("circle").set_self_opacity(0)
	self.set_self_opacity(0)

func _fixed_process(delta):
	pass

func _ready():
	connect("finished",self,"onFinish")
	set_fixed_process(true)