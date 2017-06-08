extends RigidBody2D

var volume_label

func _ready():
	# Set up processing...
	set_fixed_process(true)
	set_process(true)
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	
	# Set the initial volume level
	randomize()
	Globals.set("volume", floor(rand_range(0, 100)))
	volume_label = get_node("Volume Level")
	


func _fixed_process(delta):
	var on_ground = false
	var colliding_bodies = get_colliding_bodies()
	var number = colliding_bodies.size()
	if (0 < number):
		on_ground = true
		
	
	var force = Vector2(0, 0)
	if (on_ground && Input.is_action_pressed("ui_up")):
		force.y += -8000
	
	if (on_ground && Input.is_action_pressed("ui_right")):
		force.x += 150
	
	if (on_ground && Input.is_action_pressed("ui_left")):
		force.x += -150
	
	set_applied_force(force)
	
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
		
	if (Input.is_key_pressed(KEY_R)):
		get_tree().reload_current_scene()

func _process(delta):
	volume_label.set_text(String(Globals.get("volume")) + "%")