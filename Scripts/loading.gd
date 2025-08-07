extends Control
class_name LoadingScreen

signal scene_loaded(path: String)

@export var only_loading : bool

var path: String
var finished : bool = false
var progress_value := 0.0

@onready var progress_bar = %ProgressBar

func load(path_to_load: String):
	path = path_to_load
	ResourceLoader.load_threaded_request(path)

func _process(delta: float):
	if not path:
		return

	var progress = []
	var status = ResourceLoader.load_threaded_get_status(path, progress)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_IN_PROGRESS:
		progress_value = progress[0] * 100
		progress_bar.value = move_toward(progress_bar.value, progress_value, delta * 20)

	if status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED:
		progress_bar.value = move_toward(progress_bar.value, 100.0, delta * 150)
		if progress_bar.value >= 99:
			scene_loaded.emit(path)
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(path))

func _on_window_resize():
	size = get_viewport_rect().size
