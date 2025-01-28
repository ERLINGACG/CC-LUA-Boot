---@class PERIPHERAL
---@Object 作为祖先类，所有Peripheral类的父类                                   

PERIPHERAL = {}
--- @ClassNew
function PERIPHERAL:new(size, type, id)     --构造函数

    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.SIZE = size
    obj.TYPE = type
    obj.ID = id
    obj.Peripheral=nil
    obj.PeripheralName=nil
    return obj
end

---@ClassFunction
function PERIPHERAL:FIND()                 -- 找到外设
    if self.TYPE ~= nil then
            self.Peripheral = peripheral.find(self.TYPE)
            return self.Peripheral

    elseif self.SIZE~=nil and self.ID==nil and self.TYPE==nil then
            self.Peripheral = peripheral.wrap(self.SIZE)
            return self.Peripheral

    elseif self.SIZE~=nil and self.ID==nil and self.TYPE~=nil then

            self.Peripheral = peripheral.find(self.TYPE)
            return self.Peripheral
    else
          error("No peripheral type or size specified")
    end
end

--- @ClassFunction
function PERIPHERAL:GETNAME()             -- 获取外设名称
    self.PeripheralName = peripheral.getName(self.Peripheral)
    return self.PeripheralName
end

--- @ClassFunction
function PERIPHERAL:GETFUNCTIONLIST()     -- 获取外设功能列表
    return peripheral.getMethods(self.PeripheralName)
end

return PERIPHERAL
