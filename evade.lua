local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local notifs =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true)
)()
local changelog = game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/misc/clogevade.lua")
local esp =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/SimpleHighlightESP.lua")
)()

if rconsoleprint then
	rconsoleprint(changelog)
end

-- [[ LOADING ]]

game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
repeat
	task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
repeat
	task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")

-- [[ VARS ]]

local eventTaunts = {
	"CursedFlashlight",
	"WerewolfHowl",
	"Tombstone",
	"Baghead",
	"DemonHorns",
	"Candlehead",
	"ImpaledHead",
	"WitchHat",
	"DualBoneSwords",
	"LavaLamp",
	"SpiderInfestation",
	"PumpItUp",
	"VampireOutfit",
	"OminousDemise",
	"BlueHallowedFace",
	"GreenHallowedFace",
	"OrangeHallowedFace",
	"GhostCatcher",
	"DemonWings",
	"CandleLamp",
	"FungalOvergrowth",
	"Reanimated",
	"ToxicInferno",
	"Monoculi",
	"WretchedWings",
	"PhantomBlades",
	"AmethystStaff",
	"GhostAbduction",
	"Telespell",
	"Thriller",
	"BluefirePortal",
	"HellfirePortal",
	"SeekingEye",
	"EyeCorruption",
	"Necromonicon",
	"FrightFunk",
	"BlueUFOAbduction",
	"PinkUFOAbduction",
	"Cauldronhead",
	"HellishGrip",
	"HauntedIredescence",
	"CobwebTrap",
	"MechanicalScythe",
	"DragonSkull",
	"GhostFriend",
	"SpilledCauldron",
	"WardingLantern",
	"RockinStride",
	"Rockin'Stride",
	"DarkTendrils",
	"AlchemistBelt",
	"Frankenstein",
	"ElectrifyingGuitar",
	"BatVision",
	"BananaSuit",
	"EyeIllusions",
	"BroomOfDoom",
	"BloodMoon"
}

getgenv().respawning = false
getgenv().flly = false
getgenv().cframespeed = false
getgenv().cfspeed = 0
getgenv().autobuy = false

-- [[ FUNCTIONS ]]

function f()
	UIS = game:GetService("UserInputService")
	while getgenv().cframespeed and task.wait() do
		if getgenv().cfspeed ~= getgenv().cfspeed then
			break
		end
		repeat
			task.wait()
		until game.Players.LocalPlayer.Character or workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
		You = game.Players.LocalPlayer.Character or workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
		hrp = You:WaitForChild("HumanoidRootPart", 0.1)
		if not hrp then
			repeat
				task.wait()
			until You:FindFirstChild('HumanoidRootPart')
		end
		hrp = You.HumanoidRootPart
		if UIS:IsKeyDown(Enum.KeyCode.W) then
			hrp.CFrame =
                hrp.CFrame * CFrame.new(0, 0, -getgenv().cfspeed)
		end
		if UIS:IsKeyDown(Enum.KeyCode.A) then
			hrp.CFrame =
            hrp.CFrame * CFrame.new(-getgenv().cfspeed, 0, 0)
		end
		if UIS:IsKeyDown(Enum.KeyCode.S) then
			hrp.CFrame =
                hrp.CFrame * CFrame.new(0, 0, getgenv().cfspeed)
		end
		if UIS:IsKeyDown(Enum.KeyCode.D) then
			hrp.CFrame =
                hrp.CFrame * CFrame.new(getgenv().cfspeed, 0, 0)
		end
	end
end

function bb()
	while getgenv().breakbots do
		n = math.random(1, 10000000)
		z = math.random(200, 8000)
		x = math.random(1, 10000000)
		if not getgenv().breakbots then
			break
		end
		if game:GetService("Workspace").Game:WaitForChild('Map'):WaitForChild('Parts'):FindFirstChild("KillBricks") then
			game:GetService("Workspace").Game:WaitForChild('Map').KillBricks:Destroy()
		end
		task.wait()
		game.Workspace.Game.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame =
            CFrame.new(0, z, 0)
	end
end

function annoydown()
	if annoydowned then
		makeNotification("warning", "dot.hub | ywserasdfas;fls", "this will most likely break without Auto Respawn")
	end
	while task.wait() do
		if not getgenv().annoydowned then
			break
		end
		pcall(
            function()
			game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(250, 250, 250)
			for i, v in next, game:GetService("Workspace").Game.Players:GetDescendants() do
				if
                        v.IsA(v, "NumberValue") and v.Name == "Downed" and
                            not v.Parent.Parent.Parent:FindFirstChild("CarriedBy") and
                            game.Players[v.Parent.Parent.Parent.Name].Settings.CanBeCarried.Value == true
                     then
					local holder = v.Parent.Parent.Parent.Name
					local hold = workspace.Game.Players[holder]
					scrip =
                            require(
                            game:GetService("ReplicatedStorage").ModuleStorage.Interact.Interactions.Revive.Revive
                        )
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            CFrame.new(hold.HumanoidRootPart.Position)
					task.wait(0.3)
					game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder)
					task.wait(0.3)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 3000, 0)
					task.wait(0.2)
					game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder, true)
					task.wait(1)
				end
			end
		end
        )
	end
end

function makeNotification(type, head, body)
	notifs.new(type, head, body, true, 5)
end

function Simple_Create(base, name, trackername, studs)
	local bb = Instance.new("BillboardGui", game.CoreGui)
	bb.Adornee = base
	bb.ExtentsOffset = Vector3.new(0, 1, 0)
	bb.AlwaysOnTop = true
	bb.Size = UDim2.new(0, 6, 0, 6)
	bb.StudsOffset = Vector3.new(0, 1, 0)
	bb.Name = trackername
	local frame = Instance.new("Frame", bb)
	frame.ZIndex = 10
	frame.BackgroundTransparency = 0.3
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	local txtlbl = Instance.new("TextLabel", bb)
	txtlbl.ZIndex = 10
	txtlbl.BackgroundTransparency = 1
	txtlbl.Position = UDim2.new(0, 0, 0, -48)
	txtlbl.Size = UDim2.new(1, 0, 10, 0)
	txtlbl.Font = "ArialBold"
	txtlbl.FontSize = "Size12"
	txtlbl.Text = name
	txtlbl.TextStrokeTransparency = 0.5
	txtlbl.TextColor3 = Color3.fromRGB(255, 0, 0)
end

function ClearESP(espname)
	for _, v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == espname and v:isA("BillboardGui") then
			v:Destroy()
		end
	end
end

function nowaterdmg(t)
	for i, v in next, t:GetChildren() do
		if v.IsA(v, 'BasePart') then
			v.CanTouch = false
		end
	end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	if flly then
		repeat
			task.wait()
		until char:FindFirstChild('HumanoidRootPart')
		task.wait(3)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/bypassedfly.lua"))()
	end
end)

-- [[ MISC ]]

-- [[ GUI ]]

local lib =
    library:CreateWindow(
    {
	Name = "Evade 141ghost汉化",
	Themeable = {
		Info = "lol"
	}
}
)

local main =
    lib:CreateTab(
    {
	Name = "菜单"
}
)

local mesc =
    lib:CreateTab(
    {
	Name = "透视"
}
)

local misc =
    mesc:CreateSection(
    {
	Name = "FLASHES",
	Side = "Left"
}
)

local player =
    main:CreateSection(
    {
	Name = "Player",
	Side = "Left"
}
)

local settings =
    main:CreateSection(
    {
	Name = "Settings",
	Side = "Right"
}
)

local map =
    main:CreateSection(
    {
	Name = "地图",
	Side = "Right"
}
)

local troll =
    main:CreateSection(
    {
	Name = "Trolling",
	Side = "Right"
}
)

local farm =
    main:CreateSection(
    {
	Name = "挂机功能",
	Side = "Left"
}
)

-- [[ MAIN ]]

player:AddToggle(
    {
	Name = "自动重生",
	Flag = "ar",
	Callback = function(x)
		getgenv().respawning = x
		while task.wait(1) and respawning do
			if not getgenv().respawning then
				break
			end
			local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
			local stats = char:WaitForChild("StatChanges", 3)
			if stats == nil then
				return
			end
			if stats:FindFirstChild("Speed") and stats:FindFirstChild("Speed"):FindFirstChild("Downed") then
				game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
			end
		end
	end
}
)

player:AddToggle(
    {
	Name = "飞行（可能无效）",
	Callback = function(flyy)
		getgenv().flly = flyy
		if getgenv().flly then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/bypassedfly.lua"))()
		else
			for i, v in next, workspace:GetChildren() do
				if v.IsA(v, "BasePart") and v.Name ~= "Terrain" then
					v:Destroy()
				end
			end
		end
	end
}
)

player:AddToggle(
    {
	Name = "切换速度",
	Callback = function(c)
		getgenv().cframespeed = c
		f()
	end
}
)

player:AddToggle(
    {
	Name = '快速救人',
	Callback = function(fastrev)
		getgenv().far = fastrev
		if getgenv().far then
			workspace.Game.Settings:SetAttribute("ReviveTime", 2.25)
		else
			workspace.Game.Settings:SetAttribute('ReviveTime', 3)
		end
	end
}
)

player:AddButton(
    {
	Name = "不会倒下（失效）",
	Callback = function()
		if getgenv().gm then
			makeNotification('Info', 'dot.hub | GodMode', 'you are already in god mode silly')
			return
		end
		getgenv().gm = true
		pcall(
                function()
			for i, v in next, workspace.Game.Players:GetDescendants() do
				if v.IsA(v, "BindableEvent") and string.lower(v.Name) == "force" then
					v:Destroy()
				end
			end
			workspace.Game.Players.DescendantAdded:Connect(
                        function(v)
				task.wait()
				if v.IsA(v, "BindableEvent") and string.lower(v.Name) == "force" then
					v:Destroy()
				end
			end
                    )
		end
            )
	end
}
)

player:AddButton(
    {
	Name = "水对你没有伤害",
	Callback = function()
		if getgenv().nodmg then
			return
		end
		getgenv().nodmg = true
		nowaterdmg(game.Players.LocalPlayer.Character)
		game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
			repeat
				task.wait()
			until char:FindFirstChild('HumanoidRootPart')
			nowaterdmg(char)
		end)
	end
}
)

settings:AddSlider(
    {
	Name = "加速（可能失效）",
	Value = 0,
	Min = 3,
	Max = 5,
	Callback = function(ws)
		getgenv().cfspeed = ws
	end
}
)


map:AddButton(
    {
	Name = "移除空气墙",
	Callback = function()
		workspace.Game.Map.InvisParts:ClearAllChildren()
	end
}
)

map:AddButton(
    {
	Name = "传送到目标",
	Callback = function()
		hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		if workspace.Game.Map.Parts:FindFirstChild("Objectives") then
			for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
				if v.IsA(v, "Model") then
					hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
				end
			end
		end
	end
}
)

map:AddButton(
    {
	Name = "传送到倒下的人",
	Callback = function()
		for i, v in next, workspace.Game.Players:GetChildren() do
			if v:GetAttribute('Downed') then
				pcall(function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position)
				end)
			end
		end
	end
}
)

map:AddButton(
    {
	Name = "结束时间",
	Callback = function()
		makeNotification(
                "Info",
                "dot.hub | Map",
                '回合结束将在 ' .. game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD").Center.Vote.Info.Read.Timer.Text
            )
	end
}
)

farm:AddToggle(
    {
	Name = "自动挂机",
	Callback = function(bbb)
		getgenv().breakbots = bbb
		bb()
	end
}
)

troll:AddToggle(
    {
	Name = "打扰倒下的人？",
	Callback = function(down)
		getgenv().annoydowned = down
		annoydown()
	end
}
)

troll:AddToggle({
	Name = '使用工具',
	Callback = function(callback)
		getgenv().tspam = callback
		while tspam and task.wait() do
			if not tspam then
				break
			end
			for i, v in next, workspace.Game.Players:GetChildren() do
				if v and v:FindFirstChild('Equip') then
					v:FindFirstChild('Equip'):InvokeServer(2)
					continue
				else
					continue
				end
			end
		end
	end
})

misc:AddToggle(
    {
	Name = "透视机器人",
	Callback = function(besp)
		getgenv().botesp = besp
		task.spawn(
                function()
			while task.wait() do
				ClearESP('AI_Tracker')
				if not getgenv().botesp then
					break
				end
				pcall(function()
					local GamePlayers = workspace.Game.Players
					for i, v in pairs(GamePlayers:GetChildren()) do
						if not game.Players:FindFirstChild(v.Name) then
							Simple_Create(v.HumanoidRootPart, v.Name, "AI_Tracker")
						end
					end
				end)
			end
		end
            )
	end
}
)
farm:AddToggle(
        {
	Name = "自动挂机",
	Callback = function(TF)
		getgenv().tf = TF
		if tf then
			makeNotification(
                        "warning",
                        "dot.hub | Farm",
                        'Please click on "Auto Respawn" in the GUI to avoid breaking'
                    )
			part = Instance.new("Part", workspace)
			part.Anchored = true
			part.CFrame = CFrame.new(100, 496, 100)
		end
		while task.wait(0.5) and getgenv().tf do
			if not tf then
				break
			end
			local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
			local tickets = workspace.Game.Effects.Tickets
			local hrp = char:WaitForChild("HumanoidRootPart", 3)
			if hrp == nil then
				return
			end
			hrp.CFrame = CFrame.new(100, 500, 100)
			for i, v in next, tickets:GetDescendants() do
				if v.IsA(v, "BasePart") and v.Name == "HumanoidRootPart" then
					hrp.CFrame = CFrame.new(v.Position)
				end
			end
		end
	end
}
    )

misc:AddToggle(
    {
	Name = "透视倒下的人",
	Callback = function(desp)
		getgenv().downesp = desp
		task.spawn(
                function()
			while task.wait() do
				ClearESP('Downed_ESP')
				if not getgenv().downesp then
					break
				end
				pcall(function()
					local GamePlayers = workspace:WaitForChild("Game", 1337).Players
					for i, v in pairs(GamePlayers:GetChildren()) do
						if v:GetAttribute('Downed') then
							Simple_Create(v.HumanoidRootPart, 'DOWNED PLR: ' .. v.Name, "Downed_ESP")
						end
					end
				end)
			end
		end
            )
	end
}
)
workspace.Game.ChildAdded:Connect(function(v)
	if v.Name == 'Map' and tspam then
		task.wait(32) -- waits for map to start
		while tspam and task.wait() do
			if not tspam then
				break
			end
			for i, v in next, workspace.Game.Players:GetChildren() do
				if v and v:FindFirstChild('Equip') then
					v:FindFirstChild('Equip'):InvokeServer(2)
					continue
				else
					continue
				end
			end
		end
	end
end)
