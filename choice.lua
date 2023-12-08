local class = require("libs.middleclass")

---@class Choice
local Choice = class("Choice")

function Choice:initialize(destination, description, condition, routine)
    self.destination = destination ---@type string
    self.description = description ---@type string
    self.condition = condition ---@type fun():boolean
    self.routine = routine ---@type function
end

function Choice:hasCondition()
    return self.condition ~= nil
end

function Choice:runCondition()
    if self.condition ~= nil and type(self.condition) == "function" then
        return self.condition()
    end
    return true
end

function Choice:runRoutine()
    if self.routine ~= nil and type(self.routine) == "function" then
        self.routine()
    end
end

return Choice