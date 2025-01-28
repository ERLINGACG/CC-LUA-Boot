---@class Controller
---@TPYE  tweaked_controller
PERIPHERAL=require("class/Peripheral")
Controller = {}
Controller._index = Controller
setmetatable(Controller, {__index = PERIPHERAL})         -- 继承PERIPHERAL的构造函数

function Controller:new(size, type, id)
    local CONT=setmetatable(PERIPHERAL:new(size, type, id), Controller)
    self.__index = self
    CONT.test="tweaked controller load success"
    CONT.userUUID=nil
    return CONT
end

--- @ClassFunction 
function Controller:GetUserPlayerUUID()                     -- 获取玩家UUID
    self.userUUID=self.Peripheral.getUserUUID()             -- 一定要FIND后再使用
    return self.userUUID
end

--- @ClassFunction 
--- @param index number 按键索引
--- @return      boolean 按键状态
function Controller:GetButton(index)                    -- 获取按键
    return self.Peripheral.getButton(index)
end

--- @ClassFunction
--- @param index number 轴索引
--- @return      number 轴状态
function Controller:GetAxis(index)                     -- 获取轴
    return self.Peripheral.getAxis(index)
end

--- @test
function Controller:TEST()
    print(self.test)
    print("PeripheralID:",self.Peripheral)
end


return Controller
