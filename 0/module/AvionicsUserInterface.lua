
GPU=require("class/GPU")
EngineControlUnit = require("class/EngineControlUnit")
UILib = require("LIBS/GUI/UILib")
function T1()
    for i=0,50 do
        Index_Max=25+Data_Table.pitch/2.5
        if Index_Max>20 and Index_Max<=50 then
            for j0=0,Index_Max do
                UILib.DrawLines(Window2,55,70,55+i,70-j0,gpu.ColorRGB.white)
            end
        end
   end
end
Runing_Angle=0
local gpu=GPU:new(nil,"tm_gpu",nil)               --GPU
local ecu=EngineControlUnit:new(nil,"EngineController",nil) --引擎
gpu:FIND()
ecu:FIND()
gpu:CreateRootWindow(1,1,320,192)
MainWindows={}
MainWindows_Left_mainF=true -- 左面板的主界面
MainWindows_Right_mainF=true -- 右面板的主界面
Module_Condition_Left={ -- 初始化左面板模块的条件
    MENU=false,
    DADI=false,
    DSPD=false,
    ARDS=false,
    ICMS=false
}

Module_Condition_Right={
    MENU=false
}
Module_Table_L={
        "MENU", --菜单
        "DADI", --姿态
        "DSPD", --速度
        "ARDS", --雷达
        "ICMS", --武器
}
Module_Table_R={
        "MENU", --菜单
        "DADI", --姿态
        "DSPD", --速度
        "ARDS", --雷达
        "ICMS", --武器
}
Module_For_Radio={
    "PLAYER",
    "MONSTER",
    "SHIP"
}
Module_For_goal_ID={
    "Insert",
    "Delete",
}
Module_For_goal_Condition={
    Insert=false,
    Delete=false
}
Module_For_Radio_Condition={
    PLAYER=false,
    MONSTER=false,
    SHIP=false
}
function Event_Loop()
    local e,p,x,y=os.pullEventRaw("tm_monitor_touch")
    local function Return()
        if x>=130 and x<=155 and y>=30 and y<=45  then
            for index, value in pairs(Module_Condition_Left) do
                Module_Condition_Left[index]=false
            end
            MainWindows_Left_mainF=true
        end
    end
    local function Goto_Left()
        if x>=30 and x<=130 and y>=60 and y<=80 and MainWindows_Left_mainF==true then

            Module_Condition_Left.MENU=true
            MainWindows_Left_mainF=false
    
        elseif x>30 and x<=130 and y>=80 and y<=100 and MainWindows_Left_mainF==true then
    
            Module_Condition_Left.DADI=true
            MainWindows_Left_mainF=false
    
        elseif x>30 and x<=130 and y>=100 and y<=120 and MainWindows_Left_mainF==true then
    
            Module_Condition_Left.DSPD=true
            MainWindows_Left_mainF=false
    
        elseif x>30 and x<=130 and y>=120 and y<=140 and MainWindows_Left_mainF==true then
    
            Module_Condition_Left.ARDS=true
            MainWindows_Left_mainF=false
    
        elseif x>30 and x<=130 and y>=140 and y<=160 and MainWindows_Left_mainF==true then
    
            Module_Condition_Left.ICMS=true
            MainWindows_Left_mainF=false
    
        end
    end
    local function ON_RADIO()
        
    end
    
    Return()
    Goto_Left()
    print(e,p,x,y,Module_Condition_Left.MENU)
    os.sleep(0.1)
end

function MainWindows:MainWindows_Left()
    gpu:RefreshSize()
    gpu:SetResolution(64,64)
    RootWindows=gpu:GetPeripheral()
    Window1=UILib.CreatWindow(RootWindows,5,30,155,160)
    UILib.SHOW(Window1,gpu.ColorRGB.white)
    function R1()
        -- 空函数
    end
    UILib.Button(
        Window1,130,1,25,15,
        ">",
        gpu.ColorRGB.white,
        gpu.ColorRGB.black,
        gpu.ColorRGB.white,
        gpu.ColorRGB.black,
        1,
        Module_Condition_Left,
        false,
        R1)

    Module_Function={}
    
    function Module_Function:MENU()
        Data_Table=ecu:GetRotation()
        local Yaw = string.format("%.2f", Data_Table.yaw)
        local Pitch = string.format("%.2f", Data_Table.pitch)
        local Roll = string.format("%.2f", Data_Table.roll)
        Window2=UILib.CreatWindow(Window1,1,1,155,160) -- 覆盖上面的窗口
        UILib.Button(                                  -- 返回按钮 
            Window2,130,1,25,15,
            ">",
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            1,
            Module_Condition_Left,
            false,
        R1)
        UILib.SHOW(Window2,gpu.ColorRGB.white)

            UILib.DrawText(Window2,10,10,"MENU",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,20,"Yaw:"..Yaw,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,30,"Pitch:"..Pitch,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,40,"Roll:"..Roll,gpu.ColorRGB.white,gpu.ColorRGB.black,1)

         UILib.SYNC(Window2)
         gpu:SYNC_W()
         gpu:SYNC()
    end

    function Module_Function:DADI()
        Data_Table=ecu:GetRotation()
        local Yaw = string.format("%.2f", Data_Table.yaw)
        local Pitch = string.format("%.2f", Data_Table.pitch)
        local Roll = string.format("%.2f", Data_Table.roll)
        Window2=UILib.CreatWindow(Window1,1,1,155,160) -- 覆盖上面的窗口
        UILib.Button(                                  -- 返回按钮 
            Window2,130,1,25,15,
            ">",
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            1,
            Module_Condition_Left,
            false,
        R1)
        UILib.SHOW(Window2,gpu.ColorRGB.white)
        UILib.DrawText(Window2,70,10,"DADI",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            local function Debug()
                UILib.DrawText(Window2,10,120,"Yaw:"..Yaw,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                UILib.DrawText(Window2,10,130,"Pitch:"..Pitch,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                UILib.DrawText(Window2,10,140,"Roll:"..Roll,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            end
            local function Level()
                UILib.FilledRectangle(Window2,55,20,50,50,gpu.ColorRGB.blue)
                for i = 0, 50, 1 do
                    local Index_Max =25+Data_Table.pitch/2.5
                    if Index_Max>40 then
                        Index_Max=40
                    end
                    if Index_Max<5 then
                        Index_Max=5
                    end
                    for j = 0, Index_Max, 1 do
                            UILib.DrawLines(Window2, 55, 70, 55 + i, 70 - j, gpu.ColorRGB.red)
                    end
                end
            
                local angle = -1*Data_Table.roll  -- 将角度转换为弧度
                -- local centerX1=55+25+20 
                -- local centerY1=20+25-10
                -- local centerX2=55+25-10
                -- local centerY2=20+25
                -- local endX1=centerX1-10*math.cos(math.rad(angle))
                -- local endY1=centerY1+10*math.sin(math.rad(angle))
                -- local endX2=centerX2-10*math.cos(math.rad(angle))
                -- local endY2=centerY2+10*math.sin(math.rad(angle))
                -- UILib.DrawLines(Window2,centerX2,centerY2,endX2,endY2,gpu.ColorRGB.yellow)
                -- UILib.DrawLines(Window2,centerX1,centerY1,endX1,endY1,gpu.ColorRGB.yellow)

                    for j = 1, 30, 10 do
                        local centerX1=55+10
                        local centerY1=20+15+j
                        local endX1=centerX1-10*math.cos(math.rad(angle))
                        local endY1=centerY1+10*math.sin(math.rad(angle))
                        local endX2=centerX1+10*math.cos(math.rad(angle))
                        local endY2=centerY1-10*math.sin(math.rad(angle))
                        UILib.DrawLines(Window2,centerX1,centerY1,endX1,endY1,gpu.ColorRGB.yellow)
                        UILib.DrawLines(Window2,centerX1,centerY1,endX2,endY2,gpu.ColorRGB.yellow)
                end
                for j = 1, 30, 10 do
                    local centerX1=55+40
                    local centerY1=20+15+j
                    local endX1=centerX1-10*math.cos(math.rad(angle))
                    local endY1=centerY1+10*math.sin(math.rad(angle))
                    local endX2=centerX1+10*math.cos(math.rad(angle))
                    local endY2=centerY1-10*math.sin(math.rad(angle))
                    UILib.DrawLines(Window2,centerX1,centerY1,endX1,endY1,gpu.ColorRGB.yellow)
                    UILib.DrawLines(Window2,centerX1,centerY1,endX2,endY2,gpu.ColorRGB.yellow)
                end

                for i = 0, 45, 5 do
                    UILib.DrawText(Window2,50,20+i,"-",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                end
                for i = 0, 45, 5 do
                    UILib.DrawText(Window2,105,20+i,"-",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                end
            end
            local function ShowYaw()
                UILib.DrawCricle(Window2,55+25,115,30,gpu.ColorRGB.white,200)
                local Angle = Data_Table.yaw
                local startX=55+25
                local startY=115
                local endX1=startX-30*math.cos(math.rad(Angle))
                local endY1=startY+30*math.sin(math.rad(Angle))

                local endX2=startX+30*math.cos(math.rad(Angle))
                local endY2=startY-30*math.sin(math.rad(Angle))
                

                UILib.DrawLines(Window2,startX,startY,endX1,endY1,gpu.ColorRGB.red)
                UILib.DrawLines(Window2,startX,startY,endX2,endY2,gpu.ColorRGB.white)
            
                
                UILib.DrawText(Window2,42,110,"W",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                UILib.DrawText(Window2,80,75,"N",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                UILib.DrawText(Window2,78,150,"S",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
                UILib.DrawText(Window2,115,110,"E",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            end
            ShowYaw()
            Level()

         UILib.SYNC(Window2)
         gpu:SYNC_W()
         gpu:SYNC()
    end
    function Module_Function:DSPD()
        Window2=UILib.CreatWindow(Window1,1,1,155,160) -- 覆盖上面的窗口
        UILib.Button(                                  -- 返回按钮 
            Window2,130,1,25,15,
            ">",
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            1,
            Module_Condition_Left,
            false,
        R1)
       
        UILib.SHOW(Window2,gpu.ColorRGB.white)
        UILib.DrawText(Window2,70,10,"DSPD",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
         local function Debug()
            local Speed_Table=ecu:GetVelocity()
            -- for key, value in pairs(Speed_Table) do
            --     UILib.DrawText(Window2,10,30,"Z:"...z,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            -- end
            UILib.DrawText(Window2,10,30,"X:"..Speed_Table.x,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,40,"Y:"..Speed_Table.y,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,50,"Z:"..Speed_Table.z,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
         end

         local function Show_Speed()
            SPeed_Table=ecu:GetVelocity()
            local SpeedX=SPeed_Table.x
            local SpeedY=SPeed_Table.y
            local SpeedZ=SPeed_Table.z
           local function DrawX()
            
            UILib.DrawSector(
                Window2,
                30,50,
                20,
                -90,
                  0,
                gpu.ColorRGB.blue,
                400
            )
            UILib.DrawSector(
                Window2,
                30,50,
                20,
                 0,
                 90,
                gpu.ColorRGB.yellow,
                400
            )
            UILib.DrawSector(
                Window2,
                30,50,
                20,
                90,
                180,
                gpu.ColorRGB.red,
                400
            )
            local endX=30+20*math.cos(math.rad(math.abs(SpeedX)%270-90))
            local endY=50+20*math.sin(math.rad(math.abs(SpeedX)%270-90))
            UILib.DrawLines(Window2,30,50,endX,endY,gpu.ColorRGB.white)
           end
           local function DrawY()
            
            UILib.DrawSector(
                Window2,
                80,50,
                20,
                -90,
                  0,
                gpu.ColorRGB.blue,
                400
            )
            UILib.DrawSector(
                Window2,
                80,50,
                20,
                 0,
                 90,
                gpu.ColorRGB.yellow,
                400
            )
            UILib.DrawSector(
                Window2,
                80,50,
                20,
                90,
                180,
                gpu.ColorRGB.red,
                400
            )
            local endX=80+20*math.cos(math.rad(math.abs(SpeedY)%270-90))    
            local endY=50+20*math.sin(math.rad(math.abs(SpeedY)%270-90))
            UILib.DrawLines(Window2,80,50,endX,endY,gpu.ColorRGB.white)
           end
           local function DrawZ()
            
            UILib.DrawSector(
                Window2,
                130,50,
                20,
                -90,
                  0,
                gpu.ColorRGB.blue,
                400
            )
            UILib.DrawSector(
                Window2,
                130,50,
                20,
                 0,
                 90,
                gpu.ColorRGB.yellow,
                400
            )
            UILib.DrawSector(
                Window2,
                130,50,
                20,
                90,
                180,
                gpu.ColorRGB.red,
                400
            )
            local endX=130+20*math.cos(math.rad(math.abs(SpeedZ)%270-90))    
            local endY=50+20*math.sin(math.rad(math.abs(SpeedZ)%270-90))
            UILib.DrawLines(Window2,130,50,endX,endY,gpu.ColorRGB.white)
           end
           DrawZ()
           DrawY()
           DrawX()

        end
        Show_Speed()
        UILib.SYNC(Window2)
        gpu:SYNC_W()
        gpu:SYNC()
    end
    function Module_Function:ARDS()    --雷达模块
        Data_Table=ecu:GetRotation()
        local Yaw = string.format("%.2f", Data_Table.yaw)
        local Pitch = string.format("%.2f", Data_Table.pitch)
        local Roll = string.format("%.2f", Data_Table.roll)
        Window2=UILib.CreatWindow(Window1,1,1,155,160) -- 覆盖上面的窗口
        UILib.Button(                                  -- 返回按钮 
            Window2,130,1,25,15,
            ">",
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            1,
            Module_Condition_Left,
            false,
        R1)
        UILib.Button(                                  -- 单纯显示雷达按钮 
            Window2,105,1,25,15,
            "ARDS",
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            gpu.ColorRGB.white,
            gpu.ColorRGB.black,
            1,
            Module_Condition_Left,
            false,
        R1)
        UILib.SHOW(Window2,gpu.ColorRGB.white)
        local function Debug()
            Pos_table=ecu:GetShipPos()
            for index, value in pairs(Pos_table) do
                print(index,value)
            end
            UILib.DrawText(Window2,10,120,"Yaw:"..Yaw,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,130,"Pitch:"..Pitch,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            UILib.DrawText(Window2,10,140,"Roll:"..Roll,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
        end
        local function RadarSystem()
            Target_table=coordinate.getMonster(256)
            Pos_table=ecu:GetShipPos()
            local centesX=30+25
            local centesY=30+25
            UILib.DrawCricle(Window2,centesX,centesY,50,gpu.ColorRGB.white,200)
            UILib.DrawCricle(Window2,centesX,centesY,40,gpu.ColorRGB.white,200)
            UILib.DrawCricle(Window2,centesX,centesY,30,gpu.ColorRGB.white,200)
            UILib.DrawCricle(Window2,centesX,centesY,20,gpu.ColorRGB.white,200)
            if Runing_Angle >= 360 then
                Runing_Angle = 0
            end
            if Runing_Angle <= 360 then
                Runing_Angle = Runing_Angle+ 10
            end
            local endX=centesX-50*math.cos(math.rad(Runing_Angle))
            local endY=centesY+50*math.sin(math.rad(Runing_Angle))
            local endX2=centesX-50*math.cos(math.rad(Runing_Angle+30))
            local endY2=centesY+50*math.sin(math.rad(Runing_Angle+30))
            UILib.DrawLines(Window2,centesX,centesY,endX,endY,gpu.ColorRGB.yellow)
            UILib.DrawLines(Window2,centesX,centesY,endX2,endY2,gpu.ColorRGB.yellow)


            UILib.DrawLines(Window2,105,10,105,160-25,gpu.ColorRGB.white)
            local function Scan()
                local MapCenterX = centesX
                local MapCenterY = centesY
                local Shipx = Pos_table.x
                local Shipy = Pos_table.y
                local Shipz = Pos_table.z
                local radius = 50  -- 圆的半径
                local Entity=0
                if Target_table ~= nil then
                    for key, value in pairs(Target_table) do
                        local deltaX = value.x - Shipx
                        local deltaY = value.y - Shipy
                        local deltaZ = value.z - Shipz
            
                        local showX = MapCenterX + deltaX
                        local showZ = MapCenterY + deltaZ
                        Entity=Entity+1
            
                        -- 计算 showX 和 showY 到圆心的距离
                        -- local distance = math.sqrt((showX - MapCenterX)^2 + (showY - MapCenterY)^2)
            
                        -- -- 如果距离大于半径，则将点投影到圆的边界上
                        -- if distance > radius then
                        --     local angle = math.atan2(showY - MapCenterY, showX - MapCenterX)
                        --     showX = MapCenterX + radius * math.cos(angle)
                        --     showY = MapCenterY - radius * math.sin(angle)
                        -- end
            
                        -- 绘制目标点
                        
                        if showX>5 and showX<105 and showZ>5 and showZ<105 then
                               UILib.FilledRectangle(Window2, showX, showZ, 5, 5, gpu.ColorRGB.yellow) --黄色代表生物
                               UILib.DrawLines(Window2,centesX,centesY,showX,showZ,gpu.ColorRGB.blue)
                        end
                     
                    end
                end
                UILib.DrawText(Window2,107,30,"ENT:"..Entity,gpu.ColorRGB.white,gpu.ColorRGB.black,1)
            end
            local function ShowYaw()
                -- UILib.DrawCricle(Window2,55+25,115,30,gpu.ColorRGB.white,200)
                local Angle = Data_Table.yaw
                local startX=centesX
                local startY=centesY
                local endX1=startX-10*math.cos(math.rad(Angle))
                local endY1=startY+10*math.sin(math.rad(Angle))

                local endX2_=startX+10*math.cos(math.rad(Angle))
                local endY2_=startY-10*math.sin(math.rad(Angle))
                

                UILib.DrawLines(Window2,startX,startY,endX1,endY1,gpu.ColorRGB.red)
                UILib.DrawLines(Window2,startX,startY,endX2_,endY2_,gpu.ColorRGB.white)

            end
            
            local function Nar()
                UILib.CreatNarbar(
                    Window2,
                    1,110,52,25,
                    Module_For_goal_ID,
                    1,
                    gpu.ColorRGB.black,
                    gpu.ColorRGB.white,
                    gpu.ColorRGB.white,
                    gpu.ColorRGB.black,
                    false,
                    Module_For_goal_Condition,
                    Module_For_goal_ID
                )
                UILib.CreatNarbar(
                    Window2,
                    1,135,52,25,
                    Module_For_Radio,
                    1,
                    gpu.ColorRGB.black,
                    gpu.ColorRGB.white,
                    gpu.ColorRGB.white,
                    gpu.ColorRGB.black,
                    false,
                    Module_For_Radio_Condition,
                    Module_For_Radio
                )
            end
            Nar()
            ShowYaw()
            Scan()          
        end

        -- Debug()
        RadarSystem()
         UILib.SYNC(Window2)
         gpu:SYNC_W()
         gpu:SYNC()
    end
    function Module_Function:ICMS()
        Window2=UILib.CreatWindow(Window1,15,10,100,100)

         UILib.SHOW(Window2,gpu.ColorRGB.white)

         UILib.DrawText(Window2,10,10,"ICMS",gpu.ColorRGB.white,gpu.ColorRGB.black,1)
         UILib.SYNC(Window2)
         gpu:SYNC_W()
         gpu:SYNC()
    end
    UILib.CreateFrom(
        Window1,25,30,100,20,
        Module_Table_L,1,
        gpu.ColorRGB.black,
        gpu.ColorRGB.white,
        gpu.ColorRGB.white,
        gpu.ColorRGB.black,
        false,
        Module_Condition_Left,
        Module_Function)
 
    UILib.SYNC(Window1)
    gpu:SYNC_W()
    gpu:SYNC()
end

function MainWindows:MainWindows_Right()
    gpu:RefreshSize()
    gpu:SetResolution(64,64)
    RootWindows=gpu:GetPeripheral()
    Window1=UILib.CreatWindow(RootWindows,160,30,155,160)
    UILib.SHOW(Window1,gpu.ColorRGB.white)


    Module_Function={
       
    }
    function R1()
        
    end
    UILib.Button(
        Window1,130,1,25,15,
        ">",
        gpu.ColorRGB.white,
        gpu.ColorRGB.black,
        gpu.ColorRGB.white,
        gpu.ColorRGB.black,
        1,
        Module_Condition_Left,
        false,
        R1)

    function Module_Function:MENU()
    end 
    function Module_Function:DADI()
        
    end
    function Module_Function:DSPD()
        
    end
    function Module_Function:DENG()
        
    end
    function Module_Function:DGPS()
        
    end
    UILib.CreateFrom(
              Window1,25,30,100,20, 
              Module_Table_R,1,
              gpu.ColorRGB.black,
              gpu.ColorRGB.white,
              gpu.ColorRGB.white,
              gpu.ColorRGB.black,
              false,
              Module_Condition_Right,
              Module_Function)
    


    UILib.SYNC(Window1)
    gpu:SYNC_W()
    gpu:SYNC()
end






local function main()
    while true do   
        MainWindows:MainWindows_Left()
        MainWindows:MainWindows_Right()
        os.sleep(0.1)
    end
end


while true do
    parallel.waitForAny(
        Event_Loop,
        main
        
    )
    os.sleep(0.001)   -- 避免Event_Loop长时间抢占资源导致无法退出程序
end