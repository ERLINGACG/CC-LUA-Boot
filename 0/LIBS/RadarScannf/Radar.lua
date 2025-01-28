---@Libary
Radar = {}


---@param radius number -- 半径
---@return number --x坐标
---@return number --y坐标
---@return number --z坐标
---@return string --玩家名称
---@return string --玩家uuid
---@return table  --视角向量,返回viewVector.x,viewVector.y,viewVector.z
---@return number --视角高度
---@return string --姿态
function Radar:GetPlayers(radius)      --获取玩家信息
    local x,y,z
    local name, uuid, viewVector, eyeHeight, pose
    local players = coordinate.getPlayers(256)
    for index, value in pairs(players) do
        x = value.x
        y = value.y
        z = value.z
        name = value.name
        uuid = value.uuid
        viewVector = value.viewVector
        eyeHeight = value.eyeHeight
        pose = value.pose

    end
    return x,y,z,name, uuid, viewVector, eyeHeight, pose
end


---@param  radius number -- 半径
---@return number --x坐标
---@return number --y坐标
---@return number --z坐标
---@return string --怪物名称
---@return string --怪物uuid
---@return string --怪物displayName
---@return number --怪物health
---@return number --怪物maxHealth
---@return table  --视角向量,返回viewVector.z
---@return number --怪物的护甲值

function Radar:GetMonsters(radius)      --获取怪物信息
    local x,y,z
    local name, uuid,displayName,health,maxHealth,viewVector,armor
    local monsters = coordinate.getMonster(256)
    for index, value in pairs(monsters) do
        x = value.x
        y = value.y
        z = value.z
        name = value.name
        uuid = value.uuid
        displayName = value.displayName
        health = value.health
        maxHealth = value.maxHealth
        viewVector = value.viewVector
        armor = value.armor
    end
    return x,y,z,name, uuid, displayName, health, maxHealth, viewVector, armor
end
-- monsters = coordinate.getMonster(256)
-- for k, v in pairs(monsters) do
--     print("x="..v.x)
--     print("y="..v.y)
--     print("z="..v.z)
--     print("name="..v.name)
--     print("uuid="..v.uuid)
--     print("displayName="..v.displayName)
--     print("health="..v.health)
--     print("maxHealth="..v.maxHealth)
--     print("viewVector.z="..v.viewVector.z)
--     print("armor="..v.armor)
-- end
function Radar:Calibrate(CenX,CenY,CenZ,endX,endY,endZ)      --校准坐标
    

end













return Radar


