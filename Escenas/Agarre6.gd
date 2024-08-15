extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_planta_en_si_parad():
	set_collision_layer_value(8, false)
	set_collision_mask_value(8, false)


func _on_planta_en_si_seguid():
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(8, true)
	set_collision_mask_value(8, true)
