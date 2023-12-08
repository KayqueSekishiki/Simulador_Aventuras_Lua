local GameData = require("game_data")
local Engine = require("engine")
local nodeLoader = require("node_loader")

warn("@on")

local gameData = GameData:new()
_G.game = gameData

nodeLoader.loadNodes()

for id, node in pairs (nodeLoader.getNodes()) do
    print(id .. node.title)
end

local engine = Engine:new() ---@type Engine
engine:runMainLoop()