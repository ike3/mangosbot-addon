local botTable = {}

function trim2(s)
  return s:match "^%s*(.-)%s*$"
end

function OnWhisper(message, sender)
    if (botTable[sender] == nil) then
        botTable[sender] = {}
    end
    
    local bot = botTable[sender]
    if (string.find(message, 'Strategies: ') == 1) then
        local list = {}
        local type = 'co'
        for i in string.gmatch(string.sub(message, 13), "([^,]+)") do
            local name = trim2(i)
            table.insert(list, name)
            if (name == "nc") then type = 'nc' end
        end
        if (bot['strategy'] == nil) then
            bot['strategy'] = {nc = {}, co = {}}
        end
        bot['strategy'][type] = list
    end
end


OnWhisper('Strategies: nc, attack weak, food, bdps, stay', 'bot')
OnWhisper('Strategies: frost', 'bot')
print("nc:")
for k,i in pairs(botTable['bot']['strategy']['nc']) do print (' ' .. i) end
print("co:")
for k,i in pairs(botTable['bot']['strategy']['co']) do print (' ' .. i) end
