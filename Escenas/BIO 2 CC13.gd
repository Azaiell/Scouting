extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cambiotp_s_34_41_40_body_entered(body):
	await get_tree().create_timer(0.10).timeout
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	


func _on_azucena_apaga_11_2():
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
	set_collision_layer_value(4, true)
	set_collision_mask_value(4, true)
