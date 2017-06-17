extends Node2D

func _on_Level1_pressed():
	get_tree().change_scene("res://scenes/scene1.tscn") # o com es digui el nom de la escena

func _on_Level2_pressed():
	get_tree().change_scene("res://scenes/level2.tscn") # o com es digui el nom de la escena

func _on_Level3_pressed():
	get_tree().change_scene("res://scenes/level3.tscn") # o com es digui el nom de la escena

func _on_HowToPlay_pressed():
	get_node("Popup").popup()