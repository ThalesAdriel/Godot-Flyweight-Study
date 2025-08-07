extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var marker_2d: Marker2D = $Marker2D

const BULLET_SCENE = preload("res://Scenes/bullet.tscn")

var firerate = 26000
var spread_range = 70.0

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)

	scale.y = -1 if rotation_degrees > 90 and rotation_degrees < 270 else 1

	if Input.is_action_just_pressed("Click"):
		var bullet_count = round(firerate * delta)
		for i in range(bullet_count):
			var bullet_inst = BULLET_SCENE.instantiate()
			bullet_inst.sprite = preload("res://Textures/bullet.png")
			bullet_inst.damage = 10
			bullet_inst.speed = 300

			get_tree().root.add_child(bullet_inst)

			var offset = Vector2(
				randf_range(-spread_range, spread_range),
				randf_range(-spread_range, spread_range)
			)
			bullet_inst.global_position = marker_2d.global_position + offset
			bullet_inst.rotation = rotation
