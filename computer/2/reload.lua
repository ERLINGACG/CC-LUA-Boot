local C2=peripheral.wrap("back")
local t1=require("debug.debug2")
local t2=require("driver.driver1")
local c1=require("library.lib1")

-- t1.getfuncname()
-- t1.getplist()
local func1="setSpeed"
c1.Call(C2,t2.Peripheral1,func1,100)
