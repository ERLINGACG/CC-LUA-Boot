
-- @library 
function Call(Peripheral1, Peripheral_name,funcname,parameter)
    Peripheral1.callRemote(Peripheral_name,funcname,parameter)
end


return{
    Call = Call
}