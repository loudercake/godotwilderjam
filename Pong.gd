extends Node2D
onready var Player = $Player
onready var CPU = $CPU
onready var Ball = $Ball
onready var timer = $Timer
onready var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	Player.connect("game_stopp",self,"game_stop")
	Player.connect("game_stopp",self,"losep")
	Player.connect("win",self,"winp")
	CPU.connect("game_stopc",self,"game_stop")
	CPU.connect("game_stopc",self,"losec")
	CPU.connect("win",self,"winc")
func winp():
	get_tree().change_scene("res://PlayerWins.tscn")
func winc():
	get_tree().change_scene("res://CPUWins.tscn")
func losep():
	CPU.points +=1
func losec():
	Player.points +=1
func game_stop():
	Paused.paused = true
	timer.start(1.5)


func _on_Timer_timeout():
	var angle = rng.randi_range(45,85)
	Ball.global_position = Vector2(320,248)
	Ball.velocity = Vector2(cos(angle), sin(angle)) * Ball.SPEED
	Player.position = Vector2(64,224)
	CPU.position = Vector2(656,248)
	Player.Tweenie.stop(Player)
	CPU.Tweenie.stop(CPU)
	Player.modulate = Color(255,255,255,255)
	CPU.modulate = Color(255,255,255,255)
	Paused.paused = false
