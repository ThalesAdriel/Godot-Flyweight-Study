extends Control

const MAIN = ("res://Scenes/main.tscn")
const OPTIMIZED_MAIN = ("res://Scenes/optimized_main.tscn")

func _on_no_flyweight_pressed() -> void:
	Load.load(MAIN)

func _on_with_flyweight_pressed() -> void:
	Load.load(OPTIMIZED_MAIN)

func _on_exit_pressed() -> void:
	get_tree().quit()
