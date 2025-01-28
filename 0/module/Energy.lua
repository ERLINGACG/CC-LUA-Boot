Ethernet=require("class/Ethernet")
ethernet=Ethernet:new("front",nil,nil)
ethernet:FIND()
function GetEnergyFilledPercentage()
    local EnergyValue=0
    local count=0
    for index, value in pairs(ethernet:GETPERIPHELIST()) do
        local function GetE()
            return ethernet:CALL(value,"getEnergyFilledPercentage")
        end
        local status,result=pcall(GetE)
        if status then
            count=count+1
            EnergyValue=result+EnergyValue
        end
        
    end
    if count==0 then
        return "EnergySystem is Error"
    end
    return EnergyValue/count*100
    
end
function Main()
    local status,result=pcall(GetEnergyFilledPercentage)
    return result
end

return Main()
