extends Control


# Called when the node enters the scene tree for the first time.
func change_scene_to_file(scene):
	$CanvasLayerCortina/Anim.play("show")
	await $CanvasLayerCortina/Anim.animation_finished
	
	get_tree().change_scene_to_file(scene)
	
	$CanvasLayerCortina/Anim.play_backwards("show")
	await $CanvasLayerCortina/Anim.animation_finished
