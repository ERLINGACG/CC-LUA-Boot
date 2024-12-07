local Peripheral1='electric_motor_0'       --- @Addressmode_Name --右边的电机
local Peripheral2='electric_motor_1'       --- @Addressmode_Name --左边的电机
local ife0       ='back'                   --- @Addressmode_Side --网卡的位置

return {
    ife0=ife0,                  -- 网卡
    Peripheral1=Peripheral1,    -- 右边电机
    Peripheral2=Peripheral2     -- 左边电机
}