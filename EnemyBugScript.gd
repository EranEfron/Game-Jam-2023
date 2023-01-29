extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity : int = 1500

onready var velocity = Vector2(-200, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # movement code (maybe some seeking)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity.x = -velocity.x
	var sprite = $Sprite
	if velocity.x < 0:
		sprite.flip_h = false
	elif velocity.x > 0:
		sprite.flip_h = true

func _on_Area2D_body_entered(body):
	if body.name == "Player": # Replace with function body.
		body.die()
