
--[[
这是一个错误类
错误类为抽象类，不能实例化，只能通过继承来实现然后调用接口方法

]]--
--- @error
--- @Path("toos\\error")
Error={}
Error.__index=Error

function  Error:new()
    
end

--- @interface 
--- @AbstractFunction
function Error:ErrorInterface()
   error("THIS IS A Abstract interface ")
end

return Error