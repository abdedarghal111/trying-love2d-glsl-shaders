local Vector2 = {}
Vector2.__index = Vector2

function Vector2.new(x,y)
    local self = {
        x = x or 0,
        y = y or 0
    }
    
    setmetatable(self,Vector2)
    return self
end

function Vector2:get()
    return self:getX(),self:getY()
end

function Vector2:set(x,y)
    self:setX(x)
    self:setY(y)
end


function Vector2:getX()
    return self.x
end

function Vector2:getY()
    return self.y
end

function Vector2:setX(x)
    self.x = x
end

function Vector2:setY(y)
    self.y = y
end

function Vector2.__add(a,b)
    return Vector2.new(a:getX()+b:getX(),a:getY()+b:getY())
end

function Vector2.__sub(a,b)
    return Vector2.new(a:getX()-b:getX(),a:getY()-b:getY())
end

function Vector2.__unm(a)
    return Vector2.new(-a:getX(),-a:getY())
end

function Vector2.__mul(a,b)
    return Vector2.new(a:getX()*b,a:getY()*b)
end

function Vector2.__div(a,b)
    if b == 0 then error("dividiendo sobre 0 imposible") end
    return Vector2.new(a:getX()/b,a:getY()/b)
end

function Vector2.__eq(a,b)
    if a:getX() == b:getX() and b:getY() == a:getY() then
        return true
    else
        return false
    end
end

function Vector2.__tostring(a)
    return "("..a:getX()..","..a:getY()..")"
end


return Vector2