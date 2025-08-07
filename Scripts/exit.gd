extends TextureButton

const MENU = ("res://Scenes/menu.tscn")

func _on_pressed() -> void:
	Global.bullets = 0
	Global.clear = true
	Load.load(MENU)
