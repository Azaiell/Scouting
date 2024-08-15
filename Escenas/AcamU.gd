extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cl_a_1_body_entered(body):
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_cl_a_1_2_body_entered(body):
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)


func _on_cl_a_2_body_entered(body):
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_cl_a_2_2_body_entered(body):
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)


func _on_cl_a_3_1_body_entered(body):
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_cl_a_3_2_body_entered(body):
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)


func _on_cl_a_4_body_entered(body):
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_cl_a_4_2_body_entered(body):
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
