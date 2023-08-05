---@class Standard class used to create other classes
Class = {}
setmetatable(Class,{__name = "Class",__isClass = true})

---Creates a new class
---@return table New Class
function Class:create(name,t)
    if(self ~= Class)then
    local err = debug.traceback("An object is not allowed to Create a class")
        error(err)
        return nil
    end
    local obj = {}
    obj.attributes = t
    setmetatable(obj,{__name = name,__isClass = true,__index = Class})
    --obj = table.clone(self,obj)
    return obj
end

---Extends a class
---@return table The mother class redy to be extended
function Class:extends(name,t)
    if(not getmetatable(self).__isClass)then
        local err = debug.traceback("An object is not allowed to use a Class\\Prototype Method")
            error(err)
            return nil
    end
    local obj = {}
    obj.attributes = t
    obj.attributes = table.clone(self.attributes,obj.attributes)

    setmetatable(obj,{__name = name,__isClass = true,__index = self})
    return obj
end

---Instaciate the class
---@return table obj A new instance of the class
function Class:instantiate()
    if(not getmetatable(self).__isClass)then
        local err = debug.traceback("An object is not allowed to use a Class\\Prototype Method")
            error(err)
            return nil
    end
    local obj = table.clone(self.attributes)
    local mt = {__index = self,__name = "Obj"..getmetatable(self).__name, __isClass = false}
    setmetatable(obj,mt)

    return obj
end

---Standard constructor: Returns a instance of the class. Can be overwitten
---@return table A new instance of the class
function Class:new() -- Contrutor padrão
    return self:instantiate()
    
end

---Adiciona metatabela a classe
---@param metaTable table
function Class:setMeta(metaTable)
    addmetatable(self,metaTable)
end

function Class:instanceOf(class)
    local mtSelf = getmetatable(self)
    local mtClass = getmetatable(class)
    if(mtClass)then
        return mtClass.__name == mtSelf.__name
    end
    return false
end

-----------Funções auxiliares-------------------
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

---Removes a methaargument from a class's metatable
---@param class any
---@param meta any
function removemetatable(class,meta)
    local classMeta = getmetatable(class)
    classMeta[meta] = nil
    setmetatable(class,classMeta)
end

function table.clone(tab,destine)
    if(destine == nil)then
        destine = {}
    end

    for key, value in pairs(tab) do
        destine[key] = value
    end
    return destine
end