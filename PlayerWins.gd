extends Node2D
onready var timer = $Timer
func _ready():
	timer.start(1.5)


func _on_Timer_timeout():
	get_tree().change_scene("res://Main Menu.tscn")
