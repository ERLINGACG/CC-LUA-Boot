RSC=require("class/RSController")
Rad=require("LIBS/RadarScannf.Radar")
Can=require("class/CannonMount")
Eth0=require("class/Ethernet")
Gog=require("class/GoggleLinkPort")
local rsc=RSC:new("left",nil,nil)
local can=Can:new(nil,"cbc_cannon_mount",nil)
local RSC1=RSC:new("right",nil,nil)
local RSC2=RSC:new("left",nil,nil)
local gog=Gog:new(nil,"goggle_link_port",nil)
-- eth0:FIND()
can:FIND()
gog:FIND()
RSC1:FIND()
RSC2:FIND()

function Debug()
    local centX,centY,centZ=-203,110,-115
    -- local goalX,goalY,goalZ=Rad:GetPlayers(40)
    for index, value in pairs(coordinate.getMonster(50)) do
        local goalX,goalY,goalZ=value.x,value.y,value.z
        local deltaX,deltaY,deltaZ=goalX-centX,goalY-centY-1,goalZ-centZ

        local ConYaw,ConPitch=can:GetYaw(),can:GetPitch()
        local GoalYaw,GoalPitch=math.deg(math.atan2(-1*deltaZ,-1*deltaX))+90,math.deg(math.atan2(deltaY,math.sqrt(deltaX^2+deltaZ^2)))
        can:SetPitch(GoalPitch)
        can:SetYaw(GoalYaw)
      

    end
end
function Debug1()
    for index, value in pairs(coordinate.getPlayers(256)) do
        local viewVector = value.viewVector
        local x = viewVector.x
        local y = viewVector.y
        local z = viewVector.z

        local yaw = math.atan2(z, x) * (180 / math.pi)
        local pitch = math.atan2(y, math.sqrt(x*x + z*z)) * (180 / math.pi)
        
        print("x="..x)
        print("y="..y)
        print("z="..z)
        print("yaw="..yaw)
        print("pitch="..pitch)
        can:SetPitch(pitch)
        can:SetYaw(yaw-90)
    end
end
function Debug2()
    local x, y, z
    local batch = {}
    local centX,centY,centZ=-203,110,-115
    for _, value in pairs(coordinate.getPlayers(256)) do -- 动态获取玩家坐标
        x = value.x
        y = value.y
        z = value.z
        table.insert(batch, {x, y, z})
    end
    local Data_Table = gog:GetConnected()
    for key, value in pairs(Data_Table) do
        -- local raycastResult = value.queueRaycasts(256, {x, y, z}, true, true)
        --     if raycastResult and raycastResult.hit_pos then
        --         local X = raycastResult.hit_pos[1]
        --         local Y = raycastResult.hit_pos[2]
        --         local Z = raycastResult.hit_pos[3]
        --         print("X="..X)
        --         print("Y="..Y)
        --         print("Z="..Z)
        --         local DeltaX,DeltaY,DeltaZ=X-centX,Y-centY,Z-centZ
        --         local GoalYaw,GoalPitch=math.deg(math.atan2(-1*DeltaZ,-1*DeltaX))+90,math.deg(math.atan2(DeltaY,math.sqrt(DeltaX^2+DeltaZ^2)))
        --         can:SetPitch(GoalPitch)
        --         can:SetYaw(GoalYaw)
        --     end
    --   local raycastResult1 = value.queueRaycasts(256,batch,false, true)
      local raycastResult1 = value.raycast(256,{0,0,0},false,true)
      function f2()
            local  POS_DATA = raycastResult1.abs_pos
             if POS_DATA~=nil then
                local  X = POS_DATA[1]
                local  Y = POS_DATA[2]
                local  Z = POS_DATA[3]
                print("X="..X)
                print("Y="..Y)
                print("Z="..Z)
                local DeltaX,DeltaY,DeltaZ=X-centX,Y-centY,Z-centZ
                local GoalYaw,GoalPitch=math.deg(math.atan2(-1*DeltaZ,-1*DeltaX))+90,math.deg(math.atan2(DeltaY,math.sqrt(DeltaX^2+DeltaZ^2)))
                can:SetPitch(GoalPitch)
                can:SetYaw(GoalYaw)
             end
                
      end
      f2()
    end
end

    
    -- for key, value in pairs(gog:GetConnected()) do
    --     for key1, value1 in pairs(value) do
    --         local x,y,z
    --         for _, value3 in pairs(coordinate.getPlayers(256)) do
    --             x=value3.x
    --             y=value3.y
    --             z=value3.z
    --         end
    --         Data_Table=value
    --         print(Data_Table)
    --     end


-- while true do
--     -- print(Rad:GetPlayers(40))
--     -- Debug()
--     -- Debug1()
--     os.sleep(0.1)
-- end
-- Debug2()
while true do
    Debug()
    os.sleep(0.1)
end