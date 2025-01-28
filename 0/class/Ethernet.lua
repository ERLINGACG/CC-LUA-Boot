--- @Class Ethernet
--- @TYPE  
PERIPHERAL=require("class/Peripheral")

Ethernet = {}
setmetatable(Ethernet, {__index=PERIPHERAL})
function Ethernet:new(size, type, id)
   local ETH=setmetatable(PERIPHERAL:new(size, type, id), Ethernet)
   self.__index = self
   ETH.test="Ethernet load success "
   return ETH
end

--- @ClassFunction
function  Ethernet:TEST()
   print(self.test)
   print("PeripheralID:",self.Peripheral)
   
end

--- @ClassFunction
function  Ethernet:GETPERIPHELIST()
   return self.Peripheral.getNamesRemote()
end

--- @ClassFunction
--- @param PeripheralName string 外设名称
--- @param funname string 功能名称
--- @param ... 其他参数
function Ethernet:CALL(PeripheralName,funname,...)
   return self.Peripheral.callRemote(PeripheralName,funname,...)
end

return Ethernet