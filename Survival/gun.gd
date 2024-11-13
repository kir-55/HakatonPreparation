extends Node2D

@export var bullet_prefab: PackedScene

func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		var target = get_global_mouse_position()
		get_parent().look_at(target)
		
		var bullet = bullet_prefab.instantiate() 
		bullet.global_position = global_position
		bullet.rotation = global_rotation
		get_tree().root.get_child(0).add_child(bullet)
