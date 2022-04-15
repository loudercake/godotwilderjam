extends Node

func _process(delta):
	if Input.is_action_pressed("a"):
		get_tree().change_scene("res://Pong3.tscn")
	elif Input.is_action_pressed("b"):
		get_tree().change_scene("res://Pong5.tscn")
	elif Input.is_action_pressed("space"):
		get_tree().change_scene("res://Pong9.tscn")
