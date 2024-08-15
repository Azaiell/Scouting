extends StaticBody2D

var on = false
var D1 = true
var D2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if on:
		if D1:
			position.x += 1 * (0.017/delta)
			await get_tree().create_timer(5).timeout
			D1 = false
			D2 = true
			
		if D2:
			position.x -= 0.5 * (0.017/delta)
			await get_tree().create_timer(5).timeout
			D2 = false
			D1 = true


func _on_activa_id_1_body_entered(body):
	on = true
