extends KinematicBody2D
signal game_stopp
signal win
onready var Tweenie = $Tween
onready var PointsUI = get_tree().get_current_scene().get_node("Score")
var speed = 5
var points = 0
func _process(delta):
	PointsUI.text.text = str(points)
	if Paused.paused == false:
		if Input.get_action_strength("ui_up"):
			position.y -= speed
		if Input.get_action_strength("ui_down"):
			 position.y += speed
		if position.y >= 420:
			position.y -= speed
		if position.y <= 0:
			position.y += speed
		if points == 5:
			emit_signal("win")


func _on_Area2D_area_entered(area):
	Tweenie.interpolate_property(self,"modulate",Color(0,0,0,255), Color(0,0,0,0),22,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	Tweenie.start()
	emit_signal("game_stopp")
