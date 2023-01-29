extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# onload causes random number to be generated
# Called when the node enters the scene tree for the first time.
onready var ANI = get_node("AnimationPlayer")

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Powerup_body_entered(body):
	pass # trigger powerup call in body
