local l1={}
l1.__index=l1
function l1:new()
    self.name="l1"
    return setmetatable({},self)
end

--- @interface 
    function l1:test()

        error("l1 test error")
       
    end

l2=setmetatable({},{__index=l1}) 
l2=l2:new()   
l3=l1:new()
-- print(l2.name)
---@diagnostic disable-next-line: duplicate-set-field
function l2:test()
    print("l2 test")
end
--- @diagnostic disable-next-line: duplicate-set-field
function l3:test()
    print("l3 test")
end

l2:test()
l3:test()