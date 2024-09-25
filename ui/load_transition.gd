extends ColorRect

var _fade_duration : float = 1.0

func fade_in():
    var tween = get_tree().create_tween()
    return tween.tween_property(self,"color", Color(0,0,0,1), _fade_duration)


func fade_out():
    var tween = get_tree().create_tween()
    return tween.tween_property(self,"color", Color(0,0,0,0), _fade_duration)
