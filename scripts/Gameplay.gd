extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gun_position = Vector2(0,0)
var check_pos = false
var gun_timer = 0.0

const MAX_FISH = 15
var fish = preload("res://fish.tscn")
onready var fishes = $"../fishes"

# Called when the node enters the scene tree for the first time.
func _ready():
	while fishes.get_child_count() < MAX_FISH:
		spawn_fish(true)

func fire_gun(pos):
	gun_position = pos
	check_pos = true
	gun_timer = 0.1

const WIDTH = 15
const HEIGHT = 15

func spawn_fish(start):
	var f = fish.instance()
	var x = -WIDTH
	if start:
		x = rand_range(0, get_viewport().size.x)
	if randf() < 0.5:
		f.movement = -1
		if not start:
			x = get_viewport().size.x + WIDTH
	f.position = Vector2(x, rand_range(0, get_viewport().size.y-HEIGHT * 2) + HEIGHT)
	f.gameplay = self
	fishes.add_child(f)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while fishes.get_child_count() < MAX_FISH:
		spawn_fish(false)
	if check_pos:
		gun_timer -= delta
		if gun_timer < 0:
			check_pos = false
