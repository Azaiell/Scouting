extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_s_20ai_body_entered(body):
	set_collision_layer_value(3, false)
	set_collision_mask_value(3, false)


func _on_s_19ad_body_entered(body):
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)


func _on_s_19adc_body_entered(body):
	set_collision_layer_value(3, true)
	set_collision_mask_value(3, true)

