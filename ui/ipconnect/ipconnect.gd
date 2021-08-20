extends Control

onready var addressInput = $CenterContainer/VBoxContainer/HBoxContainer/addressInput;
onready var portInput = $CenterContainer/VBoxContainer/HBoxContainer/portInput;
onready var usernameInput = $CenterContainer/VBoxContainer/usernameInput;
onready var passwordInput = $CenterContainer/VBoxContainer/passwordInput;

func onButtonPressed() -> void:
    if(!isInputValid()):
        #TODO mising sanitizing
        return;
    var port = 1991;
    if(portInput.text != null && !portInput.text.empty()):
        port = portInput.text.to_int();
        
    Client.start(addressInput.text, port);
    pass 

func isInputValid() -> bool:
    return addressInput.text != null || !addressInput.text.empty();
