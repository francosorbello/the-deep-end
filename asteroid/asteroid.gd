extends Node3D

var fuel_amount : float = randi_range(30,100) 
var already_interacted = false

func can_interact():
    return not already_interacted

func interact(_rigid_player : RigidPlayer):
    ExpeditionManager.current_expedition.add_fuel(fuel_amount)
    pass