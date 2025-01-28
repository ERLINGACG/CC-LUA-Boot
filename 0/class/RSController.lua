---@class RSController
---@TYPE  Create_RotationSpeedController
PERIPHERAL=require("class/Peripheral")
RSController = {}
setmetatable(RSController, {__index = PERIPHERAL})


function RSController:new(size,type,name)
    local RSC=setmetatable(PERIPHERAL:new(size,type,name), {__index = RSController})
    self.__index = self
    RSC.test="RSC load success"
    return RSC
end

---@ClassFunction 
---@param speed number  --转速
---@return nil
function RSController:SetTargetSpeed(speed)
    self.Peripheral.setTargetSpeed(speed)
end

---@ClassFunction 
---@return number  --转速
function RSController:GetTargetSpeed()
    return self.Peripheral.getTargetSpeed()
end

return RSController