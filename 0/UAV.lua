local EngineControlUnit=require("class/EngineControlUnit")
local UAV_Eng=EngineControlUnit:new("back",nil,nil)






UAV_Eng:FIND()
local UAV_Eng_ID=UAV_Eng:GetShipID()
local My_Pos=UAV_Eng:GetShipPos()



function Debug()
    -- print(UAV_Eng:GetShipID())
    for key, value in pairs(My_Pos) do
        print(key, value)
    end
end

function Scanning()
    ships = coordinate.getShips(250)
    for k, v in pairs(ships) do
        -- print("x="..v.x)
        -- print("y="..v.y)
        -- print("z="..v.z)
        -- print("id="..v.id)
        -- print("slug="..v.slug)
        -- print("dimension.x="..v.dimension)
        -- print("max_x"..v.max_x)
        -- print("max_y"..v.max_y)
        -- print("max_z"..v.max_z)
        -- print("min_x"..v.min_x)
        -- print("min_y"..v.min_y)
        -- print("min_z"..v.min_z)
    end
end

Debug()
Scanning()