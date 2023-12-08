local nodeLoader = {}
local nodeDictionary = {} ---@type table<string,Node>
local initialNode = nil ---@type Node
local hasErrors = false


local function loadNode(path)
    local success, nodeOrErr = pcall(function()
        return require(path)
    end)
    if not success then
        warn("Falha ao carregar o node " .. path .. ". O arquivo não foi encontrado.")
        hasErrors = true
        return nil
    end
    local node = nodeOrErr ---@type Node
    if nodeDictionary[node.id] ~= nil then
        warn("Falha ao carregar o node " .. path .. ". O ID " .. node.id .. " já está registrado.")
        hasErrors = true
        return nil
    end
    nodeDictionary[node.id] = node
    return node
end

---@param parentNode  Node
local function loadNodesFromChoices(parentNode)
    for _, choice in pairs(parentNode.choices) do
        local destinationId = choice.destination
        if not nodeDictionary[destinationId] then
            local childNode = loadNode("nodes." .. destinationId)
            if childNode then
                loadNodesFromChoices(childNode)
            end
        end
    end
end

function nodeLoader.loadNodes()
    nodeDictionary = {}

    initialNode = require("nodes.start")
    nodeDictionary[initialNode.id] = initialNode

    loadNodesFromChoices(initialNode)

    for id, node in pairs(nodeDictionary) do
        for _, choice in pairs(node.choices) do
            local destinationId = choice.destination
            local destinationNode = nodeDictionary[destinationId]
            if destinationNode == nil then
                warn(string.format("Uma das escolhas do node %s tem como destino um node inexistente: %s", node.id,
                    destinationId))
                hasErrors = true
            end
        end
    end
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
