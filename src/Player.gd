extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = 175
export (int) var gravity = 100

var velocity = Vector2()

func get_input():
    velocity.x = 0

    if Input.is_action_pressed("ui_up") and is_on_floor():
        velocity.y = -jump_speed
    if Input.is_action_pressed("ui_right"):
        velocity.x += run_speed
    if Input.is_action_pressed("ui_left"):
        velocity.x -= run_speed

func _process(delta):
	get_input()

func _physics_process(delta):
    velocity.y += gravity * delta
    velocity = move_and_slide(velocity, Vector2(0, -1))
