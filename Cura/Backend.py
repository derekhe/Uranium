##      Base class for any backend communication (seperate piece of software)
class Backend(object):
    def __init__(self):
        super(Backend, self).__init__() # Call super to make multiple inheritence work.
        self._supported_commands = {}
        self._socket = None
    
    ##  Get a list of supported commands of this backend instance.
    #   \returns List of Command objects
    def getSupportedCommands(self):
        return self._supported_commands
    
    ##  Add a command to be supported
    #   \param command The Command to be supported
    def addSupportedCommand(self,command):
        pass