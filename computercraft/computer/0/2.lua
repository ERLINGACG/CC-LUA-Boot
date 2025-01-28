P1=require("class/Peripheral")
P2=require("class/EngineControlUnit")
P3=require("class/Ethernet")
local p=P1:new("front",nil,nil)
local e=P2:new(nil,"EngineController",nil)
local c=P3:new("front",nil,nil)
c:FIND()
e:FIND()
print(e:GetRotation())
for index, value in pairs(e:GetRotation()) do
    print(index, value)
end
 t=c:GETPERIPHELIST()
 for index, value in ipairs(t) do
     print(index, value)
 end

-- c:FIND()
-- print(c:GETNAME())
-- print(c:GETPERIPHELIST())
-- t=c:GETPERIPHELIST()
-- for index, value in ipairs(t) do
--     print(index, value)
-- end

-- -- print(p.Peripheral)
-- print(p.TYPE)
-- print(e.TYPE)
-- print(e:FIND())
-- print(p:FIND())
-- print(p:GETNAME())
-- print(e:GETNAME())
-- print(p:GETFUNCTIONLIST())
-- for index, value in pairs(e:GETFUNCTIONLIST()) do
--     print(index, value)
-- end





