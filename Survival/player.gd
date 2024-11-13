extends CharacterBody2D

var speed = 700  # speed in pixels/sec

@export var trail: Line2D 

@export var max_trail_points: int = 10


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

	trail.add_point(global_position)
	if trail.get_point_count() > max_trail_points:
		trail.remove_point(0)
	move_and_slide()
	
