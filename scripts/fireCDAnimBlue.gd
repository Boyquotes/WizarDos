extends AnimatedSprite

func runAnim():
	self.set_self_opacity(1)
	self.set_animation("fireAnim")
	self.play("fireAnim")

func _fixed_process(delta):
	if (self.get_frame() == 31):
		set_self_opacity(0)

func _ready():
	set_fixed_process(true)
