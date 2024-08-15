extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_e_1_body_entered(body):
	await get_tree().create_timer(0.01).timeout
	if get_node("E1").on:
		body.physics_material_override.bounce = 0
		body.hide()
		await get_tree().create_timer(2).timeout
		body.show()
		body.physics_material_override.bounce = 0.5

func _on_e_2_body_entered(body):
	await get_tree().create_timer(0.01).timeout
	if get_node("E2").on:
		body.physics_material_override.bounce = 0
		body.hide()
		await get_tree().create_timer(2).timeout
		body.show()
		body.physics_material_override.bounce = 0.5
	
func _on_e_1_body_exited(body):
	get_node("E1").on = true


func _on_e_2_body_exited(body):
	get_node("E2").on = true
