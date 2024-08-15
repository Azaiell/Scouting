extends StaticBody2D

var N3 = 1.0 / 3.0
var on = false
var D1 = true
var D2 = false
var D3 = false
var D4 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if on:
		if D1:
			await get_tree().create_timer(0.20).timeout
			position.x -= 1 * (0.017/delta)
			await get_tree().create_timer(13.25).timeout
			D1 = false
			D2 = true
			
		if D2:
			await get_tree().create_timer(0.20).timeout
			position.y += 0.225 * (0.017/delta)
			await get_tree().create_timer(13.25).timeout
			D2 = false
			D3 = true
		
		if D3:
			await get_tree().create_timer(0.20).timeout
			position.y -= 0.15 * (0.017/delta)
			await get_tree().create_timer(13.25).timeout
			D3 = false
			D4 = true
		
		if D4:
			await get_tree().create_timer(0.20).timeout
			position.x += 0.25 * (0.017/delta)
			await get_tree().create_timer(13.25).timeout
			D4 = false
			D1 = true


func _on_activa_b_i_7_body_entered(body):
	on = true
