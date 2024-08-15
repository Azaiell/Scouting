extends Node2D

var pincho = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_p_1_body_entered(body):
	body.apply_central_impulse(Vector2($P1/Pi1 * pincho))


func _on_p_2_body_entered(body):
	body.apply_central_impulse(Vector2($P2/Pi2 * pincho))


func _on_p_3_body_entered(body):
	body.apply_central_impulse(Vector2($P3/Pi3 * pincho))


func _on_p_4_body_entered(body):
	body.apply_central_impulse(Vector2($P4/Pi4 * pincho))


func _on_p_5_body_entered(body):
	body.apply_central_impulse(Vector2($P5/Pi5 * pincho))


func _on_p_6_body_entered(body):
	body.apply_central_impulse(Vector2($P6/Pi6 * pincho))


func _on_p_7_body_entered(body):
	body.apply_central_impulse(Vector2($P7/Pi7 * pincho))


func _on_p_8_body_entered(body):
	body.apply_central_impulse(Vector2($P8/Pi8 * pincho))
