local class = require("libs.middleclass")

---@class Choice
local Choice = class("Choice")

function Choice:initialize(destination, description, condition)
    self.destination = destination ---@type string
    self.description = description ---@type string
    self.condition = condition
end

function Choice:hasCondition()
    return self.condition ~= nil
end

function Choice:runCondition()
    return true
end

return Choice