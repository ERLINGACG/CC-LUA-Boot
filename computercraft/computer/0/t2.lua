Ethernet=require("class/Ethernet")

ethernet=Ethernet:new("front",nil,nil)
ethernet:FIND()
ethernet:GETNAME()
function test()
    return ethernet:GETPERIPHELIST()
end
function GetEng()
    for index, value in ipairs(ethernet:GETPERIPHELIST()) do
        local E=0
        local status,result=pcall(ethernet:CALL())
    end
end

local status,result=pcall(test)
if status then
    print(result)
else
    print(result)
end