extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bio_5_au_body_entered(body):
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)


func _on_bio_5_au_body_exited(body):
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_bio_5_aa_body_entered(body):
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)


func _on_bio_5_aa_body_exited(body):
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)


func _on_azucena_cae_1():
	set_collision_layer_value(9, true)
	set_collision_mask_value(9, true)


func _on_azucena_cae_2():
	set_collision_layer_value(9, false)
	set_collision_mask_value(9, false)