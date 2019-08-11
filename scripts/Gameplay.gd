extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gun_position = Vector2(0,0)
var check_pos = false
var gun_timer = 0.0

const MAX_FISH = 10
var fish = preload("res://fish.tscn")
onready var fishes = $"../fishes"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire_gun(pos):
	gun_position = pos
	check_pos = true
	gun_timer = 0.1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while fishes.get_child_count() < MAX_FISH:
		var f = fish.instance()
		f.position = Vector2(rand_range(0, get_viewport().size.x), rand_range(0, get_viewport().size.y))
		f.gameplay = self
		fishes.add_child(f)
	if check_pos:
		gun_timer -= delta
		if gun_timer < 0:
			check_pos = false
