
PER = require("../peripheral/peripheral1")
IMP = require("../library/Imp1")
LIB_1 = require("../library/lib1")

local table_funcname={
    "setSpeed"
}
E_Motor_R = PER.Peripheral1
E_Motor_L = PER.Peripheral2

--- @Test
Ife0=IMP.Driver_ife0()

function T_mian()
    -- print("Hello, world!")
    -- print("E_Motor_L: ", E_Motor_L)
    -- print("E_Motor_R: ", E_Motor_R)

    LIB_1.Call(IMP.Driver_ife0(),E_Motor_L,table_funcname[1],0)
    LIB_1.Call(IMP.Driver_ife0(),E_Motor_R,table_funcname[1],0)
    print("over")
end

T_mian()