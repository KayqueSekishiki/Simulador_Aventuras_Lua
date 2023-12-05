local class = require("libs.middleclass")

---@class Choice
local Choice = class("Choice")

function Choice:initialize(id)
    self.description = nil ---@type string
    self.destination = nil ---@type string
    self.codition = nil
end

function Choice:hasCondition()
    return self.codition ~= nil
end

function Choice:runCondition()
    return true
end

return Choice