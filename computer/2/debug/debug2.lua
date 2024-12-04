local C2=peripheral.wrap("back")
local C3=peripheral.getName(C2)
local C4=peripheral.getMethods(C3)  -- 获取外设可用方法

--- @debug
function GegFuncName()              -- 定义函数
    for index, value in pairs(C4) do
        print(index, value)
    end
end

--- @debug
function GetPlist() 
    
    local test2=C2.getNamesRemote()
        print("---------")
        for index, value in pairs(test2) do
            print(index,value)
      
            
        end
end

return { 

    getfuncname = GegFuncName,
    getplist = GetPlist



}