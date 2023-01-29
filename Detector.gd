extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var player = null
const CHASE_SPEED= 200

func _physics_process(delta):
	if player:
		var player_direction = (player.position - self.position).normalized()
		move_and_slide(CHASE_SPEED * player_direction)

func _on_DetectPlayer_body_entered(body):
	if body.name == "Player":
		player = body
func _on_DetectPlayer_body_exited(body):
	if body.name == "Player":
		player = body
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
