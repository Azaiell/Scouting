extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_luz_3_dale_3():
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)
	await get_tree().create_timer(0.10).timeout
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)