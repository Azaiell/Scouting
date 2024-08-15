extends Node2D

var SPEED = 7
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func _on_area_2d_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse($RayCast2D.target_position * SPEED)
	await get_tree().create_timer(0.02).timeout
	body.apply_central_impulse($RayCast2D2.target_position * SPEED)
	await get_tree().create_timer(0.01).timeout
	body.apply_central_impulse($RayCast2D3.target_position * SPEED)
	await get_tree().create_timer(0.15).timeout
	body.apply_central_impulse($RayCast2D4.target_position * SPEED)
	await get_tree().create_timer(0.01).timeout
	body.apply_central_impulse($RayCast2D5.target_position * SPEED)
	await get_tree().create_timer(0.02).timeout
	body.apply_central_impulse($RayCast2D6.target_position * SPEED)
	await get_tree().create_timer(1).timeout
	body.physics_material_override.bounce = 0.5
