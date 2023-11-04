local Cube = require("utility.Cube")
local Color = require("utility.Color")
local fuego = {
    fuegos = {}
}

local shaderStr = [[
extern number screenWidth;
extern number screenHeight;
extern number lifetime;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
        number width = screen_coords.x/screenWidth;
        number height = screen_coords.y/screenHeight;
        number life = lifetime;
        number inverseLife = 1 - life;
        number random = rand(vec2(width,height));
        if(random < 0.5){random = 0.5;}
        return vec4(color.r,color.g + life,color.b + life,random*inverseLife);
}
]]
local shader = love.graphics.newShader(shaderStr)
shader:send("screenWidth",love.graphics.getWidth())
shader:send("screenHeight",love.graphics.getHeight())

function fuego:update(dt)
    if love.mouse.isDown(1) then
        local x,y = love.mouse.getX(),love.mouse.getY()
        self:createCube(x,y)
    end

    fuego:moveFuegos(dt)
end

local redColor = Color.new(255,0,0)
function fuego:createCube(x,y)
    table.insert(self.fuegos,Cube.new(x-25,y-25,50,50,redColor))
end

function fuego:moveFuegos(dt)
    local diference = 100*dt
    for i,v in pairs(self.fuegos) do
        local x,y = v:getPosition()
        v:setPosition(x,y-diference)
    end
end

function fuego:drawFuegos(shader)
    love.graphics.setShader(shader)
    for i,v in pairs(self.fuegos) do
        if v:getTimeActive() > 1 then
            table.remove(self.fuegos,i)
        else
            shader:send("lifetime",v:getTimeActive())
            v:draw()
        end 
    end
    love.graphics.setShader()
end

function fuego:draw()
    love.graphics.print("fps:"..love.timer.getFPS())
    self:drawFuegos(shader)
end

return fuego