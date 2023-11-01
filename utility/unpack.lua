local unpack,get

function get(table,count,lasIndex)
    local index,v = next(table,lasIndex)
    if count == 0 then
        return v
    else
        return v,get(table,count-1,index)
    end
end

function unpack(table)
    local count = #table
    if count == 0 then
        return nil
    else
        return get(table,count-1,nil)
    end
end

return unpack