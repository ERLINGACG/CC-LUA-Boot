Mode1=require("toos/GetFunctionName")
Mode2=require("toos/error")
Mode3=require("class/EngineControlUnit")

Error=Mode2:new()
SubE={}
SubE.__index=SubE


setmetatable(SubE, {__index=Error}) -- 继承Error的元表

GION_P=Mode1:new("front",nil)

function  SubE:ErrorInterface(funN)
    local start,result=pcall(funN)
    return start,result
end
function T1()
    t1=GION_P:getFunction()
    for index, value in pairs(t1) do
        print(index, value)
    end
   
end
print(SubE:ErrorInterface(T1))
-- EngineControlUnit (ECU)
-- for index, value in pairs(Mode1) do
--     print(index, value)
-- end