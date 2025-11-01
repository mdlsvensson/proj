extends CharacterBody2D

var grid := AStarGrid2D.new()
var cell_size := Vector2i(16, 16)
var grid_size: Vector2i
const SPEED := 100

func _ready() -> void:
	initialize_grid()

func initialize_grid() -> void:
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	grid.size = grid_size
	grid.cell_size = cell_size
	grid.offset = cell_size / 2
	grid.update()

var start = Vector2i.ZERO
var end = Vector2i(5, 5)

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.lerp(Vector2.ZERO, delta * 15.0) # The '15.0' controls the deceleration rate.

	move_and_slide()
