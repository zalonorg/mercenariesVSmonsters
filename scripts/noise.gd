extends Node

func make_noise(var source : Vector2, var strength : float, var array ):
#	var array = get_parent().get_children()
	for child in array:
		if child.has_method("hear_noise") and source.distance_to(child.position) <= strength:
			child.hear_noise(source)
