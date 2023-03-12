extends Area2D

func card_start(_position):
	position = _position
	rotation = deg_to_rad(randi() % 360)
	
func _ready():
	randomize()

func _on_body_entered(body):
	Globals.tickets += 1
	print(Globals.tickets)
	queue_free()
