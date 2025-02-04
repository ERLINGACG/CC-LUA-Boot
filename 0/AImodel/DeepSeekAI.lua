local url = "http://localhost:11434/api/chat"
local content = "你的消息内容"  -- 替换为实际的消息内容

local data = {
    model = "deepseek-r1:1.5b",
    messages = {
        {
            role = "user",
            content = content
        }
    }
}

-- 将 Lua 表转换为 JSON 字符串

-- 发送 POST 请求
local response, err = http.post(url, data, nil, false)

if response then
    -- 读取响应内容
    local responseText = response.readAll()
    response.close()
    print("响应内容: " .. responseText)
else
    print("请求失败: " .. err)
end
