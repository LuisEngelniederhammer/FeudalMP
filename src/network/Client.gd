extends Node

const SETTING_PATH = 'feudalmp/network/server/'

var networkInstance;
var port;

func start() -> void:
    Logger.info("Starting Client");
    readConfiguration();
    networkInstance = NetworkedMultiplayerENet.new();
    networkInstance.create_client("127.0.0.1", port);
    get_tree().network_peer = networkInstance;
    
    networkInstance.connect("connection_succeeded", Network, "eventConnectionSucceeded");
    networkInstance.connect("connection_failed", Network, "eventConnectionFailed");

func readConfiguration() -> void:
    port = ProjectSettings.get_setting(SETTING_PATH + 'port');
    
