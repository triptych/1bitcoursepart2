extends Area2D

export var SPEED = 50

onready var animationplayer = $AnimationPlayer
onready var sprite = $Sprite

var moving = false


func _process(delta):
	moving = false
	if Input.is_action_pressed("ui_right"):
		move(SPEED,0, delta)
		sprite.flip_h=false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED,0, delta)
		sprite.flip_h=true
	if Input.is_action_pressed("ui_up"):
		move(0,-SPEED, delta)
		# sprite.flip_h = false
	if Input.is_action_pressed("ui_down"):
		move(0,SPEED, delta)
		# sprite.flip_h = false
	if moving == true:
		animationplayer.play("Run")		
	else:
		animationplayer.play("Idle")
		
func move(xSpeed, ySpeed, delta):
	position.x += xSpeed * delta
	position.y += ySpeed * delta

	moving = true
		


func _on_Piggy_area_entered(area):
	area.queue_free()
