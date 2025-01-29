local EngineControlUnit=require("class/EngineControlUnit")
local UAV_Eng=EngineControlUnit:new("back",nil,nil)

UAV_Eng:FIND()


-- print("UAV_Eng_ID:",UAV_Eng_ID)
-- print("My_Pos_X:",My_Pos_X)
-- print("My_Pos_Y:",My_Pos_Y)
-- print("My_Pos_Z:",My_Pos_Z)


function Scanning()
    local My_Pos=UAV_Eng:GetShipPos()
    local My_Attitude=UAV_Eng:GetRotation()
    local UAV_Eng_ID=UAV_Eng:GetShipID()
    function T2()
        local ag=My_Attitude.yaw*-1
        if ag<0 then
            ag=360+ag
        end
        return ag
    end

    local My_Pos_X=My_Pos.x
    local My_Pos_Y=My_Pos.y
    local My_Pos_Z=My_Pos.z
    local Father_UAV_ID=49    -- 父级无人机ID
    for key, value in pairs(coordinate.getShips(250)) do
        if value.id==Father_UAV_ID then
            local Father_Pos_X=value.x
            local Father_Pos_Y=value.y
            local Father_Pos_Z=value.z

            local delta_X=Father_Pos_X-My_Pos_X
            local delta_Y=Father_Pos_Y-My_Pos_Y
            local delta_Z=Father_Pos_Z-My_Pos_Z
            
            local GoalYAW=math.atan2(delta_Z,delta_X)*180/math.pi
            local GoalPITCH=math.atan2(-delta_Y,math.sqrt(delta_X^2+delta_Y^2))*180/math.pi

            local delta_Yaw=GoalYAW-T2()+180
            local delta_Pitch=GoalPITCH-My_Attitude.pitch
            function Debug_YaW()
                print("------------------------")
                print("GoalYAW:",GoalYAW)
                -- print("GoalPITCH:",GoalPITCH)
                print("--------------------------")
                print("delta_Yaw:",delta_Yaw)
                print("-------------------------")
                print("Naw_Yaw:",T2())
            end
            function Debug_Pitch()
                print("-")
                print("My_Attitude_Pitch:",My_Attitude.pitch)
                print("-")
                print("delta_Pitch:",delta_Pitch)
                print("-")
                print("Naw_Pitch:",My_Attitude.pitch)
                
            end
            -- Debug_YaW()
            -- Debug_Pitch()
            if delta_Yaw<170 then
                delta_Yaw=delta_Yaw+360
            end
            if delta_Yaw>170 then
                delta_Yaw=delta_Yaw-360
            end
            UAV_Eng:ApplyRotDependentTorque(0,-1*delta_Yaw*10000,0)
            UAV_Eng:ApplyRotDependentTorque(0,0,delta_Pitch*10000)
            UAV_Eng:ApplyRotDependentForce(-500000,0,0)
        end
    end
end

function Main()
    while true do
        
        -- print(My_Attitude_Pitch,My_Attitude_Yaw,My_Attitude_Roll)
        Scanning()
        os.sleep(0.1)
    end
end

Main()