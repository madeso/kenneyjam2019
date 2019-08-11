extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var crosshair = load("res://assets/sprites/crosshair.png")
var loading = load("res://assets/sprites/crosshair-loading.png")
var bubbles = preload("res://bubbles.tscn")
onready var gameplay = $"../Gameplay"

var md = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Input.set_custom_mouse_cursor(crosshair, 0, Vector2(21, 21))
	# couldnt find a way to move cursor to center
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var hold = Input.is_mouse_button_pressed(BUTTON_LEFT)
	if hold and not md:
		# todo: Gustav: play sound
		var b = bubbles.instance()
		b.position = get_viewport().get_mouse_position()
		gameplay.fire_gun(b.position)
		get_tree().get_root().add_child(b)
		md = true
	if not hold:
		md = false
