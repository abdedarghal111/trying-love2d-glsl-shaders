local fuego = require("fuego")

function love.load()
    fuego = require("fuego")
end

function love.update(dt)
    fuego:update(dt)
end


function love.draw()
    fuego:draw()
end