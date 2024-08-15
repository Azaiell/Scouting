extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_11cambiotp_body_entered(body):
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)
	set_collision_layer_value(2, false)
	set_collision_mask_value(2, false)
	set_collision_layer_value(4, false)
	set_collision_mask_value(4, false)
	set_collision_layer_value(5, false)
	set_collision_mask_value(5, false)


func _on_switch_frenada_s_3_body_entered(body):
	get_tree().create_timer(1).timeout
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
	set_collision_layer_value(4, true)
	set_collision_mask_value(4, true)
	set_collision_layer_value(5, true)
	set_collision_mask_value(5, true)
