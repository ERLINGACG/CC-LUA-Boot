---@class CannonMount
---@TYPE cbc_cannon_mount --炮架
PERIPHERAL=require("class/Peripheral")
CannonMount = {}
setmetatable(CannonMount, {__index = PERIPHERAL})

function CannonMount:new(size,type,id)
    local CAM=setmetatable(PERIPHERAL:new(size,type,id), {__index =CannonMount})
    self.__index = self
    CAM.test="CannonMount load success"
    return CAM
end

---@return number
function CannonMount:GetPitch() --获取火炮俯仰角度
    return self.Peripheral.getPitch()
end

---@return number
function CannonMount:GetYaw() --获取火炮偏航角度
    return self.Peripheral.getYaw()
end

function CannonMount:SetPitch(angle) --开火
    self.Peripheral.setPitch(angle)
end
function CannonMount:SetYaw(angle) --开火
    self.Peripheral.setYaw(angle)
end

return CannonMount