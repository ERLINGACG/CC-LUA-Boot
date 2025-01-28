--- @diagnostic disable: undefined-field
--- @Libraies
UILib = {}

function UILib.test()
    print("test")
end
--    基础操作 --

--- 用于在ROOT窗口上创建新窗口。
--- @param rootwindow table              Root窗口对象
--- @param x          number             窗口左上角x坐标
--- @param y          number             窗口左上角y坐标         
--- @param w          number             窗口宽度
--- @param h          number             窗口高度
--- @return           table              创建的窗口对象
function UILib.CreatWindow(rootwindow, x, y, w, h)
    local window = rootwindow.createWindow(x, y, w, h)
    return window
end

--- 显示窗口边框
--- @param window       table            操作窗口对象
--- @param Color        number           边框颜色，使用HE_RGB格式
function UILib.SHOW(window, Color)
    local w, h = window.getSize()
    window.rectangle(1, 1, w, h, Color)
    window.sync()
end

--- 同步显示窗口
--- @param window table      操作窗口对象
--- @return       unknown    同步结果
function UILib.SYNC(window)
    return window.sync()
end

-- AND --


-- 文本绘制 --
---@param window     table                  操作窗口对象
---@param x          number                 文本左上角x坐标
---@param y          number                 文本左上角y坐标
---@param text       string                 要显示的文本
---@param Tcolor     number                 文本颜色，使用HEX_RGB格式
---@param Bcolor     number                 背景颜色，使用HEX_RGB格式
---@param size       number                 字体大小
function UILib.DrawText(window, x, y, text, Tcolor, Bcolor, size)
    window.drawText(x, y, text, Tcolor, Bcolor, size)
    
end


-- 线段绘制 --
function UILib.DrawLines(window, x1, y1, x2, y2, color) -- 绘制线段
    window.lineS(x1, y1, x2, y2, color)
end

-- 矩形绘制 --

--- 矩形绘制
---@param window     table                  操作窗口对象
---@param x1         number                 矩形左上角x坐标
---@param y1         number                 矩形左上角y坐标         
---@param w          number                 矩形宽度
---@param h          number                 矩形高度
---@param color      number                 边框颜色，使用HEX_RGB格式
function UILib.DrawRectangle(window, x1, y1, w, h, color)  -- 绘制矩形
    window.rectangle(x1, y1, w, h, color)
end

--- 填充矩形
---@param window     table                  操作窗口对象
---@param x1         number                 矩形左上角x坐标
---@param y1         number                 矩形左上角y坐标
---@param w          number                 矩形宽度
---@param h          number                 矩形高度
---@param color      number                 边框颜色，使用HEX_RGB格式
function UILib.FilledRectangle(window, x1, y1, w, h, color) -- 填充矩形
    window.filledRectangle(x1, y1, w, h, color)
end

-- 曲线绘制 --

--- 绘制圆/多边形
---@param window     table                   操作窗口对象
---@param x1         number                  圆心x坐标
---@param y1         number                  圆心y坐标
---@param r          number                  半径
---@param color      number                  边框颜色，使用HEX_RGB格式
---@param Steps      number                  绘制步数/多边形边数
function UILib.DrawCricle(window, x1, y1, r, color, Steps)    -- 圆/多边形
    local center_x, center_y, circle_R = x1, y1, r
    local steps = Steps                                   -- 你可以根据需要调整步数以获得更平滑的圆
    local prev_x, prev_y = center_x + circle_R, center_y  -- 从圆的右上角开始

    for i = 1, steps do
        local theta = (i / steps) * 2 * math.pi
        local x = center_x + circle_R * math.cos(theta)
        local y = center_y + circle_R * math.sin(theta)
        -- 使用你的绘制线段的方法来绘制两点之间的线段
        window.lineS(prev_x, prev_y, x, y, color)
        prev_x, prev_y = x, y  -- 更新上一个点的坐标
    end
end

--- 绘制扇形
---@param window     table                   操作窗口对象
---@param x1         number                  扇形中心x坐标
---@param y1         number                  扇形中心y坐标
---@param r          number                  半径
---@param alpha      number                  起始角度（度）
---@param beta       number                  结束角度（度）
---@param color      number                  边框颜色，使用HEX_RGB格式
---@param Steps      number                  绘制步数
function UILib.DrawSector(window, x1, y1, r, alpha, beta, color, Steps) -- 扇形
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
        window.lineS(prev_x, prev_y, x, y, color)
        -- 更新上一个点的坐标为当前点
        prev_x, prev_y = x, y
    end
end

--- 绘制贝塞尔曲线
---@param window     table               操作窗口对象
---@param startX     number              起始点x坐标
---@param startY     number              起始点y坐标
---@param controlX   number              控制点x坐标
---@param controlY   number              控制点y坐标
---@param endX       number              结束点x坐标
---@param endY       number              结束点y坐标
---@param color      number              边框颜色，使用HEX_RGB格式
---@param steps      number              绘制步数
function UILib.DrawCurve(window, startX, startY, controlX, controlY, endX, endY, color, steps) -- 贝塞尔曲线
    local points = {}

    for i = 0, steps do
        local t = i / steps
        local x = (1 - t)^2 * startX + 2 * (1 - t) * t * controlX + t^2 * endX
        local y = (1 - t)^2 * startY + 2 * (1 - t) * t * controlY + t^2 * endY
        table.insert(points, {x = x, y = y})
    end

    for i = 1, #points do
        if points[i - 1] then
            window.lineS(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y, color)
        end
    end
end

-- 圆锥曲线 --

--- 绘制椭圆
---@param window     table              操作窗口对象
---@param centerX    number             椭圆中心x坐标
---@param centerY    number             椭圆中心y坐标
---@param a          number             椭圆长轴半径
---@param b          number             椭圆短轴半径
---@param color      number             边框颜色，使用HEX_RGB格式
---@param steps      number             绘制步数
function UILib.DrawEllipse(window, centerX, centerY, a, b, color, steps)    -- 椭圆
    local points = {}

    for i = 0, steps do
        local t = 2 * math.pi * i / steps
        local x = centerX + a * math.cos(t)
        local y = centerY + b * math.sin(t)
        table.insert(points, {x = x, y = y})
    end

    for i = 1, #points do
        if points[i - 1] then
            window.lineS(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y, color)
        end
    end
end

--- 绘制抛物线
---@param window     table            操作窗口对象
---@param startX     number           起始点x坐标
---@param startY     number           起始点y坐标
---@param endX       number           结束点x坐标
---@param endY       number           结束点y坐标
---@param color      number           边框颜色，使用HEX_RGB格式
---@param steps      number           绘制步数
function UILib.DrawParabola(window, startX, startY, endX, endY, color, steps)      -- 抛物线
    local points = {}

    local a = (endY - startY) / (endX - startX)^2

    for i = 0, steps do
        local t = startX + i * (endX - startX) / steps
        local y = startY + a * (t - startX)^2
        table.insert(points, {x = t, y = y})
    end

    for i = 1, #points do
        if points[i - 1] then
            window.lineS(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y, color)
        end
    end
end

--- 绘制双曲线
---@param window     table           操作窗口对象
---@param centerX    number          双曲线中心x坐标
---@param centerY    number          双曲线中心y坐标
---@param a          number          双曲线长轴半径
---@param b          number          双曲线短轴半径
---@param color      number          边框颜色，使用HEX_RGB格式
---@param steps      number          绘制步数
function UILib.DrawHyperbola(window, centerX, centerY, a, b, color, steps)     -- 双曲线--镜像法
    local points1 = {}  -- 第一支双曲线的点
    local points2 = {}  -- 第二支双曲线的点

    -- 绘制第一支双曲线 (t >= 0)
    for i = 0, steps do
        local t = -2 + i * 4 / steps  -- 从 -2 到 2
        local x = centerX + a * math.cosh(t)
        local y = centerY + b * math.sinh(t)
        table.insert(points1, {x = x, y = y})
    end

    -- 绘制第二支双曲线 (t < 0)
    for i = 0, steps do
        local t = -2 + i * 4 / steps  -- 从 -2 到 2
        local x = centerX - a * math.cosh(t)
        local y = centerY - b * math.sinh(t)
        table.insert(points2, {x = x, y = y})
    end

    -- 连接第一支双曲线的点
    for i = 2, #points1 do
        window.lineS(points1[i - 1].x, points1[i - 1].y, points1[i].x, points1[i].y, color)
    end

    -- 连接第二支双曲线的点
    for i = 2, #points2 do
        window.lineS(points2[i - 1].x, points2[i - 1].y, points2[i].x, points2[i].y, color)
    end
end

---按钮控件
---@param window       table             操作窗口对象      
---@param x1           number            按钮左上角x坐标
---@param y1           number            按钮左上角y坐标
---@param w            number            按钮宽度
---@param h            number            按钮高度
---@param text         string            按钮文本
---@param Bcolor       number            边框颜色，    使用HEX_RGB格式
---@param Fcolor       number            填充颜色，    使用HEX_RGB格式
---@param Tcolor       number            文本颜色，    使用HEX_RGB格式
---@param TBcolor      number            文本背景颜色，使用HEX_RGB格式
---@param Tsize        number            文本大小
---@param fcondition   table             按钮回调函数条件
---@param isfill       boolean           是否填充按钮
---@param func         function          按钮回调函数
---@param ...          any               回调函数参数
---@return             any               按钮起始x坐标
---@return             any               按钮起始y坐标
---@return             any               按钮宽度
---@return             any               按钮高度
---@return             any               结果
function UILib.Button(window,x1,y1,w,h,text,Bcolor,Fcolor,Tcolor,TBcolor,Tsize,fcondition,isfill,func,...)
    window.rectangle(x1,y1,w,h,Bcolor)
    if isfill then
        window.filledRectangle(x1,y1,w,h,Fcolor)
    end
    local str=text
    local len=string.len(str)
    window.drawText(x1+w/2-len*3,y1+h/2-5,text,Tcolor,TBcolor,Tsize)
    if fcondition then

       Result = func(...)
       
    end
    return x1,y1,w,h,Result
end

---创建表单
---@param window           table             操作窗口对象      
---@param x1               number            按钮左上角x坐标
---@param y1               number            按钮左上角y坐标
---@param w                number            按钮宽度
---@param h                number            按钮高度
---@param text_table       table             按钮文本列表
---@param Tsize            number            文本大小
---@param TBcolor          number            文本背景颜色，使用HEX_RGB格式
---@param Bcolor           number            边框颜色，    使用HEX_RGB格式
---@param Tcolor           number            文本颜色，    使用HEX_RGB格式
---@param Fcolor           number            填充颜色，    使用HEX_RGB格式
---@param isfill           boolean           是否填充按钮
---@param fcondition_table table             按钮回调函数条件列表
---@param func_table       table             按钮回调函数列表
---@return                 table               结果
function UILib.CreateFrom(window,x1,y1,w,h,text_table,Tsize,TBcolor,Bcolor,Tcolor,Fcolor,isfill,fcondition_table,func_table)
    Text={}
    for index, value in pairs(text_table) do
        window.rectangle(x1,y1,w,h,Bcolor)
        if isfill then
            window.filledRectangle(x1,y1,w,h,Fcolor)
        end
        local str=value
        local len=string.len(str)
        window.drawText(x1+w/2-len*3,y1+h/2-5,value,Tcolor,TBcolor,Tsize)
        y1=y1+h
    end
    Func_Condition = {}
    for index, condition in pairs(fcondition_table) do
        if func_table[index] then
            Func_Condition[index] = {condition = condition, func = func_table[index]}
        end
        
    end
    Result ={}
    for key, pair in pairs(Func_Condition) do
        if type(pair.func) == "function" then
            if pair.condition then
                _Result = pair.func()
                if _Result~=nil then
                    table.insert(Result,_Result)
                end
            end
        end
    end
    return Result
end

--- 创建横向导航栏
--- @param window           table             操作窗口对象      
--- @param x1               number            按钮左上角x坐标
--- @param y1               number            按钮左上角y坐标
--- @param w                number            按钮宽度
--- @param h                number            按钮高度
--- @param text_table       table             按钮文本列表
--- @param Tsize            number            文本大小
--- @param TBcolor          number            文本背景颜色，使用HEX_RGB格式
--- @param Bcolor           number            边框颜色，    使用HEX_RGB格式
--- @param Tcolor           number            文本颜色，    使用HEX_RGB格式
--- @param Fcolor           number            填充颜色，    使用HEX_RGB格式
--- @param isfill           boolean           是否填充按钮
--- @param fcondition_table table             按钮回调函数条件列表
--- @param func_table       table             按钮回调函数列表
--- @return                 table             结果
function UILib.CreatNarbar(window,x1,y1,w,h,text_table,Tsize,TBcolor,Bcolor,Tcolor,Fcolor,isfill,fcondition_table,func_table)
    Text={}
    for index, value in pairs(text_table) do
        window.rectangle(x1,y1,w,h,Bcolor)
        if isfill then
            window.filledRectangle(x1,y1,w,h,Fcolor)
        end
        local str=value
        local len=string.len(str)
        window.drawText(x1+w/2-len*3,y1+h/2-5,value,Tcolor,TBcolor,Tsize)
        x1=x1+w
    end
    Func_Condition = {}
    for index, condition in pairs(fcondition_table) do
        if func_table[index] then
            Func_Condition[index] = {condition = condition, func = func_table[index]}
        end      
    end
    Result ={}
    for key, pair in pairs(Func_Condition) do
        if type(pair.func) == "function" then
            if pair.condition then
                _Result = pair.func()
                table.insert(Result,_Result)
            end
        end
    end
    return Result
end
return UILib
