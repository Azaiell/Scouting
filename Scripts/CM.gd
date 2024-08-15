extends Node2D

signal a1
signal a2
signal a3
signal a4
signal a5
signal a6
signal a7
signal a8
signal a9
signal a10
signal a11
signal a12


var fuerza = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_a_1_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A1/RA1.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a1")


func _on_a_2_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A2/RA2.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a2")


func _on_a_3_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A3/RA3.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a3")


func _on_a_4_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A4/RA4.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a4")


func _on_a_5_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A5/RA5.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a5")


func _on_a_6_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A6/RA6.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a6")


func _on_a_7_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A7/RA7.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a7")


func _on_a_8_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A8/RA8.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a8")


func _on_a_9_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A9/RA9.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a9")


func _on_a_10_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A10/RA10.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a10")


func _on_a_11_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A11/RA11.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a11")


func _on_a_12_body_entered(body):
	body.physics_material_override.bounce = 0
	body.apply_central_impulse(Vector2($A12/RA12.target_position * fuerza))
	await get_tree().create_timer(0.08).timeout
	emit_signal("a12")


func _on_salida_body_exited(body):
	await get_tree().create_timer(1).timeout
	body.physics_material_override.bounce = 0.5
