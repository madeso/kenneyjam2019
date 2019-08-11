extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const RANGE = 25
const RSQ = RANGE * RANGE

var gameplay = null

var fishes = [
	preload("res://assets/sprites/fish01.png"),
	preload("res://assets/sprites/fish02.png"),
	preload("res://assets/sprites/fish03.png"),
	preload("res://assets/sprites/fish04.png"),
	preload("res://assets/sprites/fish05.png")
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	var type = randi() % 5
	self.texture = fishes[type]
	# self.set_texture(fishes[type])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gameplay.check_pos:
		var l = (self.position - gameplay.gun_position).length_squared()
		if l < RSQ:
			# todo(Gustav): Spawn skeleton
			self.queue_free()
