extends CharacterBody2D

const SPEED = 100.0
const SCRATCH = preload("res://Scenes/scratchcard.tscn")
const DROP_RATE = 0.2

func _ready():
	randomize()
	
func enemy_start(_position):
	position = _position
	
func _physics_process(delta):
	var player = get_parent().get_node("Player")
	velocity = global_position.direction_to(player.global_position)
	var collision = move_and_collide(velocity * SPEED * delta)
	if collision and collision.get_collider() == player:
		player.queue_free()
		get_tree().paused = true

func hit():
	if randf() <= DROP_RATE:
		var scratch = SCRATCH.instantiate()
		scratch.card_start(global_position)
		get_parent().add_child(scratch)
	queue_free()
