extends Area2D

signal caete
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_azucena_cambio_1():
	#if get_node("/root/Global").where == 2:
	#	emit_signal("caete")
		#print("me entero1")
	pass


func _on_azucena_again():
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	await get_tree().create_timer(0.2).timeout
	set_collision_layer_value(1, true)
	set_collision_mask_value(1, true)
