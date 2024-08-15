extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_62tp_3_body_entered(body):
	set_collision_layer_value(7, false)
	set_collision_mask_value(7, false)
	await get_tree().create_timer(7).timeout
	set_collision_layer_value(7, true)
	set_collision_mask_value(7, true)
