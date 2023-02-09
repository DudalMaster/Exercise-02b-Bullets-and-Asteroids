extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 30.0
var damage = 1
var max_speed = 150

func _ready():
	velocity = Vector2(0,-speed)

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.INF)
	position = position + velocity 
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_speed)
	velocity = move_and_slide(velocity, Vector2.ZERO)

func _on_Timer_timeout():
	queue_free()

func _on_Area2D_area_entered():
	queue_free()
