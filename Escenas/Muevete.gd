extends RigidBody2D

signal v1
signal v2
signal v3
signal v4


var iposy = -38699
var iposx = 8005
var mov = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_b_1_body_entered(body):
	apply_central_impulse((Vector2($V4.target_position * mov)))
	await get_tree().create_timer(4).timeout
	emit_signal("v1")

func _on_b_2_body_entered(body):
	apply_central_impulse((Vector2($V2.target_position * mov)))
	await get_tree().create_timer(4).timeout
	emit_signal("v2")

func _on_b_3_body_entered(body):
	apply_central_impulse((Vector2($V1.target_position * mov)))
	await get_tree().create_timer(4).timeout
	emit_signal("v3")

func _on_b_4_body_entered(body):
	apply_central_impulse((Vector2($V3.target_position * mov)))
	await get_tree().create_timer(4).timeout
	emit_signal("v4")

func _on_s_86fs_1_body_entered(body):
	position.y = iposy
	position.x = iposx


func _on_s_86fs_2_body_entered(body):
	position.y = iposy
	position.x = iposx
