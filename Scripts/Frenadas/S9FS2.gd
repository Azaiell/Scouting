extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_switch_frenada_s_9_body_entered(body):
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)

func _on_azucena_apaga_7():
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)