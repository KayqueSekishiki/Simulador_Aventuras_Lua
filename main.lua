local GameData = require("game_data")
local Engine = require("engine")
local nodeLoader = require("node_loader")
local utils = require("utils")

warn("@on")

utils.enableUtf8()

local gameData = GameData:new() ---@type GameData
_G.game = gameData

nodeLoader.loadNodes()
game.activeNode = nodeLoader.getInitialNode()

if nodeLoader.hasErrors() then
    print("Found errors on NodeLoader, aborting execution!")
    os.exit()
end

local engine = Engine:new() ---@type Engine
engine:runMainLoop()
