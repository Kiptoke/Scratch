extends Timer

const ENEMY = preload("res://Scenes/enemy.tscn")
@onready var locations = [
		get_parent().get_node("SpawnUp"),
		get_parent().get_node("SpawnRight"),
		get_parent().get_node("SpawnDown"),
		get_parent().get_node("SpawnLeft")
	]

func _ready():
	randomize()

func _on_timeout():
	var i = randi() % 4
	spawn(i)

func spawn(num):
	var enemy = ENEMY.instantiate()
	enemy.enemy_start(locations[num].global_position)
	get_parent().add_child(enemy)
