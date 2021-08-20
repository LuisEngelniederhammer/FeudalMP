extends Node

const SETTING_PATH = 'feudalmp/network/server/'

var networkInstance;
var port;

func start(address:String, port:int) -> void:
    if(!isInputValid(address, port)):
        return;
        
    Logger.info("Starting Client on %s:%s" % [address, port]);
    readConfiguration();
    networkInstance = NetworkedMultiplayerENet.new();
    networkInstance.create_client(address, port);
    get_tree().network_peer = networkInstance;
    
    networkInstance.connect("connection_succeeded", Network, "eventConnectionSucceeded");
    networkInstance.connect("connection_failed", Network, "eventConnectionFailed");

func readConfiguration() -> void:
    port = ProjectSettings.get_setting(SETTING_PATH + 'port');
    
func isInputValid(address,port) -> bool:
    return ((address != null && !address.empty()) && (port != null && port > 9));
