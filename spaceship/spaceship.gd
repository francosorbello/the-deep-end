extends Node3D

var food_amount : float = randi_range(30,100)
var fuel_amount : float = randi_range(0,30)

var already_interacted = false
@export var current_expedition : Expedition

func _ready():
    # randomize rotation
    # $Model.rotate(Vector3(0, 1, 0), randf() * 2 * PI)
    pass

func can_interact():
    return not already_interacted

func interact(_rigid_player : RigidPlayer):
    current_expedition.add_food(food_amount)
    current_expedition.add_fuel(fuel_amount)
    already_interacted = true
    pass

func enable_highlight():
    $Model.material_override.albedo_color = Color("a6a6a6")

func disable_highlight():
    $Model.material_override.albedo_color = Color.WHITE
