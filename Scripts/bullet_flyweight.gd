extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var bullet_type: BulletType

func _ready() -> void:
	Global.bullets += 1
	Global.clear = false
	sprite_2d.texture = bullet_type.texture

func _process(delta: float) -> void:
	var motion := transform.x * bullet_type.speed * delta
	self.position += motion
	
	if Global.clear:
		queue_free()
