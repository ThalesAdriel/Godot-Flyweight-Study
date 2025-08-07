extends CanvasLayer

@onready var fps_value : Label = $Panel/BoxContainer/FpsValue
@onready var bullets_value : Label = $Panel/BoxContainer/BulletsValue
@onready var memory_value: Label = $Panel/BoxContainer/MemoryValue

func _process(delta: float) -> void:
	fps_value.set_text("FPS: %d" % Engine.get_frames_per_second())
	bullets_value.set_text("Bullets: %d" % Global.bullets)
	memory_value.set_text("memory: %sMiB" % str(Performance.get_monitor(Performance.MEMORY_STATIC)).substr(0, 3))
