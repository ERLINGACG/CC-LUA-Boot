---@class GoggleLinkPort
---@TYPE  goggle_link_port

PERIPHERAL=require("class/Peripheral")
GoggleLinkPort={}
setmetatable(GoggleLinkPort,{__index=PERIPHERAL})
---@ClassFunction
function GoggleLinkPort:new(size,type,id)
    local Gog=setmetatable(PERIPHERAL:new(size,type,id),GoggleLinkPort)
    self.__index=self
    Gog.test="GoggleLinkPort load success"
    return Gog
end

---@ClassFunction
function GoggleLinkPort:GetConnected()
    return self.Peripheral.getConnected()
end

return GoggleLinkPort