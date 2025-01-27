

Controller = require("class/tweaked_controller")
EngineControlUnit = require("class/EngineControlUnit")


local engineControlUnit = EngineControlUnit:new(nil, "EngineController", nil)
local controller = Controller:new(nil, "tweaked_controller", nil)

controller:FIND()
engineControlUnit:FIND()


function ControllerModule()
    while true do
        if controller:GetAxis(1) == 1 then
            engineControlUnit:ApplyRotDependentTorque(-180000000, 0, 0)
        
        elseif controller:GetAxis(1) == -1 then
            engineControlUnit:ApplyRotDependentTorque(180000000, 0, 0)
        
        elseif controller:GetAxis(2) == -1 then
            engineControlUnit:ApplyRotDependentTorque(0, 0, 180000000)
        
        elseif controller:GetAxis(2) == 1 then
            engineControlUnit:ApplyRotDependentTorque(0, 0, -180000000)
        
        elseif controller:GetAxis(5) == 1 then
            engineControlUnit:ApplyRotDependentForce(-28000000, 0, 0)
        end
        os.sleep(0.1)
    end
end

return ControllerModule
