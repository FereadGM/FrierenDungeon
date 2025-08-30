extends Control

@export var is_open : bool;
@onready var PauseContainer : Control = %PauseContainer
@onready var OptionsContainer : Control = %OptionsContainer
@onready var GlobalVolumeSlider : HSlider = %GlobalVolumeSlider
@onready var MusicVolumeSlider : HSlider = %MusicVolumeSlider
@onready var SfxVolumeSlider : HSlider = %SfxVolumeSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVolumeSlider.value = SETTINGS.global_volume
	MusicVolumeSlider.value = SETTINGS.music_volume
	SfxVolumeSlider.value = SETTINGS.sfx_volume
	ShowPauseContainer();
	CloseMenu();


func _on_resume_button_button_down():
	CloseMenu()


func _on_options_button_button_down():
	ShowOptionsContainer();


func _on_exit_button_button_down():
	get_tree().quit()

func OpenMenu():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE;
	is_open = true;
	visible = true;
	
func CloseMenu():
	ShowPauseContainer();
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED;
	is_open = false;
	visible = false;

func ShowOptionsContainer():
	PauseContainer.visible = false;
	OptionsContainer.visible = true;
	
func ShowPauseContainer():
	PauseContainer.visible = true;
	OptionsContainer.visible = false;


func _on_option_return_button_button_down():
	ShowPauseContainer();


func _on_global_volume_slider_value_changed(value):
	SETTINGS.global_volume = value;
	print(SETTINGS.global_volume);

func _on_music_volume_slider_value_changed(value):
	SETTINGS.music_volume = value;
	print(SETTINGS.music_volume);
	
func _on_sfx_volume_slider_value_changed(value):
	SETTINGS.sfx_volume = value;
	print(SETTINGS.sfx_volume);
