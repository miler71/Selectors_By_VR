extends Node


func push_in_nodes(array: Array[Node3D]):
	var euler: Vector3= Vector3(randf()* 36, randf() * 360, randf() * 360)
	for n in array:
		n.rotate(euler.normalized(), randf() * 360)
		var childrens = get_all_nodes_in_childrens_recursive(n)
		for children in childrens:
			if children is MeshInstance3D: 
				print(children)
				var material: StandardMaterial3D= children.get_surface_override_material(0)
				if material:
					material.albdeo_color = Color(randf(), randf(), randf())





static func get_all_nodes_in_childrens_recursive(node:Node)->Array[Node]:
	var nodes:Array[Node] = []
	var queue:Array[Node] = [node]
	
	while queue.size() > 0:
		var current = queue.pop_front()
		for child in current.get_children():
			nodes.append(child)
			queue.append(child)	
	return nodes
