extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cambiotp_s_43_body_entered(body):
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_azucena_apaga_14():
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
