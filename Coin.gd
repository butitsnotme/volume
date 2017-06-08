extends Area2D

var vol_adjust
const min_x = 0
const max_x = 2000
const min_y = -700
const max_y = 0

func _ready():
	randomize()
	vol_adjust = floor(rand_range(-100, 100))
	
	# Pick a random x and y
	var x = rand_range(min_x, max_x)
	var y = rand_range(min_y, max_y)
	
	# Set our position
	set_pos(Vector2(x, y))
	
	# Label ourselves
	get_node("Label").set_text(String(vol_adjust) + "%")
	
	# connect to the signal
	connect("body_enter", self, "body_enter")

func body_enter(body):
	var vol = Globals.get("volume") + vol_adjust
	if (0 > vol):
		vol += 50
	if (0 > vol):
		vol += 50
	if (100 < vol):
		vol -= 50
	if (100 < vol):
		vol -= 50
	Globals.set("volume", vol)
	queue_free()
