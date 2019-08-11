extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = rand_range(30, 60)
const RANGE = 25
const RSQ = RANGE * RANGE

var was_visible = false

var gameplay = null
var movement = 1

var pos = Vector2(0,0)
const SWIM_DELTA = PI/2
const SWIM_RANGE = 10
var swim_timer = randf() * PI
var type = 0

var skeleton = preload("res://skeleton.tscn")

var fishes = [
	preload("res://assets/sprites/fish01.png"),
	preload("res://assets/sprites/fish02.png"),
	preload("res://assets/sprites/fish03.png"),
	preload("res://assets/sprites/fish04.png"),
	preload("res://assets/sprites/fish05.png")
	]
var skeletons = [
	preload("res://assets/sprites/skeleton03.png"),
	preload("res://assets/sprites/skeleton04.png"),
	preload("res://assets/sprites/skeleton05.png"),
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	type = randi() % 5
	self.texture = fishes[type]
	self.flip_h = movement < 0
	# self.set_texture(fishes[type])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var r = self.get_rect()
	r.position += self.position
	var is_visible = r.intersects(get_viewport().get_visible_rect())
	if is_visible:
		was_visible = true
	if not is_visible and was_visible:
		# moved outside...
		self.queue_free()
	
	self.pos += Vector2(delta * speed * movement, 0)
	self.swim_timer += delta * SWIM_DELTA
	self.position = pos + Vector2(0, sin(swim_timer) * SWIM_RANGE)
	
	if gameplay.check_pos:
		var l = (self.position - gameplay.gun_position).length_squared()
		if l < RSQ:
			var s = skeleton.instance()
			if type > 1:
				s.texture = skeletons[type-2]
			s.position = self.position
			s.flip_h = self.flip_h
			get_tree().get_root().add_child(s)
			self.queue_free()
