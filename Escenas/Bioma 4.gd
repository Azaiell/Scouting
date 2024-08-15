extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bound_body_entered(body):
	body.physics_material_override.bounce = 0


func _on_bound_body_exited(body):
	body.physics_material_override.bounce = 0.5


func _on_g__n_body_entered(body):
	body.gravity_scale = 4.5


func _on_g__n_body_exited(body):
	await get_tree().create_timer(0.5).timeout
	body.gravity_scale = 0
