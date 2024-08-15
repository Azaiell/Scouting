extends Node2D

var SPEED = 35
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse($RayCast2D.target_position * SPEED)
	await get_tree().create_timer(1).timeout
	body.physics_material_override.bounce = 0.5
