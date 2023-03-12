extends CharacterBody2D

const SPEED = 100.0

func enemy_start(_position):
	position = _position
	
func _physics_process(delta):
	var player = get_parent().get_node("Player")
	velocity = global_position.direction_to(player.global_position)
	var collision = move_and_collide(velocity * SPEED * delta)
	if collision and collision.get_collider() == player:
		print("collide")
		player.queue_free()
		get_tree().paused = true

func hit():
	print("%s hit!" % name)
	queue_free()
