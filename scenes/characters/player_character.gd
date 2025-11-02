extends CharacterBody2D

const SPEED := 100

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.lerp(Vector2.ZERO, delta * 15.0) # The '15.0' controls the deceleration rate.

	move_and_slide()
