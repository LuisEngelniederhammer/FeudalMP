extends Node

enum LOG_LEVEL { 
    DEBUG, 
    INFO, 
    WARN, 
    ERROR
    }

func debug(msg:String) -> void:
    write(LOG_LEVEL.DEBUG, msg);

func info(msg:String) -> void:
    write(LOG_LEVEL.INFO, msg);

func warn(msg:String) -> void:
    write(LOG_LEVEL.WARN, msg);

func error(msg:String) -> void:
    write(LOG_LEVEL.ERROR, msg);

func write(logLevel: int, msg: String) -> void:
    printDelegate('[%s] [%s] [%s] - %s' % [getDateTimeFormatted(), getNetworkAuthorityFormatted(), getLogLevelFormatted(logLevel), msg]);

func getDateTimeFormatted() -> String:
    var dateTimeDict = OS.get_datetime()
    return (
        '%d.%d.%d - %d:%d:%d'
        % [
            dateTimeDict['day'],
            dateTimeDict['month'],
            dateTimeDict['year'],
            dateTimeDict['hour'],
            dateTimeDict['minute'],
            dateTimeDict['second']
        ]
    )

func getLogLevelFormatted(i:int) -> String:
    return LOG_LEVEL.keys()[i];

func printDelegate(output:String) -> void:
    print(output);

func getNetworkAuthorityFormatted() -> String:
    if(!get_tree().has_network_peer()):
        return "None";
    return "Server" if get_tree().is_network_server() else "Client";
