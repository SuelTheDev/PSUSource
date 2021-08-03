local function CountClosures()
    local Count = 0
    for i,v in next, getreg() do
        if typeof(v) == 'function' and is_synapse_function(v) and typeof(i) == 'string' and i:len() == 16 then
            Count += 1
      end
    end
    return Count > 53 and 53 < Count
end
local Check = CountClosures()
if Check then
game.Players.LocalPlayer:Kick('Failed')
wait(0.25)
while true do end
end
local userid = game:GetService('Players').LocalPlayer.UserId
local request = game:HttpGetAsync ("https://pacific.stellaris.gq/waifupro/is_wl?user_id="..userid)
response = game:HttpGetAsync ("https://pacific.stellaris.gq/waifupro/is_wl?user_id="..userid)
local json = game:GetService("HttpService"):JSONDecode(response)
if json ["whitelisted"] == true then
    print("Passed")
else
    game:service('Players').LocalPlayer:Kick('Failed')
end