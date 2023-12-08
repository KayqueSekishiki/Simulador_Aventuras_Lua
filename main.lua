local GameData = require("game_data")
local nodeLoader = require("node_loader")

warn("@on")

local gameData = GameData:new()
_G.game = gameData

nodeLoader.loadNodes()

for id, node in pairs (nodeLoader.getNodes()) do
    print(id .. node.title)
end

local initialnode = nodeLoader.getInitialNode()
print(initialnode.id .. initialnode.description)