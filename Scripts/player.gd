extends CharacterBody2D

const BULLET = preload("res://Scenes/bullet.tscn")
const SPEED = 300.0

func _input(_event):
	if Input.is_action_just_pressed("shoot_up"):
		shoot("up")
	elif Input.is_action_just_pressed("shoot_left"):
		shoot("left")
	elif Input.is_action_just_pressed("shoot_right"):
		shoot("right")
	elif Input.is_action_just_pressed("shoot_down"):
		shoot("down")

func _physics_process(_delta):
	var x_direction = Input.get_axis("player_left", "player_right")
	var y_direction = Input.get_axis("player_up", "player_down")
	if x_direction or y_direction:
		velocity.x = x_direction * SPEED
		velocity.y = y_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func shoot(dir):
	var bul = BULLET.instantiate()
	print(dir)
	if dir == "up": 
		bul.bullet_start($MarkerUp.global_position, deg_to_rad(0))
	elif dir == "left":
		bul.bullet_start($MarkerLeft.global_position, deg_to_rad(270))
	elif dir == "right": 
		bul.bullet_start($MarkerRight.global_position, deg_to_rad(90))
	elif dir == "down": 
		bul.bullet_start($MarkerDown.global_position, deg_to_rad(180))
	get_parent().add_child(bul)
