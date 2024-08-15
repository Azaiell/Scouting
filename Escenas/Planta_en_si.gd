extends Node2D


signal parad
signal seguid
var fuerza = 40
var modo1 = true
var modo2 = false
var on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while on:
		await get_tree().create_timer(3).timeout
		modo1 = false
		modo2 = true
		await get_tree().create_timer(3).timeout
		modo1 = true
		modo2 = false


func _on_planta_body_entered(body):
	on = true
	
func _on_planta_body_exited(body):
	if modo1:
		body.apply_central_impulse(Vector2($Planta/D1.target_position * fuerza))
	if modo2:
		body.apply_central_impulse(Vector2($Planta/D2.target_position * fuerza))
	await get_tree().create_timer(1).timeout
	on = false
	emit_signal("seguid")





func _on_agarre_3_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre3/G3.target_position * fuerza / 6))
	emit_signal("parad")

func _on_agarre_2_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre2/G2.target_position * fuerza / 6))
	emit_signal("parad")

func _on_agarre_1_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre1/G1.target_position * fuerza / 6))
	emit_signal("parad")


func _on_agarre_4_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre4/G4.target_position * fuerza / 6))
	emit_signal("parad")


func _on_agarre_5_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre5/G5.target_position * fuerza / 6))
	emit_signal("parad")


func _on_agarre_6_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre6/G6.target_position * fuerza / 6))
	emit_signal("parad")


func _on_agarre_7_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre7/G7.target_position * fuerza / 6))
	emit_signal("parad")


func _on_agarre_8_body_entered(body):
	body.apply_central_impulse(Vector2($Agarre8/G8.target_position * fuerza / 6))
	emit_signal("parad")
