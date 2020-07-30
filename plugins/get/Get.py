# Extra plugin downloaded from https://github.com/wizguin/slippers-plugins
from world.dataHandler.pluginManager.Plugin import Plugin

class Get(Plugin):
    """
    A plugin that enables handling of get packets,
    found on Club Penguin version 130.
    """

    def __init__(self, users, config, packet):
        super(Get, self).__init__(users, config, packet)

    def get_inventory(self, data, user):
        user.send(["gi", "-1", "%".join(map(str, user.inventory))])
