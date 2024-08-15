extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_area_2d_body_entered(body):
	body.physics_material_override.rough = 0
	body.linear_damp = 3.2
	
func _on_area_2d_body_exited(body):
	body.physics_material_override.rough = 1
	body.linear_damp = 8
