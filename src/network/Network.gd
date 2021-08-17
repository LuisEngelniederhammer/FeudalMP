extends Node

func _ready() -> void:
    var arguments = {}
    for argument in OS.get_cmdline_args():
        if argument.find("=") > -1:
            var key_value = argument.split("=")
            arguments[key_value[0].lstrip("--")] = key_value[1]
    var isServer = arguments.has('server');

    if(isServer):
        Server.start();
    else:
        Client.start();

func eventConnectionSucceeded() -> void:
    Logger.info('Connection success');
    $Authentication.tryAuthenticateClient('test', 'test');

func eventConnectionFailed() -> void:
    Logger.info('Connection failed');

func eventPeerConnected(id:int) -> void:
    Logger.info('Peer %d connected' % id);

func eventPeerDisconnected(id:int) -> void:
    Logger.info('Peer %d disconnected' % id);
