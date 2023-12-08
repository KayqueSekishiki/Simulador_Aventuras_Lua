local nodeLoader = {}

local nodeDictionary = {} ---@type table<string,Node>
local initialNode = nil ---@type Node
local hasErrors = false

local function loadNode(path)
    local success, nodeOrErr = pcall(function ()
       return require(path)
    end)

    if not success then
        warn ("falha ao carregar o node " .. path .. ". O arquivo não foi encontrado.")
        return 
    end

    local node = nodeOrErr ---@type Node
    if nodeDictionary[node.id] ~= nil then
        warn("Falha ao carregar o node " .. path .. ". O ID " .. node.id .. " já está registrado.")
        return
    end

    nodeDictionary[node.id] = node
end

function nodeLoader.loadNodes()
    nodeDictionary = {}

    initialNode = require("nodes.start")
    nodeDictionary[initialNode.id] = initialNode

    loadNode("nodes.liones.start")
    loadNode("nodes.nyx.start")

end

function nodeLoader.getNodes()
    return nodeDictionary
end

function nodeLoader.getNode(nodeId)
    return nodeDictionary[nodeId]
end

function nodeLoader.getInitialNode()
    return initialNode
end

function nodeLoader.hasErrors()
    return hasErrors
end

return nodeLoader