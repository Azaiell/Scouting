extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_agarre_3_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_2_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_1_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_4_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_5_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_6_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_7_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_agarre_8_body_entered(body):
	await get_tree().create_timer(0.05).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)
