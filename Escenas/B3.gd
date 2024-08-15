extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_muevete_v_3():
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	await get_tree().create_timer(0.1).timeout
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)


func _on_bio_5_i_body_entered(body):
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)


func _on_eai_body_entered(body):
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
