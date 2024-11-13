extends Area2D

var speed = 900

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(global_rotation) * speed * delta
	

func _on_body_entered(body):
	if body.is_in_group("destroyable_object"):
		body.queue_free()
		queue_free()
