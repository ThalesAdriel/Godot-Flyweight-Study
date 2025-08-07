extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var sprite : Texture2D

var damage : int = 10
var speed : int = 300

func _ready() -> void:
	Global.bullets += 1
	Global.clear = false

func _process(delta: float) -> void:

	var motion := transform.x * speed * delta
	
	sprite_2d.texture = self.sprite
	self.position += motion
	if Global.clear:
		print("teste")
		queue_free()
