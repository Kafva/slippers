import json
import sys

from Server import Server
from world.DataHandler import DataHandler
from world.Database import Database

def print_flush(_str):
    # For stdout redirection logging to work we need to flush stdout
    print(_str, flush=True)


class World(Server):
    """
    Creates a Club Penguin game world.
    """

    def __init__(self, world_id, config):
        print_flush("[World] Starting world {}".format(world_id))

        self.users = []
        self.db = Database(config)
        self.handler = DataHandler(self.users)

        # Start server
        super(World, self).__init__(config, world_id, self.users, self.db, self.handler)


def main():
    file = open("config/config.json", "r")
    config = json.loads(file.read())
    World(sys.argv[1], config)


if __name__ == "__main__":
    main()
