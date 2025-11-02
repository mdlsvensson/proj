extends StaticBody2D

enum States {
	OPEN,
	CLOSED
}

var state: States:
	get:
		return state
	set(value):
		state = value

		match value:
			States.OPEN:
				$AnimationPlayer.play("open")


			States.CLOSED:
				$AnimationPlayer.play("open", -1, 1, true)

func _ready() -> void:
	state = States.OPEN

func _process(delta: float) -> void:
	pass
