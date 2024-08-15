extends StaticBody2D

var N6 = 1.0 / 6.0
var N3 = 1.0 / 3.0
var on = false
var D1 = true
var D2 = false
var D3 = false
var D4 = false
var D5 = false
var D6 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if on:
		if D1:
			await get_tree().create_timer(0.20).timeout
			position.y += 1 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D1 = false
			D2 = true
			
		if D2:
			await get_tree().create_timer(0.20).timeout
			position.x -= 0.35 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D2 = false
			D3 = true
		
		if D3:
			await get_tree().create_timer(0.20).timeout
			position.y -= N3 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D3 = false
			D4 = true
			
		if D4:
			await get_tree().create_timer(0.20).timeout
			position.y += 0.25 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D4 = false
			D5 = true
		
		if D5:
			await get_tree().create_timer(0.20).timeout
			position.x += 0.14 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D5 = false
			D6 = true
			
		if D6:
			await get_tree().create_timer(0.20).timeout
			position.y -= N6 * (0.017/delta)
			await get_tree().create_timer(11).timeout
			D6 = false
			D1 = true


func _on_activa_b_i_3_body_entered(body):
	on = true
