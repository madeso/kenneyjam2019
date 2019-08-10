extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var crosshair = load("res://assets/sprites/crosshair.png")
var loading = load("res://assets/sprites/crosshair-loading.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	# Input.set_custom_mouse_cursor(crosshair)
	# couldnt find a way to move cursor to center
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = get_viewport().get_mouse_position()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		pass
