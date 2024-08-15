extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pared_rompible_rompe():
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)
	await get_tree().create_timer(30).timeout
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
