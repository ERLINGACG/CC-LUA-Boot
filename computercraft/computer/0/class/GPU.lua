--- @class GPU
--- @TYPE tm_gpu
PERIPHERAL=require("class/Peripheral")
GPU={}
setmetatable(GPU, {__index=PERIPHERAL})
function GPU:new(size, type, id)
    local gpu=setmetatable(PERIPHERAL:new(size, type, id), {__index=GPU})
    self.__index = self
    gpu.test="GPU load success"
    gpu.ColorRGB={
        white=0xffffff,     --白色
        black=0x000000,     --黑色
        red=0xff0000,       --红色
        green=0x00ff00,      --绿色
        blue=0x0000ff,       --蓝色
        yellow=0xffff00,     --黄色
        magenta=0xff00ff,    --品红色
        cyan=0x00ffff,       --青色
        orange=0xff8000,     --橙色
    }
    return gpu
end                   

--- @ClassFunction 
function GPU:TEST()
    print(self.test)
    print("PeripheralID:",self.Peripheral)
end
--- @ClassFunction 
function GPU:SYNC()
   return self.Peripheral.sync()
end

--- @ClassFunction 
function GPU:SYNC_W()
    self.RootWindows.sync()         --同步窗口
end
--- @ClassFunction 
function GPU:RefreshSize()          --刷新相邻的屏幕
    self.Peripheral.refreshSize()
end
--- @ClassFunction 
function GPU:GetSize()              --获取屏幕大小
    print(self.Peripheral.getSize())
end
--- @ClassFunction
--- @param X number @屏幕宽度
--- @param Y number @屏幕高度
function GPU:SetResolution(X, Y)     --获取屏幕分辨率
    self.Peripheral.setSize(X, Y)
end
--- @ClassFunction 
function GPU:GetTouch()             --获取屏幕触摸信息,但作为系统io阻塞，不建议在主线程中使用
        ---@diagnostic disable-next-line: undefined-field
        local e,p,x,y=os.pullEventRaw("tm_monitor_touch") 
        print(e,p,x,y)
        return e,p,x,y
end
--- @ClassFunction
--- @param x number @起始点x坐标
--- @param y number @起始点y坐标
--- @param w number @宽度
--- @param h number @高度
function GPU:CreateRootWindow(x, y, w, h)   --创建窗口
    self.RootWindows=self.Peripheral.createWindow(x, y, w, h)
end
--- @ClassFunction
--- @param x1         number    @起始点x坐标
--- @param y1         number    @起始点y坐标
--- @param x2         number    @终点x坐标
--- @param y2         number    @终点y坐标
--- @param color      number    @颜色
function GPU:DrawLineSW(x1, y1, x2, y2, color)   --画平滑的线段（起点终点）
    self.RootWindows.lineS(x1, y1, x2, y2, color)
end
--- @ClassFunction
--- @param x1         number    @起始点x坐标
--- @param y1         number    @起始点y坐标
--- @param w          number    @宽度
--- @param h          number    @高度
--- @param color      number    @颜色
function GPU:DrawRectangleW(x1, y1, w, h, color)    --画直线（起点终点）
    self.RootWindows.rectangle(x1, y1, w, h, color)
end
--- @ClassFunction
--- @param x1         number    @起始点x坐标
--- @param y1         number    @起始点y坐标
--- @param r          number    @半径
--- @param color      number    @颜色
--- @param Steps      number    @步数
function GPU:DrawCricle(x1, y1, r, color,Steps)    --画圆
    local center_x, center_y, circle_R = x1, y1, r
    local steps = Steps  -- 你可以根据需要调整步数以获得更平滑的圆
    local prev_x, prev_y = center_x + circle_R, center_y  -- 从圆的右上角开始
    local outx,outy=0,0
    for i = 1, steps do
        local theta = (i / steps) * 2 * math.pi
        local x = center_x + circle_R * math.cos(theta)
        local y = center_y + circle_R * math.sin(theta)
        -- 使用你的绘制线段的方法来绘制两点之间的线段
        self.RootWindows.lineS(prev_x, prev_y, x, y, color)
        prev_x, prev_y = x, y  -- 更新上一个点的坐标
        
    end
    
    -- self.RootWindows.lineS(prev_x, prev_y, center_x + circle_R, center_y, color)
end

--- @ClassFunction
--- @param x1         number    @起始点x坐标
--- @param y1         number    @起始点y坐标
--- @param r          number    @半径
--- @param color      number    @颜色
--- @param Steps      number    @步数
function GPU:DrawHalfCircle(x1, y1, r, color,Steps)    -- 画半圆
    local center_x, center_y, circle_R = x1, y1, r
    local steps = Steps  -- 你可以根据需要调整步数以获得更平滑的半圆
    local prev_x, prev_y = center_x + circle_R, center_y  -- 从圆的右上角开始

    -- 循环生成半圆上的点
    for i = 0, steps do
        local theta = (i / steps) * math.pi  -- 角度从 0 到 pi
        local x = center_x + circle_R * math.cos(theta)
        local y = center_y + circle_R * math.sin(theta)
        -- 使用你的绘制线段的方法来绘制上一个点和当前点之间的线段
        self.RootWindows.lineS(prev_x, prev_y, x, y, color)
        -- 更新上一个点的坐标为当前点
        prev_x, prev_y = x, y
    end
end
--- @ClassFunction
--- @param x1         number    @起始点x坐标
--- @param y1         number    @起始点y坐标
--- @param r          number    @半径
--- @param alpha      number    @起始角度
--- @param beta       number    @结束角度
--- @param color      number    @颜色
--- @param Steps      number    @步数
function GPU:DrawSector(x1, y1, r, alpha, beta, color,Steps)    -- 画扇形
    local center_x, center_y, circle_R = x1, y1, r
    local start_theta = math.rad(alpha)   -- 将起始角度转换为弧度
    local end_theta = math.rad(beta)      -- 将结束角度转换为弧度
    local steps = Steps                   -- 你可以根据需要调整步数以获得更平滑的扇形

    -- 计算起始点的坐标
    local prev_x = center_x + circle_R * math.cos(start_theta)
    local prev_y = center_y + circle_R * math.sin(start_theta)

    -- 循环生成扇形上的点
    for i = 0, steps do
        local theta = start_theta + (i / steps) * (end_theta - start_theta)  -- 角度从 start_theta 到 end_theta
        local x = center_x + circle_R * math.cos(theta)
        local y = center_y + circle_R * math.sin(theta)
        -- 使用你的绘制线段的方法来绘制上一个点和当前点之间的线段
        self.RootWindows.lineS(prev_x, prev_y, x, y, color)
        -- 更新上一个点的坐标为当前点
        prev_x, prev_y = x, y
    end
end
--- @ClassFunction 

--- @ClassFunction
--- @param x number @起始点x坐标
--- @param y number @起始点y坐标
--- @param text string @文本内容
--- @param textColor number @文本颜色
--- @param bgColor number @背景颜色
--- @param unicode boolean @是否使用unicode
--- @param size number @字体大小
function GPU:DrawTextSmart(x,y,text,textColor,bgColor,unicode,size)
    self.RootWindows.drawTextSmart(x,y,text,textColor,bgColor,unicode,size)
end
--- @ClassFunction
--- @param x number @起始点x坐标
--- @param y number @起始点y坐标
--- @param text string @文本内容
--- @param textColor number @文本颜色
--- @param bgColor number @背景颜色
--- @param size number @字体大小
function GPU:DrawText(x,y,text,textColor,bgColor,size)
    self.RootWindows.drawText(x,y,text,textColor,bgColor,size)
end
--- @ClassFunction 
function GPU:ClearChars()
    self.RootWindows.clear()
end
function GPU:GetPeripheral()
    return self.RootWindows
end
return GPU