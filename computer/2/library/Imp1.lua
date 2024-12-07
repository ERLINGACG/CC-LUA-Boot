-- 方法实现
Func_interface  = require("../driver/driver1")
PER             = require("../peripheral/peripheral1")  --加载外设库


D_IFE0=setmetatable({},{__index=Func_interface.Driver_Func1})

--- @implements  接口实现
--- @diagnostic disable-next-line: duplicate-set-field
function D_IFE0:Driver_ife0()

    Ife0=peripheral.wrap(PER.ife0)
    return Ife0
  
end

--- @implements  
--- @diagnostic disable-next-line: undefined-doc-name
--- @generic     Launch_per: 控制请求发起者, E_motor_id:电机ID, E_motor_funName: 电机功能名称, Params: 参数
function D_IFE0:Driver_electric_motor(Launch_per,E_motor_id,E_motor_funName,Params)

    return Call(Launch_per,E_motor_id,E_motor_funName,Params)
    
end

local DRIVER={

    Driver_ife0=D_IFE0.Driver_ife0,
    Driver_electric_motor=D_IFE0.Driver_electric_motor

}


return DRIVER