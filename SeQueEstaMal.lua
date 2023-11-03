local Cube = require("utility.Cube")
local loop

local f = io.open("shader.glsl","r")
local shadContent = f:read("a")
f:close()
local shader = love.graphics.newShader(shadContent)

local cube = Cube.new(0,0,love.graphics.getWidth(),love.graphics.getHeight())
loop = function ()
    love.graphics.setShader(shader)
    cube:draw()
    love.graphics.setShader()
end

return loop