
Controller=require("class/tweaked_controller")
EngineControlUnit=require("class/EngineControlUnit")
Ethernet=require("class/Ethernet")
local engineControlUnit=EngineControlUnit:new(nil,"EngineController",nil)
local controller=Controller:new(nil,"tweaked_controller",nil)
local ethernet=Ethernet:new("front",nil,nil)
ethernet:FIND()
controller:FIND()
engineControlUnit:FIND()

function RELOAD_ETHERNET()
     print("----------------------------") 
     ethernet:TEST()
     print("search for a method:",ethernet:GETNAME())
     print("...")
     sleep(0.5)
     for index, value in pairs(ethernet:GETPERIPHELIST()) do
        print("FIND PERIPHERAL :",value)
        sleep(0.1)
    end
    print("---------------------------")
end
function RELOAD_CONTROLLER()
   
    print("search for a method:",controller:GETNAME())
    print("...")
    sleep(0.5)
    controller:TEST()
    print("...")
    print("RELOAD THE SUCCESSED !")
    print("---------------------------")
end

function RELOAD_ENGINECONTROLUNIT()
   
    print("search for a method:",engineControlUnit:GETNAME())
    print("...")
    sleep(0.5)
    engineControlUnit:TEST()
    print("...")
    sleep(0.5)
    print("RELOAD THE SUCCESSED !")
    print("---------------------------")
end

function Bios()
    print("SYSTEM RELOAD TIME:",os.date("%Y-%m-%d %H:%M:%S",os.time()))
    RELOAD_ETHERNET()
    RELOAD_CONTROLLER()
    RELOAD_ENGINECONTROLUNIT()
    print("SYSTEM RELOAD SUCCESSED !")
    print("SYSTEM RELOAD TIME:",os.date("%Y-%m-%d %H:%M:%S",os.time()))
end

return Bios