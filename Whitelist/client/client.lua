getgenv().key = "test";
--[[ addming later
local start = tick()
local b = (http_request or request or (syn and syn.request or error))({
    Url = "http://borks.club:8080/check2",
    Method = "POST",
    Body = game:GetService("HttpService"):JSONEncode({
        Script = "Main",
        Key = key
    }),
    Headers = {
        ["Content-Type"] = "application/json"
    }
}).Body
repeat until b == "\1"
]]
-- a
--variables
local host = "http://localhost/%s";
local key = getgenv().key;
local exploit = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or (secure_load and "Sentinel") or (pebc_execute and "ProtoSmasher") or (is_sirhurt_closure and "SirHurt") or (KRNL_LOADED and "Krnl") or nil
local req = (exploit == "Synapse" and syn.request) or ((exploit == "Sentinel" or exploit == "Krnl") and request) or (exploit == "ProtoSmasher" or exploit == "SirHurt" and http_request) 
-- check some stuff
if not exploit then 
    game:GetService("Players").LocalPlayer:Kick("Unsupported exploit");
end

if not key then
    game:GetService("Players").LocalPlayer:Kick("Key not found");
end


--util
function findindex(table, value, multi)
    if not multi then
        for i,v in next, table do 
            if v == value then 
                return i;
            end
        end
    else 
        local result = {};
        while true do 
            for i,v in next, table do 
                if v == value and (not findindex(result, i)) then
                    result[i] = i;
                    continue;
                end
            end
            break;
        end
        return result;
    end
        
    return nil;
end

--crack report
local function crack_log(reason_id) 
    local reason = hash(reason_id) --internal reason database to prevent debugging
    local success,body = pcall(http_service.JSONEncode,http_service,{value=reason})
    assert(success,body)
    local response = r({
        Url = host:format("check1"),
        Method = "POST",
        Body = body,
        Headers = {
            ["Content-Type"] = "application/json"
        }
    })
    --[[ Uncomment for release
    game.Players.LocalPlayer:Kick("Whitelist failed [Error Code "..tostring(reason_id).."]")
    while true do end
    ]]
    print("Whitelist failed [Error Code "..tostring(reason_id).."]")
    return false
end
local init
if syn then
    init = getfenv(saveinstance).script
end
--anti hook
script.Name = "\1"
local function search_hookfunc(tbl)
    for i,v in pairs(tbl) do
        local s = getfenv(v).script
        if is_synapse_function(v) and islclosure(v) and s and s ~= script and s.Name ~= "\1" and s ~= init then
            if unpack(debug.getconstants(v)):match("hookfunc") then
                --while true do end
                break
            end
        end
    end
end
search_hookfunc(getgc())
search_hookfunc = nil

--anti eq
function pog_eq(v1, v2)
    local start = tick();
    local eq_table = {values = {}, indexes = {}};
    
    local v3 = tostring(v1);
    local v4 = tostring(v2);

    for i = 10, 14 do 
        v3, v4 = v4:reverse():sub(0, v4:len()), v3:reverse():sub(0, v3:len());
        eq_table.values[i*10+math.random(math.random(1,100),math.random(1000,10000))] = v3;
        eq_table.values[i*20+math.random(math.random(1,100),math.random(1000,10000))] = v4;
    end 
    
    local stack = debug.getstack(1);
    for i,v in next, eq_table.values do 
        if not table.find(stack, v) then 
            return false;
        else 
            for i2,v2 in next, findindex(stack,v,true) do 
                eq_table.indexes[i] = v2;
                debug.setstack(1, v2, i)
            end
        end
    end
    local newstack = debug.getstack(1);
    
    return (v1 == v2) and (eq_table.values[v1] == eq_table.values[v2]) and (stack[eq_table.indexes[v1]] == stack[eq_table.indexes[v2]]);
end

local function generate_order()
    math.randomseed(tick()/4)
    local options = {}
    local new_options = {}
    while #options ~= 3 do
        local num = math.random(1,3) 
        if not new_options[num] then
            table.insert(options,num)
            new_options[num] = true
        end
    end
    return options
end
local function bork_eq(v1,v2)
    math.randomseed(tick()/4)
    local charset = "ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz1234567890"
    if type(v1) == "string" and type(v2) == "string" then
        local length1,length2,chars_1,chars_2 = #v1,#v2,{},{}
        v1:gsub(".",function(s)chars_1[#chars_1+1]=s end)
        v2:gsub(".",function(s)chars_2[#chars_2+1]=s end)
        if (length1~=length2) then
            return false
        end
        local start = math.random(1,length1)
        local bool = true
        for i,v in pairs(generate_order()) do
            if v == 1 then
                for i=1,start do
                    local operation_type = math.random(1,4)
                    if operation_type == 1 then
                        if not not (chars_1[i] ~= chars_2[i]) then bool = false end
                    elseif operation_type == 2 then
                        if not (chars_1[i] == chars_2[i]) then bool = false end 
                    elseif operation_type == 3 then
                        if not not (chars_2[i] ~= chars_1[i]) then bool = false end
                    elseif operation_type == 4 then
                        if not (chars_2[i] == chars_1[i]) then bool = false end 
                    end
                end  
            elseif v == 2 then
                math.randomseed(tick()/2)
                for i=1,math.random(1,20) do
                    local num_1,num_2 = math.random(1,#charset),math.random(1,#charset)
                    local char_1,char_2 = charset:sub(num_1,num_1),charset:sub(num_2,num_2)
                    local operation_type = math.random(1,4)
                    if operation_type == 1 then
                        if not not (num_1 ~= num_2) then end
                    elseif operation_type == 2 then
                        if not (num_1 == num_2) then end 
                    elseif operation_type == 3 then
                        if not not (num_1 ~= num_2) then end
                    elseif operation_type == 4 then
                        if not (num_1 == num_2) then end 
                    end
                end  
            elseif v == 3 then
                for i=1,length1-start do
                    local operation_type = math.random(1,4)
                    if operation_type == 1 then
                        if not not (chars_1[i] ~= chars_2[i]) then bool = false end
                    elseif operation_type == 2 then
                        if not (chars_1[i] == chars_2[i]) then bool = false end 
                    elseif operation_type == 3 then
                        if not not (chars_2[i] ~= chars_1[i]) then bool = false end
                    elseif operation_type == 4 then
                        if not (chars_2[i] == chars_1[i]) then bool = false end 
                    end
                end
            end
        end
        return bool
    else 
        return false
    end
end

function main_eq(v1, v2)
    local v3 = tostring(v1);
    local v4 = tostring(v2);
	local c1 = not(v1<v2 or v1>v2);
	local c2 = (#v3 >= #v4) and (#v3 <= #v4);
    local c3 = v3:find(v4);
    local c4 = pog_eq(v1, v2); --might remove this from base eq since its slow
    local c5 = bork_eq(v1, v2);
	return newcclosure(function()
	    if c1 and c2 and c3 and c4 and v5 then 
	        return true 
	    else 
	        return false 
	    end 
	end)()
end

-- eq integrity checks
local function random_string(len)
    math.randomseed(tick()/4)
    local charset = "ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz1234567890"
    local built_string = ""
    for i=1,len do
        local char = math.random(1,#charset)
        built_string = built_string..charset:sub(char,char)
    end
    return built_string
end
local str = random_string(64)
if not bork_eq(str,str) then
    crack_log("1")
    --while true do end
end
if bork_eq(str,game) then
    crack_log("1")
    --while true do end
end

-- basic functions
function request(url)
    return r({
        Url = url;
    }).Body;
end

--anti detour func
local funcs = {}
local function check(tbl)
    local bool = false
    for i,v in pairs(tbl) do 
        if type(v) == "function" and getfenv(v).script ~= script and getfenv(v).script ~= init then
            bool = true
        elseif type(v) == "table" then
            if check(v) then
                bool = true
            end
        end
    end
    return bool 
end
if check(getgenv()) then
    crack_log("2")
    --while true do end
end
--anti math.random hook
if getgenv().math.random ~= getrenv().math.random then
    crack_log("3")
    --while true do end
end
math.randomseed(tick())
local num1 = math.random(1,10^9)
math.randomseed(tick()/2)
local num2 = math.random(1,10^9)
if num1 == num2 then
    crack_log("3")
    --while true do end
end
-- anti string.sub hook 
if getgenv().string.sub ~= getrenv().string.sub then 
    crack_log("3");
    --while true do end
end
local str = random_string(10);
if string.sub(str, 1, math.random(1,5)) == string.sub(str, 5, math.random(5,10)) then 
    crack_log("3")
end
local nstr = "";
local strt = {};
for i = 1, 10 do
    local s = string.sub(str,i,i);
    data[i] = s
    nstr = nstr..s
end

if (str ~= nstr) or (str ~= table.concat(strt)) then 
    print('bad')
end
--// Anti Http-Spy
local hook = hookfunction or hookfunc or replace_closure
local hooks = {}
pcall(function() -- fuck compatability me and my homies hate compatibility
    hooks[1] = hook(print,function(...)if(tostring(...):match(":8080")) then crack_log("9")return ""end return hooks[1](...)end)
    hooks[2] = hook(warn,function(...)if(tostring(...):match(":8080")) then crack_log("9")return ""end return hooks[2](...)end)
    hooks[3] = hook(appendfile,function(...)if(tostring(...):match(":8080")) then crack_log("9")return ""end return hooks[3](...)end)
    hooks[4] = hook(writefile,function(...)if(tostring(...):match(":8080")) then crack_log("9")return ""end return hooks[4](...)end)
end)
game:HttpGet(host:format("/script.lua"))

--// Anti os.time Hook
if getgenv().os.time ~= getrenv().os.time then
    crack_log("3")
    --while true do end
end
local bool = true
spawn(function()
    bool = false
    local old = os.time()
    while wait(2) do
        local time = os.time()
        if time == old then
            old = time
            crack_log("3")
            break
        end
        local date1 = os.date("!*t",time)
        local date2 = os.date("!*t",time+60)
        if date1.min == 59 and date2.min ~= 0 then
            crack_log("3")
        elseif date1.min+1 ~= date2.min then
            crack_log("3")
        end
    end
end)
wait()
while bool do end

--anti os.date hook
if getgenv().os.date ~= getrenv().os.date then
    crack_log("3")
end
--anti JMP
local function tween_check(var)
    local frame = Instance.new("Frame")
    frame.Parent = game.Workspace
    frame:TweenSize(UDim2.new(1/0,1/0,1/0,1/0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,100)
    frame:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.1,var)
    wait()
    if frame.Size.X.Scale == 1/0 then
        crack_log("4")
    end
    --for i=1,frame.Size.X.Scale do end
end
local str = random_string(64)
local part = Instance.new("Part")
local part2 = Instance.new("Part",part)
local part3 = Instance.new("Part",part2)
part3.Name = str
local function ffc_check(var)
    if part:FindFirstChild(str,var) ~= part3 then
        crack_log("4")
        --while true do end
    end
end

--encryption

--ape finder 1
local fake_ips = {
    "74.170.79.8",
    "152.9.51.74",
    "234.158.28.147",
    "118.97.2.102",
    "34.32.180.131",
    "240.146.15.219",
    "112.240.234.51",
    "76.181.38.219",
    "185.92.44.199",
    "236.212.171.251",
    "135.63.48.202",
    "256.155.113.237",
    "104.221.50.118",
    "170.3.99.29",
    "11.251.131.134",
    "8.237.226.113",
    "191.11.115.201",
    "243.119.135.108",
    "119.62.91.197",
    "28.7.184.236",
    "79.89.34.233",
    "41.119.7.196",
    "48.172.177.36",
    "0.14.155.222",
    "119.235.232.247"
}

local fake_webhooks = {}

for i = 1,100 do 
   local fakeips = math.random(1,255).."."..math.random(1,255).."."..math.random(1,255).."."..math.random(1,255) -- i know str.format exists I was lazy shut up
   table.insert(fake_ips,fakeips)
end

local char = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

local number = {'1',"2","3","4","5","6","7","8","9"}

function getRandomString(length)
	local str = ''
	for i=1,length do
	local randomchar = char[math.random(1,#char)]
	randomchar = string.upper(randomchar)
	str = str .. randomchar
	end
	return str
end

function getrandomnumber(length)
	local str = ''
	for i=1,length do
	local randomchar = number[math.random(1,#number)]
	randomchar = string.upper(randomchar)
	str = str .. randomchar
	end
	return str
end

for i = 1,1000 do 
   local a =  math.random(1,3)
   local msg 
   if a == 1 then
     msg = "https://canary.discord.com/api/webhooks/"..getrandomnumber(18).."/"..getRandomString(68)
   elseif a == 2 then
     msg = "https://ptb.discord.com/api/webhooks/"..getrandomnumber(18).."/"..getRandomString(68)

   elseif a == 3 then
     msg = "https://discord.com/api/webhooks/"..getrandomnumber(18).."/"..getRandomString(68)
   end
   table.insert(fake_webhooks,msg)
end
-- Honeypot users into thinking this is a plaintext ip database
local real_ip = game:HttpGet("https://api.ipify.org") 
for i,v in pairs(fake_ips) do
    if v == real_ip then
        crack_log("5")
    end
end

local disabled = true;
function disableFunc(func)
       hookfunction(func, newcclosure(function()
              if disabled then
                game:shutdown()
              end
     end))
end


DisableFunc(print)
DisableFunc(warn)
DisableFunc(error)
DisableFunc(setclipboard)
DisableFunc(rconsoleprint)
DisableFunc(rconsolewarn)
DisableFunc(rconsoleerr)
DisableFunc(printconsole)
DisableFunc(rconsolename)
DisableFunc(writefile)
DisableFunc(appendfile)


local backupHF = hookfunc

hookfunction(hookfunction,newcclosure(function(func) 
    for i,v in next,{print,warn,error,rconsolewarn,rconsoleerr,printconsole,writefile,appendfile,setclipboard,rconsoleprint} do
        if func==v then
            return game:shutdown()
        end
    end        
    return backupHF(func)
end))
--check auth
--[[
if request(host.."auth/checkauth?key="..key) == "true" then 
    print'whitelisted';
else 
    print'not whitelisted';
end
]]
