extends Node2D

var grid := AStarGrid2D.new()
var cell_size := Vector2i(16, 16)
var grid_size: Vector2i

func _ready() -> void:
	initialize_grid()
	set_solid_cells()

func initialize_grid() -> void:
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	grid.size = grid_size
	grid.cell_size = cell_size
	grid.offset = cell_size / 2
	grid.default_estimate_heuristic = AStarGrid2D.HEURISTIC_OCTILE

	grid.update()

func set_solid_cells() -> void:
	var wall_cells: Array[Vector2i] = $Walls.get_used_cells()

	for cell in wall_cells:
		print(cell)
		if grid.is_in_boundsv(cell):
			grid.set_point_solid(cell)
			print(cell)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
