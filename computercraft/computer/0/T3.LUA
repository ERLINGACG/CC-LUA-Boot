P=require("class/Peripheral")
P1=P:new("bottom",nil,nil)
P1:FIND()
P1:GETNAME()
T=P1:GETFUNCTIONLIST()

local file = io.open("function_list.txt", "w")
if file then
    for index, value in pairs(T) do
        file:write(index .. " " .. value)
    end
    file:close()
    print("ok")
else
    print("Error: unable to open file 'function_list.txt'")
end