extends Node

func _ready() -> void:
    var loadingSuccess = get_tree().change_scene('res://src/ui/main/main.tscn');
    if(loadingSuccess != OK):
        push_error(loadingSuccess);
