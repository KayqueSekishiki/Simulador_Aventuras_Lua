local class = require("libs.middleclass")
local ansicolorsx = require("libs.ansicolorsx")
local nodeLoader = require("node_loader")
local utils = require("utils")


---@class Engine
local Engine = class("Engine")

function Engine:initialize()
    
end

function Engine:runMainLoop()
    local node = game.activeNode

    while not game.isOver do
        
    end



end

local function createSeparator(title)
    local width = 50
    local result = "%{white}-----"
    local length = 5
    if title then
        result = string.format("%s[%%{yellow}%s%%{white}]", result, title:upper())
        length = length + 2 + title:len()
    end
    for i = length, width, 1 do
        result = result .. "-"
    end
    return result
end

function Engine:printNode(node)
    if node.header then
        print(node.header)
    elseif node.gameOver then
        print(utils.getGenericGameOverHeader())
    end
    print(createSeparator(node.title))
    print(node.description)
    print(createSeparator())
end

return Engine