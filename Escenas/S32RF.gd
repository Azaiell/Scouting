extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cambiotp_s_34_41_40_body_entered(body):
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)


func _on_azucena_apaga_11():
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)


func _on_cambiotp_s_35_42_39_body_entered(body):
	set_collision_layer_value(6, false)
	set_collision_mask_value(6, false)


func _on_azucena_apaga_12():
	set_collision_layer_value(6, true)
	set_collision_mask_value(6, true)
