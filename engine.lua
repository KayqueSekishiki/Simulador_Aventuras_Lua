local class = require("libs.middleclass")
local ansicolorsx = require("libs.ansicolorsx")
local nodeLoader = require("node_loader")
local utils = require("utils")

---@class Engine
local Engine = class("Engine")

function Engine:initialize()

end

local function print(...)
    _G.print(ansicolorsx(...))
end

local function iowrite(...)
    io.write(ansicolorsx(...))
end

function Engine:runMainLoop()
    while not game.isOver do
        local node = game.activeNode

        utils.clearScreen()

        self:printNode(node)

        if node.gameOver then
            print()
            print("%{red}===== Game Over =====")
            print()
            os.exit()
        elseif node.gameWon then
            print()
            print("%{green}===== Você venceu o jogo! =====")
            print()
            os.exit()
        end

        local validChoices = self:getValidChoices(node)
        if #validChoices == 0 then
            warn("Nenhuma escolha válida para o node " .. node.id)
            os.exit()
        end

        self:showChoices(validChoices)

        local choiceIndex = self:askForInput(#validChoices)
        local choice = validChoices[choiceIndex]

        choice:runRoutine()

        local destinationId = choice.destination
        local destinationNode = nodeLoader.getNode(destinationId)
        game.activeNode = destinationNode
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

function Engine:getValidChoices(node)
    local result = {} ---@type Choice[]
    for _, choice in pairs(node.choices) do
        if (not choice:hasCondition()) or (choice:hasCondition() and choice:runCondition()) then
            table.insert(result, choice)
        end
    end
    return result
end

function Engine:showChoices(choices)
    for i, choice in pairs(choices) do
        print(string.format("%%{white}%d) %%{yellow}%s", i, choice.description))
    end
end

function Engine:askForInput(amount)
    while true do
        iowrite("> ")
        local answerString = io.read()
        local answer = tonumber(answerString)
        local isAnswerValid = answer ~= nil and answer >= 1 and answer <= amount
        if isAnswerValid then
            return answer
        end
        print("%{red}Resposta inválida, tente novamente.")
    end
end

return Engine
