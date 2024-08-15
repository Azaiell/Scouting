extends Node2D

signal rompe

var contador = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $Pared/Grieta.get_collider() or $Pared/Grieta2.get_collider():
		if Input.is_action_just_pressed("Grab"):
			contador = contador - 1
			
	if contador == 0:
		emit_signal("rompe")
		await get_tree().create_timer(30).timeout
		contador = 3
