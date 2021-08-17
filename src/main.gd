extends Node

func _ready() -> void:
    Logger.info('Starting FeudalMP');
    var loadingSuccess = get_tree().change_scene("res://ui/mainmenu/mainmenu.tscn");
    if(loadingSuccess != OK):
        push_error(loadingSuccess);
