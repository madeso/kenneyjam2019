extends CPUParticles2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.emitting = true
	self.one_shot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.emitting == false:
		self.queue_free()
