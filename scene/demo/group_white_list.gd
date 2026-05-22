class_name GroupWhiteList
extends Node

signal  filtered_nodes(array: Array[Node3D])

@export var receive_node: Array [Node3D]
@export var result_node: Array [Node3D]
@export var allow_group: String




func push_in_nodes(array: Array[Node3D]):
	receive_node = array
	result_node.clear()
	for n in array:
		if n.is_in_group(allow_group):
			result_node.append(n)
			
		
	filtered_nodes.emit(receive_node)
