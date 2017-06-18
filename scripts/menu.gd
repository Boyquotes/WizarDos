extends Node2D

func _on_Level1_pressed():
	get_tree().change_scene("res://scenes/scene1.tscn")

func _on_Level2_pressed():
	get_tree().change_scene("res://scenes/scene2.tscn")

func _on_Level3_pressed():
	get_tree().change_scene("res://scenes/scene3.tscn")

func _on_HowToPlay_pressed():
	get_node("Popup").popup()