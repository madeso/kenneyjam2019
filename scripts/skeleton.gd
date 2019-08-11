extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(0, 50*delta)
	
	var r = self.get_rect()
	r.position += self.position
	var is_visible = r.intersects(get_viewport().get_visible_rect())
	if not is_visible:
		print('removed skeleton')
		self.queue_free()