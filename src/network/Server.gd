extends Node

const SETTING_PATH = 'feudalmp/network/server/'

var networkInstance;
var port;
var maxPlayers;

func start() -> void:
    Logger.info("Starting Server");
    readConfiguration();
    networkInstance = NetworkedMultiplayerENet.new();
    networkInstance.create_server(port, maxPlayers);
    get_tree().network_peer = networkInstance;
    
    networkInstance.connect("peer_connected", Network, "eventPeerConnected");
    networkInstance.connect("peer_disconnected", Network, "eventPeerDisconnected");

func readConfiguration() -> void:
    port = ProjectSettings.get_setting(SETTING_PATH + 'port');
    maxPlayers = ProjectSettings.get_setting(SETTING_PATH + 'max_players');
