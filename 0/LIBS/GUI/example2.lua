UILib=require("LIBS/GUI/UILib")
GPU=require("class/GPU")
EngineControlUnit=require("class/EngineControlUnit")
EventBus=require("LIBS/GUI/EventBus")
engine=EngineControlUnit:new(nil,"EngineController",nil)
local gpu=GPU:new(nil,"tm_gpu",nil)

print("hello world")
gpu:FIND()
engine:FIND()
function GetPOS(x1,y1,x2,y2,count,how_steps)
    local x_1=x1
    local y_1=y1
    local x_2=x2
    local y_2=y2
    local e,p,x,y=os.pullEventRaw("tm_monitor_touch")   
    
    if x>=x_1 and x<=x_2 and y>=y_1 and y<=y_2   then
        count=count+1
    end
    if count>0 and count%2==0 then
        FLAP=true
    else
        FLAP=false

    end
    print(e,p,x,y,x1,y1,x2,y2)
    print("FLAP",FLAP,count)
    return count
 end
--  print("start")

function Ptest()
  
    print("Ptest")
end
local count = 1
local FLAP_L=false
function Example_f()
    Tab1=engine:GetRotation()
    gpu:RefreshSize()
    gpu:SetResolution(64,64)
    ----------
    
    -- 创建窗口 --
    gpu:CreateRootWindow(1,1,320,192)
    RootWindows=gpu:GetPeripheral()
    Son_windows=UILib.CreatWindow(RootWindows,10,10,200,192)

        UILib.SHOW(Son_windows,gpu.ColorRGB.yellow)
        -- UILib.DrawCricle(Son_windows,30,30,25,gpu.ColorRGB.red,200)         --画圆
        -- UILib.DrawCurve(Son_windows,10,10,75,40,60,50,gpu.ColorRGB.red,200) --画曲线,贝塞尔曲线
        UILib.DrawHyperbola(Son_windows,40,40,10,10,gpu.ColorRGB.red,200) --画双曲线
        UILib.DrawEllipse(Son_windows,90,40,20,10,gpu.ColorRGB.red,200) --画椭圆
        UILib.DrawParabola(Son_windows,150,100,170,40,gpu.ColorRGB.red,200) --画抛物线
        gpu:DrawText(250,40,FLAP_L,gpu.ColorRGB.white,gpu.ColorRGB.black,1) --画文字
        gpu:DrawText(250,60,count,gpu.ColorRGB.white,gpu.ColorRGB.black,1) --画文字
        -- UILib.Button(Son_windows,60,60,65,65,30,30,"Button",gpu.ColorRGB.white,gpu.ColorRGB.white,gpu.ColorRGB.white,gpu.ColorRGB.black,1,FLAP,true,Ptest)
        -- UILib.FilledRectangle(Son_windows,10,10,50,50,gpu.ColorRGB.blue) --画矩形
        -- UILib.DrawRectangle(Son_windows,20,20,50,50,gpu.ColorRGB.red) --画矩形边框
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
            gpu:SYNC()
        end
        
        
        -- Level()
    -- 刷新窗口 --
    UILib.SYNC(Son_windows)
    gpu:SYNC_W() 
    gpu:SYNC()
    
    
    os.sleep(0.1)
end




function T12()
    count, FLAP_L = EventBus.GetPOS(1, 1, 320, 192, count, 2)
    return FLAP_L,count

end

function T13()
    if FLAP_L then
        print("FLAP_L", FLAP_L, "count", count)
    else
        print("FALES",count)
    end
    
    os.sleep(0.01)
end

while true do
    parallel.waitForAny(
        T12,
        -- T13,
        Example_f
    )
    os.sleep(0.001)
end