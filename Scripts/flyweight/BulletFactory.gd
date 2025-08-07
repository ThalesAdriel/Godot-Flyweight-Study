extends Node
class_name BulletFactory

var bullet_types := {}

func get_bullet_type(key: String) -> BulletType:
	if bullet_types.has(key):
		return bullet_types[key]

	var type := BulletType.new()

	match key:
		"normal":
			type.texture = preload("res://Textures/bullet.png")
			type.damage = 10
			type.speed = 300
		"fast":
			type.texture = preload("res://Textures/bullet.png")
			type.damage = 6
			type.speed = 500
		_:
			push_error("error type: %s" % key)
			return null

	bullet_types[key] = type
	return type
