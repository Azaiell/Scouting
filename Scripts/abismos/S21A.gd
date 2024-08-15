extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_12_cambiotp_body_entered(body):
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	await get_tree().create_timer(3).timeout
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
