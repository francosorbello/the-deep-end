# @tool
extends Node3D
class_name ProceduralGenerator

@export_category("Spawn")
@export var objects_to_spawn : Array[PackedScene] = []
@export var min_spawn_amount : int = 10
@export var max_spawn_amount : int = 20

@export_category("Ring")
@export var ring_count : int = 5
@export var initial_ring_radius : float = 100
@export var ring_radius_increment : float = 100

var current_radius : float = initial_ring_radius

@export_category("Debug")
@export var start: bool:
    set(value):
        print("Seting start to ", value)
        onStart()

func onStart():
    print("Starting the procedural generator")
    create_ring()
    pass    

func _ready() -> void:
    if not Engine.is_editor_hint():
        onStart()

func create_ring():
    # create a container
    var ring = Node3D.new()
    ring.name = "Ring"
    ring.transform.origin = Vector3.ZERO
    print("Creating a ring")
    add_child(ring)
    var spawn_amount = randi_range(min_spawn_amount, max_spawn_amount)
    var angle_increment = 360 / spawn_amount
    for i in range(spawn_amount):
        # pick a random object and add it to the ring
        var object = objects_to_spawn.pick_random()
        var instance = object.instantiate()
        ring.add_child(instance)

        # set the position of the object inside a radius        
        var random_radius = randf_range(current_radius, current_radius + ring_radius_increment)
        var x_pos = cos(deg_to_rad(i * angle_increment)) * random_radius
        var z_pos = sin(deg_to_rad(i * angle_increment)) * random_radius
        var y_pos = randf_range(-30, 30)
        instance.global_position = Vector3(x_pos, y_pos, z_pos)
