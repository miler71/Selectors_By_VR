extends Node

signal down()
signal up()
signal has_a_node_changed(is_on: bool)
signal array_status(array: Array[Node3D])

@export var observed_area: Area3D
@export var node_in_zone: Array[Node3D]
@export var has_a_node:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	observed_area.area_entered.connect(enter_area)
	observed_area.area_exited.connect(exit_area)
	observed_area.body_entered.connect(enter_body)
	observed_area.body_exited.connect(exit_body)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _refresh():
	var previous_as_a_node :bool = has_a_node
	has_a_node = node_in_zone.size() > 0
	var changed = has_a_node != previous_as_a_node
	if changed : 
		has_a_node_changed.emit(has_a_node)
		
		if has_a_node == true: 
			down.emit()
		else:
			up.emit()
	array_status.emit(node_in_zone)
	#signal down()
	#signal up()
	#signal has_a_node_changed(is_on: bool)
	#signal array_status(array: Array[Node3D])


func  enter_area(area: Area3D):
	if not area in node_in_zone:
		node_in_zone.append(area)
		print(area)
		_refresh()
	
func  exit_area(area: Area3D):
	node_in_zone.erase(area)
	print(area)
	_refresh()
	
func  enter_body(body: Node3D):
	if not body in node_in_zone:
		node_in_zone.append(body)
		print(body)
		_refresh()
		
	
func  exit_body(body: Node3D):
	node_in_zone.erase(body)
	print(body)
	_refresh()
	
