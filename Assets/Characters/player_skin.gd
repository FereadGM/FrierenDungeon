class_name SophiaSkin extends Node3D

@onready var animation_tree = %AnimationTree
@onready var state_machine : AnimationNodeStateMachinePlayback = animation_tree.get("parameters/StateMachine/playback")
@onready var move_tilt_path : String = "parameters/StateMachine/Move/tilt/add_amount"

var run_tilt = 0.0 : set = _set_run_tilt

func _set_run_tilt(value : float):
	run_tilt = clamp(value, -1.0, 1.0)
	animation_tree.set(move_tilt_path, run_tilt)

func idle():
	state_machine.travel("Idle")

func move():
	state_machine.travel("Running_A")

func fall():
	state_machine.travel("Jump_Land")

func jump():
	state_machine.travel("Jump_Full_Short")
