extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_srs_cl_body_entered(body):
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	await get_tree().create_timer(2).timeout
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)


func _on_srs_cl_2_body_entered(body):
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	await get_tree().create_timer(2).timeout
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)


func _on_cambiotp_s_23_body_entered(body):
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	await get_tree().create_timer(2).timeout
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)