extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if get_node("CamaraSala36").enabled:
		show()
		
	if !get_node("CamaraSala36").enabled:
		hide()
