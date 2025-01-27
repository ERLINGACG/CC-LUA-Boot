Ethernet=require("class/Ethernet")
EngineControlUnit=require("class/EngineControlUnit")
GPU=require("class/GPU")
UILib=require("LIBS/GUI/UILib")
engine=EngineControlUnit:new(nil,"EngineController",nil)
gpu=GPU:new(nil,"tm_gpu",nil)
ethernet=Ethernet:new("front",nil,nil)
ethernet:FIND()
engine:FIND()
function GetEnergyFilledPercentage()
    local EnergyValue=0
    local count=0
    for index, value in pairs(ethernet:GETPERIPHELIST()) do
        local function GetE()
            return ethernet:CALL(value,"getEnergyFilledPercentage") --返回能量百分比
        end
        local status,result=pcall(GetE)
        if status then
            count=count+1
            EnergyValue=result+EnergyValue
        end
        
    end
    if count==0 then
        return "EnergySystem is Error or the Energy is Empty"
    end
    return EnergyValue/count*100
end
function Main()
    local status,result=pcall(GetEnergyFilledPercentage)
    return result
end
 gpu:FIND()
-- return Main()
function Main2()

   while true do
    Tab1=engine:GetRotation()
    print("Main2")
    gpu:RefreshSize()
    gpu:SetResolution(64,64)

    -- gpu:TEST()
    gpu:CreateRootWindow(1,1,320,192)
    -- gpu:DrawCricle(70,140,30,gpu.ColorRGB.white,200)
    -- gpu:DrawCricle(70,140,25,gpu.ColorRGB.white,200)
    -- gpu:DrawCricle(70,140,20,gpu.ColorRGB.white,200)
    -- gpu:DrawDynamicLine(70,140,30,gpu.ColorRGB.white)
    -- gpu:DrawSector(210,140,20,0,360,gpu.ColorRGB.white,6)
    gpu:DrawText(40,30,Tab1.roll,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
    rolleng=Tab1.roll*math.pi/180
    gpu:DrawRectangleW(75,75,50,50,gpu.ColorRGB.white)
    function Level()
        local x1 = 75  -- 方框左上角的x坐标
        local y1 = 75  -- 方框左上角的y坐标
        local width = 50  -- 方框的宽度
        local height = 50  -- 方框的高度
        local roll = Tab1.roll  -- 获取滚转角
    
        -- 方框的四个顶点
        local top_left = { x = x1, y = y1 }
        local bottom_right = { x = x1 + width, y = y1 + height }
    
        -- 计算线条的起点和终点
        local angle = math.rad(roll)  -- 将角度转换为弧度
        local line_length = 80  -- 线段长度
        local center_x = (top_left.x + bottom_right.x) / 2
        local center_y = (top_left.y + bottom_right.y) / 2
    
        -- 计算线条的起点和终点
        local start_x = center_x + (line_length / 2) * math.cos(angle)
        local start_y = center_y + (line_length / 2) * math.sin(angle)
        local end_x = center_x - (line_length / 2) * math.cos(angle)
        local end_y = center_y - (line_length / 2) * math.sin(angle)
    
        -- 限制起点和终点在方框内
        start_x = math.max(x1, math.min(start_x, x1 + width))
        start_y = math.max(y1, math.min(start_y, y1 + height))
        end_x = math.max(x1, math.min(end_x, x1 + width))
        end_y = math.max(y1, math.min(end_y, y1 + height))
    
        -- 填充多个线段
        local offset = 1  -- 每条线段之间的间隔
        for i = 0, 49 do
            local current_start_y = start_y + i * offset  -- 计算当前线段的起点y坐标
            local current_end_y = end_y + i * offset  -- 计算当前线段的终点y坐标
    
            -- 确保当前线段仍然在方框内
            current_start_y = math.max(y1, math.min(current_start_y, y1 + height))
            current_end_y = math.max(y1, math.min(current_end_y, y1 + height))
    
            -- 绘制线段
            gpu:DrawLineSW(start_x, current_start_y, end_x, current_end_y, gpu.ColorRGB.white)
        end
    end
    
    
    Level()
    gpu:SYNC()
    RootWindows=gpu:GetPeripheral()
  
    -- gpu:DrawLineSW(1,1,5,5,gpu.ColorRGB.white)
    -- gpu:DrawRectangleW(1,1,50,50,gpu.ColorRGB.white)
    -- gpu:DrawRectangleW(1,1,70,50,gpu.ColorRGB.white)
    -- function TEST1()
    --     window=RootWindows.createWindow(50,50,50,50)
    --     window.fill(gpu.ColorRGB.white)
    --     window.sync()
    -- end
    -- TEST1()
    -- UI1=UILib.CreatWindow(RootWindows,10,10,50,50)
    -- UI2=UILib.CreatWindow(RootWindows,60,10,50,50)
    -- UI3=UILib.CreatWindow(RootWindows,110,10,50,50)
    -- UILib.SHOW(UI1,gpu.ColorRGB.white)
    -- UILib.SHOW(UI2,gpu.ColorRGB.white)
    -- UILib.SHOW(UI3,gpu.ColorRGB.white)
    
    -- UILib.CreatWindow(RootWindows,50,10,50,50,gpu.ColorRGB.white)
    -- window=RootWindows.createWindow(50,50,50,50)
    -- window.fill(gpu.ColorRGB.white)
    -- window.sync()
    -- UILib.CreatWindow(RootWindows,10,10,50,50)
    -- for index, value in pairs(window) do
    --     print(index,value)
    -- end
    -- gpu:DrawTextSmart(10,10,"HELLO WORLD",gpu.ColorRGB.white,gpu.ColorRGB.black,nil,1)
    -- 
    gpu:SYNC_W()
    os.sleep(0.5)
    end
end
    
function Main4()
    gpu:GetSize()
end
function Main3()
    gpu:GetTouch()
end
-- while true do
--     parallel.waitForAny(
--         Main2,
--         Main3
   
--     )
--     os.sleep(0.5)
-- end
Main2()