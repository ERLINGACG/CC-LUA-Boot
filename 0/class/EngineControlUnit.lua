--- @Class EngineControlUnit
--- @TYPE  EngineController
PERIPHERAL=require("class/Peripheral")
EngineControlUnit = {}
setmetatable(EngineControlUnit, {__index=PERIPHERAL})

function EngineControlUnit:new(size, type, id)
    local ENG=setmetatable(PERIPHERAL:new(size, type, id), EngineControlUnit)
    self.__index = self
    ENG.test="EngineController load success"
    return ENG
    
end

--- @ClassFunction 
function EngineControlUnit:TEST()
    print(self.test)
    print("PeripheralID:",self.Peripheral)
end

--- @ClassFunction 
function EngineControlUnit:GetShipName()
    return self.Peripheral.getName()
end

--- @ClassFunction 
function EngineControlUnit:GetShipID()
    return self.Peripheral.getId()
end

--- @ClassFunction 
function EngineControlUnit:GetShipMass()
    return self.Peripheral.getMass()
end
--- @ClassFunction 
function EngineControlUnit:GetShipPos()
    return self.Peripheral.getPosition()
end

--- @ClassFunction
--- @param Xpower number 施加的X方向力
--- @param Ypower number 施加的Y方向力
--- @param Zpower number 施加的Z方向力
function EngineControlUnit:ApplyRotDependentForce(Xpower,Ypower,Zpower) --施加某个方向的恒力
    self.Peripheral.applyRotDependentForce(Xpower,Ypower,Zpower)
end

--- @ClassFunction 
--- @param Xpower number 施加的X方向力矩
--- @param Ypower number 施加的Y方向力矩
--- @param Zpower number 施加的Z方向力矩
function EngineControlUnit:ApplyRotDependentTorque(Xpower,Ypower,Zpower) --施加某个方向的恒力矩
    self.Peripheral.applyRotDependentTorque(Xpower,Ypower,Zpower)
end

--- @ClassFunction 
--- @return table 获得当前的姿态信息
function EngineControlUnit:GetRotation()
    Matrix= self.Peripheral.getRotationMatrix()
    yaw = math.deg(math.atan2(Matrix[1][3], Matrix[3][3]))
    pitch = math.deg(math.atan2(Matrix[2][1], Matrix[2][2]))
    roll = math.deg(math.atan2(Matrix[2][3], Matrix[2][2]))
    return {yaw=yaw,pitch=pitch,roll=roll}
end

--- @ClassFunction 
--- @return table 获得当前的速度信息
function EngineControlUnit:GetVelocity()
    return self.Peripheral.getVelocity()
end


return EngineControlUnit