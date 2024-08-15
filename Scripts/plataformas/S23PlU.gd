extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cambiotp_s_24__switch_fenada_s_23_body_entered(body):
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)


func _on_azucena_apaga_10():
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(4, true)
	set_collision_mask_value(4, true)
