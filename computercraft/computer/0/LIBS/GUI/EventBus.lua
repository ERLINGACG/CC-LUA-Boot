--- @Libraies
--- 事件总线
EventBus = {}

function EventBus.GetPOS(x1,y1,x2,y2,count,how_steps)
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
    return count,FLAP
 end

return EventBus