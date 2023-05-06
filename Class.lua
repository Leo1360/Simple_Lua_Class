---@class Standard class used to create other classes
Class = {}

---Creates a new class
---@return table New Class
function Class:create(t)
    if(t == nil)then
        t = {}
    end
    setmetatable(t, getmetatable(self)) -- making the metatable inheritance
    for key, value in pairs(self) do
        t[key] = value
    end
    return t
end

---Extends a class
---@return table The mother class redy to be extended
function Class:extends(t)
    return self:create(t)
end

---Instaciate the class
---@return table A new instance of the class
function Class:instanciate(t)
    local t = self:create(t)
    t.create = nil
    t.instanciate = nil
    t.extends = nil
    t.new = nil
    return t
end

---Standard constructor: Returns a instance of the class. Can be overwitten
---@return table A new instance of the class
function Class:new() -- Contrutor padrão
    return self:instanciate()
    
end
 
---Merges a metatable to the metatable of a given table/class
---@param class table
---@param newMeta table
function addmetatable(class,newMeta)
    local classMeta = getmetatable(class)
    if(classMeta)then
        for key, value in pairs(newMeta) do
            classMeta[key] = value
        end
    else
        classMeta = newMeta
    end
    setmetatable(class,classMeta)
end