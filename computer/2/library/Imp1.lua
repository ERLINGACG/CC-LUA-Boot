-- 方法实现
Func_tab=require("driver/driver1")
PER=require("peripheral/peripheral1")
Ife0=PER.ife0






D_IFE0=setmetatable({},{__index=Func_tab.Driver_Func1})

--- @implements  接口实现
--- @diagnostic disable-next-line: duplicate-set-field
function D_IFE0:Driver_ife0()
    Ife0=peripheral.wrap(Ife0)
    return Ife0
    -- print("Ife0:Driver_ife0")
end

local DRIVER={

    Driver_ife0=D_IFE0.Driver_ife0

}


return DRIVER