local Color = {}
Color.__index = Color

function Color.new(a,b,c,d)
    local self = {
        a = a or 1,
        b = b or 1,
        c = c or 1,
        d = d or 1
    }

    setmetatable(self,Color)
    return self
end

function Color:get()
    return self.a,self.b,self.c,self.d
end

return Color