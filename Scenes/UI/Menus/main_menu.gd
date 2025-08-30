extends Control

@onready var MainContainer : Control = %MainContainer
@onready var OptionsContainer : Control = %OptionsContainer
@onready var GlobalVolumeSlider : HSlider = %GlobalVolumeSlider
@onready var MusicVolumeSlider : HSlider = %MusicVolumeSlider
@onready var SfxVolumeSlider : HSlider = %SfxVolumeSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	ShowMainContainer()
	GlobalVolumeSlider.value = SETTINGS.global_volume
	MusicVolumeSlider.value = SETTINGS.music_volume
	SfxVolumeSlider.value = SETTINGS.sfx_volume
	


func _on_start_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Levels/main.tscn")


func _on_options_button_button_down():
	ShowOptionsContainer()

func _on_exit_button_button_down():
	get_tree().quit()

func ShowOptionsContainer():
	MainContainer.visible = false;
	OptionsContainer.visible = true;
	
func ShowMainContainer():
	MainContainer.visible = true;
	OptionsContainer.visible = false;


func _on_option_return_button_button_down():
	ShowMainContainer();


func _on_global_volume_slider_value_changed(value):
	SETTINGS.global_volume = value;
	print(SETTINGS.global_volume);

func _on_music_volume_slider_value_changed(value):
	SETTINGS.music_volume = value;
	print(SETTINGS.music_volume);
	
func _on_sfx_volume_slider_value_changed(value):
	SETTINGS.sfx_volume = value;
	print(SETTINGS.sfx_volume);
