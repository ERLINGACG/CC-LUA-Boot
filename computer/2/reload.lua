function t1()
    local C2=peripheral.wrap("back")
    local t1=require("debug/debug2")
    local t2=require("driver/driver1")
    local c1=require("library/lib1")

-- t1.getfuncname()
-- t1.getplist()
    local func1="setSpeed"
    c1.Call(C2,t2.Peripheral1,func1,100)
end

-- t2=require()
--- @Test
local t2=require("library/Imp1")

--- @Test
local t3=require("bios/bios")


--- @diagnostic disable-next-line: missing-parameter
local C3=peripheral.getName(t2.Driver_ife0())
local C4=peripheral.getMethods(C3) 
for index, value in pairs(C4) do
    print(index, value)
end