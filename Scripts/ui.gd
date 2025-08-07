extends CanvasLayer

@onready var fps_value : Label = $Panel/BoxContainer/FpsValue
@onready var bullets_value : Label = $Panel/BoxContainer/BulletsValue

func _process(delta: float) -> void:
	fps_value.set_text("FPS %d" % Engine.get_frames_per_second())
	bullets_value.set_text("Bullets %d" % Global.bullets)
