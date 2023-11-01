local Vector2 = require("utility.Vector2")
local Color = require("utility.Color")

local Cube = {}
Cube.__index = Cube

function Cube.new(x,y,a,b,color)
    local self = {
        position = Vector2.new(x or 0,y or 0),
        size = Vector2.new(a or 100,b or 100),
        color = color or Color.new()
    }

    setmetatable(self,Cube)
    return self
end

function Cube:draw()
    love.graphics.setColor(self.color:get())
    local x,y = self.position:get()
    local a,b = self.size:get()
    love.graphics.rectangle("fill",x,y,a,b)
end

return Cube