print("Hello, World!")
UILib=require("E:\\MK\\BBCF\\1.20.1plus\\versions\\1.20.1-Forge_47.2.21\\saves\\飞机世界8\\computercraft\\computer\\0\\LIBS\\GUI\\UILib.lua")
-- Controller=require("class/tweaked_controller")
-- EngineControlUnit=require("class/EngineControlUnit")
-- local engineControlUnit=EngineControlUnit:new(nil,"EngineController",nil)
-- local controller=Controller:new(nil,"tweaked_controller",nil)

-- controller:FIND()
-- engineControlUnit:FIND()

-- function Test()
--     controller:TEST()
--     engineControlUnit:TEST()
-- end
-- function t1()
--     while true do
--         print(controller:GetUserPlayerUUID())
--         print(controller:GetAxis(1))
--         print(controller:GetAxis(2))
        
--         os.sleep(1)
--     end
-- end
-- function t2()
--     print(engineControlUnit:GetShipID())
--     print(engineControlUnit:GetShipName())
--     print(engineControlUnit:GetShipMass())

-- end
-- function T3()
--     while true do
--         if controller:GetAxis(1) ==1  then
--             engineControlUnit:ApplyRotDependentTorque(-180000000,0,0)
--         end
--         if controller:GetAxis(1) ==-1  then
--             engineControlUnit:ApplyRotDependentTorque(180000000,0,0)
--         end
--         if controller:GetAxis(2) ==-1  then
--             engineControlUnit:ApplyRotDependentTorque(0,0,180000000)
--         end
--         if controller:GetAxis(2) ==1  then
--             engineControlUnit:ApplyRotDependentTorque(0,0,-180000000)
--         end
--         if controller:GetAxis(5)==1  then
--             engineControlUnit:ApplyRotDependentForce(-28000000,0,0)
--         end
--         os.sleep(0.1)
--     end
-- end
-- Test()
--  T3()
-- -- t1()
--  t2()