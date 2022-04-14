extends KinematicBody2D

const B_HEIGHT = 460
const B_WIDTH = 700
const SPEED = 7

export var initial_angle = 5  # in degrees

var velocity = Vector2.ONE

func _ready():
	var angle = deg2rad(initial_angle)
	velocity = Vector2(cos(angle), sin(angle)) * SPEED


func _process(_delta):
	position.x += velocity.x
	position.y += velocity.y
	if position.y >= B_HEIGHT:
		velocity.y = -SPEED
	if position.y <= 0:
		velocity.y = SPEED
	if position.x >= B_WIDTH:
		velocity.x = -SPEED
	if position.x <= 0:
		velocity.x = SPEED
