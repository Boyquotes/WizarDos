extends ProgressBar

var health = null

func _fixed_process(delta):
	health = get_parent().health

func _ready():
	set_valuehealth = get_parent().health
	set_fixed_process(true)
