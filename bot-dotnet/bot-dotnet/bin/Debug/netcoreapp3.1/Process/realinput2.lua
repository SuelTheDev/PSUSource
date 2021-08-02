--[[
	//	BRM5 RAID AUTOFARM REWRITE
	//	AUTHOR: Nobody4931
	//	VERSION: v2.1.3a

	//	Because god knows I'm not
	//	grinding all that cash manually

	//	CHANGELOG:
	//	- Even more bug fixes
--]]

--[[ PROTOSMASHER COMPATIBILITY ]]
local getgc               = getgc or get_gc_objects
local getgenv             = getgenv or function() return _G end
local checkcaller         = checkcaller or is_protosmasher_caller
local setreadonly         = setreadonly or make_writable
local newcclosure         = newcclosure or protect_function or function(F) return F end
local getnilinstances     = getnilinstances or get_nil_instances
local getnamecallmethod   = getnamecallmethod or get_namecall_method

--[[ PREVENT MULTIPLE EXECUTIONS ]]
if (getgenv().NS_BRM5_AUTOFARM == true) then return end
getgenv().NS_BRM5_AUTOFARM = true

--[[ SERVICES ]]
local Teams               = game:GetService("Teams")
local Debris              = game:GetService("Debris")
local CoreGui             = game:GetService("CoreGui")
local Players             = game:GetService("Players")
local Lighting            = game:GetService("Lighting")
local RunService          = game:GetService("RunService")
local GuiService          = game:GetService("GuiService")
local StarterGui          = game:GetService("StarterGui")
local HttpService         = game:GetService("HttpService")
local VirtualUser         = game:GetService("VirtualUser")
local TweenService        = game:GetService("TweenService")
local UserInputService    = game:GetService("UserInputService")
local CollectionService   = game:GetService("CollectionService")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")

--[[ VARIABLES ]]
local LocalPlayer         = Players.LocalPlayer
local Mouse               = LocalPlayer:GetMouse()
local Camera              = workspace.CurrentCamera
local GuiInset            = GuiService:GetGuiInset()

local PlayerGui           = LocalPlayer:WaitForChild("PlayerGui")
local Backpack            = LocalPlayer:WaitForChild("Backpack")

local Character           = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid            = Character:WaitForChild("Humanoid")
local RootPart            = Character:WaitForChild("HumanoidRootPart")

local Main                = {}
local Funcs               = {}
local Loops               = {}
local Client              = {}

do --[[ FUNCTIONS ]]
	function Funcs:CreateLoop(Name, Function, Delay, ...)
		if (Loops[Name] ~= nil) then return end

		Loops[Name] = {}
		Loops[Name]["Running"] = false
		Loops[Name]["Destroy"] = false
		Loops[Name]["Loop"]    = coroutine.create(function(...)
			while (not Loops[Name].Destroy) do
				if (Loops[Name].Running) then
					Function(...)
				end

				if (type(Delay) == "userdata") then
					Delay:Wait()
				else
					wait(Delay)
				end
			end
			Loops[Name] = nil
		end)
	end

	function Funcs:RunLoop(Name, Function, Delay, ...)
		if (Loops[Name] == nil) then
			self:CreateLoop(Name, Function, Delay, ...)
		end
		if (Loops[Name].Running) then return end

		Loops[Name].Running = true
		local Success, Output = coroutine.resume(Loops[Name].Loop)
		if (not Success) then
			warn("Loop '" .. Name .. "' errored!")
			error(Output)
		end
	end

	function Funcs:ContLoop(Name)
		if (Loops[Name] == nil) then return end
		Loops[Name].Running = true
	end

	function Funcs:StopLoop(Name)
		if (Loops[Name] == nil) then return end
		Loops[Name].Running = false
	end

	function Funcs:DestroyLoop(Name)
		if (Loops[Name] == nil) then return end
		Loops[Name].Destroy = true
	end

	function Funcs:DeepCopy(Original)
		local Copy
		if (type(Original) == "table") then
			Copy = {}
			for I,V in pairs(Original) do
				Copy[Funcs:DeepCopy(I)] = Funcs:DeepCopy(V)
			end
			setmetatable(Copy, Funcs:DeepCopy(getmetatable(Original)))
		else
			Copy = Original
		end
		return Copy
	end

	function Funcs:GetClosestPlayer(MaxDistance, TeamCheck, CharCheck)
		local NearestDist = math.huge
		local NearestPlay = nil

		for I,V in pairs(Players:GetPlayers()) do
			if (V ~= LocalPlayer) and (V.Character) and (not TeamCheck or TeamCheck(V)) then
				local VCharacter = V.Character
				local VHumanoid  = VCharacter:FindFirstChild("Humanoid")
				local VRootPart  = VCharacter:FindFirstChild("HumanoidRootPart")

				if (VCharacter.Parent) and (VHumanoid) and (VRootPart) and (VHumanoid.Health > 0) and (not CharCheck or CharCheck(VCharacter)) then
					local Distance = (RootPart.Position - VRootPart.Position).Magnitude
					if (Distance <= MaxDistance) and (Distance < NearestDist) then
						NearestDist = Distance
						NearestPlay = V
					end
				end
			end
		end

		return NearestPlay, NearestDist
	end

	function Funcs:GetClosestPlayerInFOV(MaxDistance, MaxDelta, TeamCheck, CharCheck)
		local NearestDist = math.huge
		local NearestPlay = nil

		for I,V in pairs(Players:GetPlayers()) do
			if (V ~= LocalPlayer) and (V.Character) and (not TeamCheck or TeamCheck(V)) then
				local VCharacter = V.Character
				local VHumanoid  = VCharacter:FindFirstChild("Humanoid")
				local VRootPart  = VCharacter:FindFirstChild("HumanoidRootPart")

				if (VCharacter.Parent) and (VHumanoid) and (VRootPart) and (VHumanoid.Health > 0) and (not CharCheck or CharCheck(VCharacter)) then
					if ((RootPart.Position - VRootPart.Position).Magnitude <= MaxDistance) then
						local CamPos, Visible   = Camera:WorldToViewportPoint(VRootPart.Position)
						local Distance          = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CamPos.X - GuiInset.X, CamPos.Y - GuiInset.Y)).Magnitude

						if (Visible) and (Distance <= MaxDelta) and (Distance < NearestDist) then
							NearestDist = Distance
							NearestPlay = V
						end
					end
				end
			end
		end

		return NearestPlay, NearestDist
	end
end

do --[[ MAIN ]]
	Main = {
		Company  = "Nobody's Stuff",
		Product  = "BRM5 Autofarm",
		Version  = "v2.1.3a",
		MOTD     = "Imagine grinding :dankmem:",

		Gun      = nil,
		Status   = nil,
		Crates   = {},
		Duffels  = {},

		World    = nil,
		Raycast  = nil,
		Enemies  = nil,
		Outpost  = nil,
		Exchange = nil
	}

	function Main.Teleport(Position)
		RootPart.Velocity = Vector3.new(0, 0, 0)
		RootPart.CFrame   = Position
	end

	function Main.GetGun()
		Client:InvokeServer("equipTool", 0)
		Client:InvokeServer("equipTool", 1)
		wait()
		for I,V in pairs(getgc(true)) do
			if (type(V) == "table") and (getmetatable(V)) and (rawget(V, "_alive")) and (rawget(V, "_ammo")) then
				Main.Gun = V
				return true
			end
		end
		return false
	end

	function Main.Shoot(Part)
		local BulletUUID   = HttpService:GenerateGUID(false)
		local Trajectories = {}

		Main.Gun._ammo = Main.Gun._ammo - 1
		for I = 1, Main.Gun._data.stats.bullets do
			table.insert(Trajectories, { Part.Position.X, Part.Position.Y, Part.Position.Z + 1 })
		end

		Client:FireServer("activateTool", "discharge", BulletUUID, 0, Trajectories)
		for I = 1, Main.Gun._data.stats.bullets do
			Client:FireServer("activateTool", "land", BulletUUID .. I, Part:GetFullName(), { 0, 0, 0 })
		end
	end

	function Main.TryKill(Enemy)
		repeat until (Main.GetGun()) or (Main.Status ~= "ATTACK")

		local EHumanoid = Enemy["Humanoid"]
		local ERootPart = Enemy["HumanoidRootPart"]
		local EHead     = Enemy["Head"]

		local Ignore   = CollectionService:GetTagged("RayIgnore")
		table.insert(Ignore, Character)
		table.insert(Ignore, Enemy)

		repeat RunService.RenderStepped:Wait()
			if (Main.Gun._ammo <= 0) then
				Main.Status = "REFILL"
				break
			end

			--local Desired     = EHead.CFrame * CFrame.new(math.random(-75, 75) / 10, 500, math.random(-75, 75) / 10)
			local Desired     = ERootPart.CFrame * CFrame.new(math.random(-250, 250) / 10, math.random(-50, 50) / 10, math.random(-250, 250) / 10)
			local _, Position = workspace:FindPartOnRayWithIgnoreList(Ray.new(ERootPart.Position, Desired.Position - ERootPart.Position), Ignore, false, true)

			RootPart.Velocity = Vector3.new(0, 0, 0)
			RootPart.CFrame   = CFrame.new(Position)
			wait()
			Main.Shoot(EHead)
		until (not EHumanoid) or (not EHumanoid.Parent) or (EHumanoid.Health <= 0) or (Main.Status ~= "ATTACK")
	end

	function Main.TrySell(Duffel)
		repeat
			Main.Teleport(Duffel.CFrame)
			wait(0.25)
			Client:FireServer("interactObject", 1)
			wait()
		until (Character:FindFirstChild("Objective"))

		repeat
			Main.Teleport(Main.Exchange.HumanoidRootPart.CFrame)
			wait(0.25)
		until ((RootPart.Position - Main.Exchange.HumanoidRootPart.Position).Magnitude <= 6.5)

		wait(0.25)
		Client:FireServer("interactObject", 1)
		wait(1.25)
		Client:FireServer("npcTalk", 2)
		wait(0.25)
	end

	function Main.HealthCheck()
		local Percentage = Humanoid.Health / Humanoid.MaxHealth
		Main.Status = Percentage <= 0.0 and "WAIT" or (Percentage <= 0.8 and "HEAL" or Main.Status)
	end

	function Main.AntiAfk()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new(0, 0))
	end

	function Main.Autofarm() -- Code that will give you an aneurysm if you read it
		if (Main.Status == "WAIT") then
			return
		elseif (Main.Status == "ATTACK") then
			Main.Teleport(Main.Outpost.CFrame * CFrame.new(-15, 0, 0))

			for I,V in pairs(Main.Enemies:GetChildren()) do
				if (V:IsA("Model")) and (V:FindFirstChild("Humanoid")) and (V:FindFirstChild("HumanoidRootPart")) and (V:FindFirstChild("Head")) and (V:FindFirstChild("LowerTorso")) then
					local VHead     = V["Head"]
					local VHumanoid = V["Humanoid"]
					local VRootPart = V["HumanoidRootPart"]
					local VTorso    = V["LowerTorso"]
					
					if (VHumanoid.Health > 0) and (not VTorso:FindFirstChild("Data")) and ((VRootPart.Position - Main.Outpost.Position).Magnitude <= 3000) then
						if (Main.Status == "ATTACK") then
							Main.TryKill(V)
							wait()
							if (#Main.Duffels > 0) then
								Main.Status = "STEAL"
							end
						end
					end
				end
			end
		elseif (Main.Status == "REFILL") then
			Main.Teleport(Main.Crates["refillAmmo"][math.random(1, #Main.Crates["refillAmmo"])].CFrame)
			wait(0.25)

			Main.GetGun()
			Client:FireServer("interactObject", 1)

			wait(0.25)
			Main.Status = "ATTACK"
		elseif (Main.Status == "HEAL") then
			Main.Teleport(Main.Crates["takeMedical"][math.random(1, #Main.Crates["takeMedical"])].CFrame)
			wait(0.25)

			repeat RunService.RenderStepped:Wait()
				Client:FireServer("interactObject", 1)
				Client:FireServer("useMedical", 1)
			until (Humanoid.Health / Humanoid.MaxHealth >= 1)

			repeat wait(0.25)
				local Despawned = true
				for I,V in pairs(Main.Enemies:GetChildren()) do
					if (V:IsA("Model")) and (V:FindFirstChild("Humanoid")) and (V:FindFirstChild("HumanoidRootPart")) and (V:FindFirstChild("Head")) and (V:FindFirstChild("LowerTorso")) then
						local VHead     = V["Head"]
						local VHumanoid = V["Humanoid"]
						local VRootPart = V["HumanoidRootPart"]
						local VTorso    = V["LowerTorso"]
						
						if (VHumanoid.Health > 0) and (not VTorso:FindFirstChild("Data")) and ((VRootPart.Position - Main.Outpost.Position).Magnitude <= 3000) then
							Despawned = false
							break
						end
					end
				end

				Main.Status = Despawned and "ATTACK" or "HEAL"
			until (Main.Status ~= "HEAL")
		elseif (Main.Status == "STEAL") then
			for I,V in pairs(Main.Duffels) do
				Main.TrySell(V)
			end

			wait(0.25)
			Main.Duffels = {}
			Main.Status  = "HEAL"
		end
	end

	function Main:Console(Sender, Text, Color)
		local Channel = nil
		for I,V in pairs(debug.getupvalues(Client.InterfaceHandler.AddRadio)) do
			if (type(V) == "string") and (string.len(V) == 3) then
				Channel = V
				break
			end
		end

		Client.InterfaceHandler:AddRadio(
			setmetatable({
				["Name"]      = Sender,
				["UserId"]    = 0,
				["TeamColor"] = {
					["Color"] = Color or Color3.new(1, 1, 1)
				}
			}, { __index == LocalPlayer }),
			Text, Channel)
	end

	function Main:Alert(Text, Color)
		coroutine.wrap(Client.InterfaceHandler.ScreenMessage)(Client.InterfaceHandler, Text, Color or Color3.new(1, 1, 1))
	end

	function Main:GetCrates(Storage, Type)
		for I,V in pairs(Storage:GetDescendants()) do
			if (V:IsA("BasePart")) and (V:FindFirstChild("Data")) and (V:FindFirstChild("Gui")) then
				local CrateData = HttpService:JSONDecode(V.Data.Value)
				if (type(CrateData) == "table") and (type(CrateData[1]) == "table") and (CrateData[1][1] == Type) then
					if (not self.Crates[CrateData[1][1]]) then
						self.Crates[CrateData[1][1]] = {}
					end

					table.insert(self.Crates[CrateData[1][1]], V)
				end
			end
		end
	end

	function Main:RemoveFallDamage() -- Fuck fall damage
		Client.FireServer   = Client.Network.FireServer
		Client.InvokeServer = Client.Network.InvokeServer

		for I,V in pairs(getgc(true)) do
			if (type(V) == "table") and (not getmetatable(V)) and (V.FireServer) and (V.InvokeServer) and (V.OnEvent) and (V.OnFunction) then
				V.FireServer = function(_, ...)
					local Arguments = {...}

					if (Arguments[1] == "fallDamage") then return end
					if (Arguments[1] == "banUser") then return end
					if (Arguments[1] == "kickUser") then return end

					return Client.FireServer(_, ...)
				end
			end
		end

		do -- I hate metatables but sadly it couldn't be avoided this time :c
			local MT       = getrawmetatable(game)
			local Namecall = MT.__namecall
			setreadonly(MT, false)

			MT.__namecall = newcclosure(function(self, ...)
				local Arguments = {...}
				local Method    = getnamecallmethod()

				if (not checkcaller()) and (self == Humanoid) and (Method == "TakeDamage") then
					return
				end

				return Namecall(self, ...)
			end)
		end
	end

	function Main:EmplaceHook() -- Because getting downed breaks everything
		for I,V in pairs(getgc(true)) do
			if (type(V) == "table") and (not getmetatable(V)) and (V.setCharacterDowned) then
				local SetCharacterDowned = V.setCharacterDowned
				V.setCharacterDowned = function(Downed, DeathTime, ...)
					if (Downed) then
						self.Status = "WAIT"

						Character:BreakJoints()
						Humanoid.Health = 0
					end

					return SetCharacterDowned(Downed, DeathTime, ...)
				end
			end
		end
	end

	function Main:Init() -- Really god damn messy code
		self.World     = workspace:WaitForChild("Custom")
		self.Raycast   = workspace:WaitForChild("Raycast")
		self.Enemies   = Main.World:WaitForChild("-1")
		self.Outpost   = Main.Enemies:WaitForChild("Outpost1")
		self.Exchange  = Main.Raycast:WaitForChild("IE")

		for I,V in pairs(getnilinstances()) do
			if (V:IsA("ModuleScript")) then
				if (V.Name == "CharacterHandler") then
					Client.CharacterHandler = require(V)
				end
				if (V.Name == "InterfaceHandler") then
					Client.InterfaceHandler = require(V)
				end
				if (V.Name == "FirearmInventory") then
					Client.FirearmInventory = require(V)
				end
			end
		end

		for I,V in pairs(getgc(true)) do
			if (type(V) == "table") and (not getmetatable(V)) and (V.FireServer) and (V.InvokeServer) and (V.OnEvent) and (V.OnFunction) then
				Client.Network = V
				break
			end
		end

		assert(Client.CharacterHandler ~= nil, "CharacterHandler not found!")
		assert(Client.InterfaceHandler ~= nil, "InterfaceHandler not found!")
		assert(Client.FirearmInventory ~= nil, "FirearmInventory not found!")
		assert(Client.Network ~= nil, "Network not found!")

		self.Status = "ATTACK"

		self:GetCrates(self.World:WaitForChild("0"):WaitForChild("Airbase"):WaitForChild("Props"),             "takeMedical")
		self:GetCrates(self.World:WaitForChild("0"):WaitForChild("MountainOutpost"):WaitForChild("Interacts"), "refillAmmo")

		self:RemoveFallDamage()
		self:EmplaceHook()

		Funcs:RunLoop("AUTOFARM",     self.Autofarm,    RunService.RenderStepped)
		Funcs:RunLoop("ANTI_AFK",     self.AntiAfk,     LocalPlayer.Idled)
		--Funcs:RunLoop("HEALTH_CHECK", self.HealthCheck, RunService.RenderStepped)

		LocalPlayer.CharacterAdded:Connect(function(C)
			Character = C
			Humanoid  = C:WaitForChild("Humanoid")
			RootPart  = C:WaitForChild("HumanoidRootPart")

			self.Status = "ATTACK"
		end)

		self.Enemies.DescendantAdded:Connect(function(D)
			repeat wait() until (D) and (D.Parent)
			if (D.Name == "Bag") and (D:FindFirstChild("Data")) then
				table.insert(self.Duffels, D)
			end
		end)
	end
end

--[[ INITIALIZATION ]]
print("Main initializing...")
Main:Init()

Main:Alert(Main.Company,                        Color3.fromRGB(118, 38, 255))
Main:Alert(Main.Product .. " " .. Main.Version, Color3.fromRGB(118, 38, 255))
Main:Alert(Main.MOTD)

Main:Console("[Nobody's Stuff]", Main.Product .. " successfully loaded.",           Color3.fromRGB(154, 108, 255))
Main:Console("[Nobody's Stuff]", "You are running version " .. Main.Version .. "!", Color3.fromRGB(154, 108, 255))

print("READY")