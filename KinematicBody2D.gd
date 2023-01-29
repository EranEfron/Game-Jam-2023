extends KinematicBody2D


# Declare member variables here. Examples:
var speed : int = 200
var jumpForce : int = 800
var gravity : int = 1500
var vel : Vector2 = Vector2()
var grounded : bool = false

onready var sprite = $Sprite
onready var ANI = get_node("AnimationPlayer")
onready var State = "Idle"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func die():
	get_tree().change_scene("res://DeathScreen.tscn")
#	get_tree().reload_current_scene()

func _physics_process (delta):
	vel.x = 0
	if is_on_floor():
		State = "Idle"
	else:
		State = "Jump"
# movement inputs
	if Input.is_action_pressed("move_left"):
		State = "Walk"
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		State = "Walk"
		vel.x += speed
	vel = move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		State = "Jump"
		vel.y -= jumpForce
	if vel.x < 0:
		sprite.flip_h = false
	elif vel.x > 0:
		sprite.flip_h = true
	ANI.play(State)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
