extends Node3D

var fuel_amount : float = randi_range(30,100) 
var already_interacted = false
@export var current_expedition : Expedition

func can_interact():
    return not already_interacted

func interact(_rigid_player : RigidPlayer):
    current_expedition.add_fuel(fuel_amount)
    already_interacted = true
    pass

func enable_highlight():
    $Model.material_override.albedo_color = Color("a6a6a6")

func disable_highlight():
    $Model.material_override.albedo_color = Color.WHITE