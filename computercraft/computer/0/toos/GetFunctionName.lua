
--- @class Peripheral
local Peripheral={}
Peripheral.__index= Peripheral       --设置元表索引
  
function Peripheral:new(Size,Type)  --创建新的Peripheral对象    


    self.Size = Size
    self.Type = Type
    return self
end

function Peripheral:getSize()       --从方位获取外设

        if self.Size== nil then
            return nil
        end
        return peripheral.wrap(self.Size)
        
end

function Peripheral:getType()       --从类型获取外设

        if self.Type== nil then
            return nil
        end

        return peripheral.find(self.Type)
    
   

end

function Peripheral:getPeripheralName()  --获取外设名字

    if  self.Size== nil then

        PER_NAME=peripheral.getName(Peripheral:getType())

    elseif self.Type== nil then

        PER_NAME= peripheral.getName(Peripheral:getSize())

    elseif not self.Size== nil and not self.Type== nil  then
   
        PER_NAME= peripheral.getName(Peripheral:getType())

    end
    return  PER_NAME

end

function Peripheral:getFunction()  --从外设获取方法

        return peripheral.getMethods(Peripheral:getPeripheralName())


end

function  Peripheral:interface()  --Peripheral接口
    
end

return Peripheral