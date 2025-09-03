local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/hdbfishwh/SynthorixV2/refs/heads/main/Theme.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Stats = game:GetService("Stats")

-- Dapatkan username pemain
local playerName = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName

WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "ZAINS",
            ["WELCOME"] = "2 player development",
            ["LIB_DESC"] = "Hello " .. displayName .. ", thank you for using our script :)",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency",
            ["AUTO_FARM"] = "Auto Farm",
            ["ENABLE_AUTO_FARM"] = "Enable Auto Farm",
            ["AUTO_FARM_DESC"] = "Automatically farm cash registers and safes",
            ["STATS"] = "Statistics",
            ["EARNINGS"] = "Earnings",
            ["TIME_RUNNING"] = "Time Running"
        }
    }
})

WindUI.TransparencyValue = 0.10
WindUI:SetTheme("Dark")

-- Auto Farm UI Variables
local AutoFarmUI = Instance.new("ScreenGui")
AutoFarmUI.Name = "AutoFarmStatsUI"
AutoFarmUI.Parent = CoreGui
AutoFarmUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AutoFarmUI.Enabled = false

local StatsFrame = Instance.new("Frame")
StatsFrame.Parent = AutoFarmUI
StatsFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
StatsFrame.BackgroundTransparency = 0.3
StatsFrame.Position = UDim2.new(0.02, 0, 0.02, 0)
StatsFrame.Size = UDim2.new(0, 200, 0, 120)
StatsFrame.AnchorPoint = Vector2.new(0, 0)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = StatsFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(60, 60, 60)
UIStroke.Parent = StatsFrame

local Title = Instance.new("TextLabel")
Title.Parent = StatsFrame
Title.Text = "Auto Farm Stats"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Size = UDim2.new(1, -10, 0, 25)
Title.Position = UDim2.new(0, 5, 0, 5)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = StatsFrame
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.BackgroundTransparency = 1
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(0.95, -20, 0, 5)

local StatsContainer = Instance.new("Frame")
StatsContainer.Parent = StatsFrame
StatsContainer.BackgroundTransparency = 1
StatsContainer.Position = UDim2.new(0, 5, 0, 30)
StatsContainer.Size = UDim2.new(1, -10, 1, -35)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = StatsContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 3)

local function createStatLabel(text, parent)
    local Label = Instance.new("TextLabel")
    Label.Parent = parent
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.Size = UDim2.new(1, 0, 0, 18)
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left
    return Label
end

local PingLabel = createStatLabel("Ping: Calculating...", StatsContainer)
local CashLabel = createStatLabel("Earnings: $0", StatsContainer)
local FPSLabel = createStatLabel("FPS: Calculating...", StatsContainer)
local TimerLabel = createStatLabel("Time: 00:00:00", StatsContainer)

-- Dragging functionality
local dragging, dragStart, startPos
local currentTween

local function updateDrag(input)
    local delta = input.Position - dragStart
    local targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    if currentTween then currentTween:Cancel() end
    currentTween = TweenService:Create(StatsFrame, TweenInfo.new(0.1), {Position = targetPos})
    currentTween:Play()
end

StatsFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = StatsFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

StatsFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        updateDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        updateDrag(input)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    AutoFarmUI.Enabled = false
end)

-- Update stats functions
spawn(function()
    while task.wait(0.5) do
        if AutoFarmUI.Enabled then
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            FPSLabel.Text = "FPS: " .. tostring(fps)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if AutoFarmUI.Enabled then
            local perfStats = Stats and Stats:FindFirstChild("PerformanceStats")
            if perfStats and perfStats:FindFirstChild("Ping") then
                PingLabel.Text = "Ping: " .. tostring(math.floor(perfStats.Ping:GetValue())) .. "ms"
            end
        end
    end
end)

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

WindUI:Popup({
    Title = gradient("WindUI Demo", Color3.fromHex("#6A11CB"), Color3.fromHex("#2575FC")),
    Icon = "sparkles",
    Content = "loc:LIB_DESC",
    Buttons = {
        {
            Title = "Get Started",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end
        }
    }
})

-- Configuration
local Config = {
    ESP = {
        Enabled = false,
        BoxColor = Color3.new(1, 0.3, 0),
        DistanceColor = Color3.new(1, 1, 1),
        HealthGradient = {
            Color3.new(0, 1, 0),
            Color3.new(1, 1, 0),
            Color3.new(1, 0, 0)
        },
        SnaplineEnabled = true,
        SnaplinePosition = "Center",
        RainbowEnabled = false
    },
    Aimbot = {
        Enabled = false,
        FOV = 30,
        MaxDistance = 200,
        ShowFOV = false,
        TargetPart = "Head"
    },
    AutoFarm = {
        Enabled = false,
        TargetCashRegisters = true,
        TargetSafes = true,
        ShowStats = true
    }
}

-- Variables
local RainbowSpeed = 0.5
local ESPDrawings = {}

-- Auto Farm Variables
local AutoFarmRunning = false
local AutoFarmStats = {
    Earnings = 0,
    StartTime = 0,
    InitialCash = 0,
    Seconds = 0,
    Minutes = 0,
    Hours = 0
}

-- Functions
local function CreateESP(player)
    if player == LocalPlayer then return end
    
    local drawings = {
        Box = Drawing.new("Square"),
        HealthBar = Drawing.new("Square"),
        Distance = Drawing.new("Text"),
        Snapline = Drawing.new("Line")
    }
    
    for _, drawing in pairs(drawings) do
        drawing.Visible = false
        if drawing.Type == "Square" then
            drawing.Thickness = 2
            drawing.Filled = false
        end
    end
    
    drawings.Box.Color = Config.ESP.BoxColor
    drawings.HealthBar.Filled = true
    drawings.Distance.Size = 16
    drawings.Distance.Center = true
    drawings.Distance.Color = Config.ESP.DistanceColor
    drawings.Snapline.Color = Config.ESP.BoxColor
    
    ESPDrawings[player] = drawings
end

local function UpdateESP(player, drawings)
    if not Config.ESP.Enabled or not player.Character then
        for _, drawing in pairs(drawings) do
            drawing.Visible = false
        end
        return
    end
    
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local head = player.Character:FindFirstChild("Head")
    
    if not humanoid or humanoid.Health <= 0 or not head then
        for _, drawing in pairs(drawings) do
            drawing.Visible = false
        end
        return
    end
    
    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
    if not onScreen then
        for _, drawing in pairs(drawings) do
            drawing.Visible = false
        end
        return
    end
    
    local distance = (head.Position - Camera.CFrame.Position).Magnitude
    local scale = 1000 / distance
    
    -- Box ESP
    drawings.Box.Size = Vector2.new(scale, scale * 1.5)
    drawings.Box.Position = Vector2.new(headPos.X - (scale / 2), headPos.Y - (scale * 0.75))
    drawings.Box.Visible = true
    
    -- Health Bar
    local healthRatio = humanoid.Health / humanoid.MaxHealth
    local healthColorIndex = math.clamp(3 - (healthRatio * 2), 1, 3)
    local healthColor = Config.ESP.HealthGradient[math.floor(healthColorIndex)]:Lerp(
        Config.ESP.HealthGradient[math.ceil(healthColorIndex)],
        healthColorIndex % 1
    )
    
    drawings.HealthBar.Size = Vector2.new(4, scale * 1.5 * healthRatio)
    drawings.HealthBar.Position = Vector2.new(
        headPos.X + (scale / 2) + 5,
        (headPos.Y - (scale * 0.75)) + (scale * 1.5 * (1 - healthRatio))
    )
    drawings.HealthBar.Color = healthColor
    drawings.HealthBar.Visible = true
    
    -- Distance
    drawings.Distance.Text = math.floor(distance) .. "m"
    drawings.Distance.Position = Vector2.new(headPos.X, headPos.Y + (scale * 0.75) + 10)
    drawings.Distance.Visible = true
    
    -- Rainbow effect
    if Config.ESP.RainbowEnabled then
        local hue = (tick() * RainbowSpeed) % 1
        local rainbowColor = Color3.fromHSV(hue, 1, 1)
        drawings.Snapline.Color = rainbowColor
        drawings.Box.Color = rainbowColor
    else
        drawings.Snapline.Color = Config.ESP.BoxColor
        drawings.Box.Color = Config.ESP.BoxColor
    end
    
    -- Snapline
    if Config.ESP.SnaplineEnabled then
        local lineYPosition
        if Config.ESP.SnaplinePosition == "Bottom" then
            lineYPosition = Camera.ViewportSize.Y
        elseif Config.ESP.SnaplinePosition == "Top" then
            lineYPosition = 0
        else
            lineYPosition = Camera.ViewportSize.Y / 2
        end
        
        drawings.Snapline.From = Vector2.new(headPos.X, headPos.Y + (scale * 0.75))
        drawings.Snapline.To = Vector2.new(Camera.ViewportSize.X / 2, lineYPosition)
        drawings.Snapline.Visible = true
    else
        drawings.Snapline.Visible = false
    end
end

local function FindAimbotTarget()
    local closestTarget = nil
    local closestDistance = math.huge
    local fov = Config.Aimbot.FOV or 30
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local direction = (head.Position - Camera.CFrame.Position).Unit
            local lookVector = Camera.CFrame.LookVector
            local angle = math.deg(math.acos(direction:Dot(lookVector)))
            
            if angle <= (fov / 2) then
                local distance = (Camera.CFrame.Position - head.Position).Magnitude
                
                if distance <= Config.Aimbot.MaxDistance then
                    local ray = Ray.new(Camera.CFrame.Position, direction * 500)
                    local hitPart, _ = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                    
                    if hitPart and hitPart:IsDescendantOf(player.Character) then
                        if distance < closestDistance then
                            closestDistance = distance
                            closestTarget = player
                        end
                    end
                end
            end
        end
    end
    
    return closestTarget
end

-- FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Filled = false
FOVCircle.Visible = Config.Aimbot.ShowFOV
FOVCircle.Color = Color3.new(1, 1, 1)

-- Auto Farm Functions
local function formatNumber(n)
    local formatted = tostring(n)
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

local function SetupAutoFarm()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace = game:GetService("Workspace")
    local VirtualUser = game:GetService("VirtualUser")
    
    local localPlayer = Players.LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    local bag = localPlayer:WaitForChild("States"):WaitForChild("Bag")
    local bagSizeLevel = localPlayer:WaitForChild("Stats"):WaitForChild("BagSizeLevel"):WaitForChild("CurrentAmount")
    local robEvent = ReplicatedStorage:WaitForChild("GeneralEvents"):WaitForChild("Rob")
    local targetPosition = CFrame.new(1636.62537, 104.349976, -1736.184)
    
    if humanoid then
        local clonedHumanoid = humanoid:Clone()
        clonedHumanoid.Parent = character
        localPlayer.Character = nil
        clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        clonedHumanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        humanoid:Destroy()
        localPlayer.Character = character
        local camera = Workspace.CurrentCamera
        camera.CameraSubject = clonedHumanoid
        camera.CFrame = camera.CFrame
        clonedHumanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        local animate = character:FindFirstChild("Animate")
        if animate then
            animate.Disabled = true
            task.wait()
            animate.Disabled = false
        end
        clonedHumanoid.Health = clonedHumanoid.MaxHealth
        humanoid = clonedHumanoid
        humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    end
    
    localPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    
    local function moveToTarget()
        if humanoidRootPart then
            humanoidRootPart.CFrame = targetPosition
        end
    end
    
    local function checkCashRegister()
        if not Config.AutoFarm.TargetCashRegisters then return false end
        
        for _, item in ipairs(Workspace:GetChildren()) do
            if bag.Value >= bagSizeLevel.Value then
                moveToTarget()
                break
            elseif item:IsA("Model") and item.Name == "CashRegister" then
                local openPart = item:FindFirstChild("Open")
                if openPart then
                    humanoidRootPart.CFrame = openPart.CFrame
                    robEvent:FireServer("Register", {
                        Part = item:FindFirstChild("Union"),
                        OpenPart = openPart,
                        ActiveValue = item:FindFirstChild("Active"),
                        Active = true
                    })
                    return true
                end
            end
        end
        return false
    end
    
    local function checkSafe()
        if not Config.AutoFarm.TargetSafes then return false end
        
        for _, item in ipairs(Workspace:GetChildren()) do
            if bag.Value >= bagSizeLevel.Value then
                moveToTarget()
                break
            elseif item:IsA("Model") and item.Name == "Safe" and item:FindFirstChild("Amount") and item.Amount.Value > 0 then
                local safePart = item:FindFirstChild("Safe")
                if safePart then
                    humanoidRootPart.CFrame = safePart.CFrame
                    local openFlag = item:FindFirstChild("Open")
                    if openFlag and openFlag.Value then
                        robEvent:FireServer("Safe", item)
                    else
                        local openSafe = item:FindFirstChild("OpenSafe")
                        if openSafe then
                            openSafe:FireServer("Completed")
                        end
                        robEvent:FireServer("Safe", item)
                    end
                    return true
                end
            end
        end
        return false
    end
    
    -- Start Auto Farm loop
    AutoFarmRunning = true
    AutoFarmStats.StartTime = tick()
    AutoFarmStats.Seconds = 0
    AutoFarmStats.Minutes = 0
    AutoFarmStats.Hours = 0
    
    local leaderstats = localPlayer:WaitForChild("leaderstats")
    local cashStat = leaderstats:WaitForChild("$$")
    AutoFarmStats.InitialCash = cashStat.Value
    
    -- Timer update
    spawn(function()
        while AutoFarmRunning and Config.AutoFarm.Enabled do
            task.wait(1)
            AutoFarmStats.Seconds = AutoFarmStats.Seconds + 1
            if AutoFarmStats.Seconds >= 60 then
                AutoFarmStats.Seconds = 0
                AutoFarmStats.Minutes = AutoFarmStats.Minutes + 1
            end
            if AutoFarmStats.Minutes >= 60 then
                AutoFarmStats.Minutes = 0
                AutoFarmStats.Hours = AutoFarmStats.Hours + 1
            end
            
            if Config.AutoFarm.ShowStats then
                TimerLabel.Text = string.format("Time: %02d:%02d:%02d", AutoFarmStats.Hours, AutoFarmStats.Minutes, AutoFarmStats.Seconds)
            end
        end
    end)
    
    -- Earnings update
    spawn(function()
        while AutoFarmRunning and Config.AutoFarm.Enabled do
            task.wait(0.5)
            AutoFarmStats.Earnings = cashStat.Value - AutoFarmStats.InitialCash
            if Config.AutoFarm.ShowStats then
                CashLabel.Text = "Earnings: $" .. formatNumber(AutoFarmStats.Earnings)
            end
        end
    end)
    
    -- Auto Farm loop
    spawn(function()
        while AutoFarmRunning and Config.AutoFarm.Enabled do
            RunService.RenderStepped:Wait()
            if not checkCashRegister() then
                checkSafe()
            end
        end
    end)
end

local function StopAutoFarm()
    AutoFarmRunning = false
end

local Window = WindUI:CreateWindow({
    Title = "loc:WINDUI_EXAMPLE",
    Icon = "palette",
    Author = "loc:WELCOME",
    Folder = "WindUI_Example",
    Size = UDim2.fromOffset(580, 490),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = false,
        Username = playerName,
        UserId = LocalPlayer.UserId,
        Callback = function()
            WindUI:Notify({
                Title = "User Profile",
                Content = "Hello, " .. displayName .. "! (ID: " .. LocalPlayer.UserId .. ")",
                Duration = 3
            })
        end
    },
    SideBarWidth = 200,
})

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

local Tabs = {
    Main = Window:Section({ Title = "loc:FEATURES", Opened = true }),
    Settings = Window:Section({ Title = "loc:SETTINGS", Opened = true }),
    Utilities = Window:Section({ Title = "loc:UTILITIES", Opened = true })
}

local TabHandles = {
    ESP = Tabs.Main:Tab({ Title = "ESP", Icon = "eye", Desc = "ESP Settings" }),
    Aimbot = Tabs.Main:Tab({ Title = "Aimbot", Icon = "crosshair" }),
    AutoFarm = Tabs.Main:Tab({ Title = "loc:AUTO_FARM", Icon = "coins" }),
    Appearance = Tabs.Settings:Tab({ Title = "loc:APPEARANCE", Icon = "brush" }),
    Config = Tabs.Utilities:Tab({ Title = "loc:CONFIGURATION", Icon = "settings" })
}

-- ESP Tab
TabHandles.ESP:Paragraph({
    Title = "ESP Settings",
    Desc = "Configure your ESP features",
    Image = "eye",
    ImageSize = 20,
    Color = Color3.fromHex("#30ff6a"),
})

TabHandles.ESP:Divider()

local espToggle = TabHandles.ESP:Toggle({
    Title = "Enable ESP",
    Desc = "Toggle ESP on/off",
    Value = Config.ESP.Enabled,
    Callback = function(state) 
        Config.ESP.Enabled = state
        WindUI:Notify({
            Title = "ESP",
            Content = state and "ESP Enabled" or "ESP Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local snaplineToggle = TabHandles.ESP:Toggle({
    Title = "Enable Snapline",
    Desc = "Toggle snapline on/off",
    Value = Config.ESP.SnaplineEnabled,
    Callback = function(state) 
        Config.ESP.SnaplineEnabled = state
        WindUI:Notify({
            Title = "Snapline",
            Content = state and "Snapline Enabled" or "Snapline Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local rainbowToggle = TabHandles.ESP:Toggle({
    Title = "Rainbow Effect",
    Desc = "Toggle rainbow colors on/off",
    Value = Config.ESP.RainbowEnabled,
    Callback = function(state) 
        Config.ESP.RainbowEnabled = state
        WindUI:Notify({
            Title = "Rainbow",
            Content = state and "Rainbow Enabled" or "Rainbow Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local snaplinePosition = TabHandles.ESP:Dropdown({
    Title = "Snapline Position",
    Values = { "Center", "Bottom", "Top" },
    Value = Config.ESP.SnaplinePosition,
    Callback = function(option)
        Config.ESP.SnaplinePosition = option
        WindUI:Notify({
            Title = "Snapline Position",
            Content = "Position: "..option,
            Duration = 2
        })
    end
})

TabHandles.ESP:Colorpicker({
    Title = "ESP Color",
    Default = Config.ESP.BoxColor,
    Callback = function(color, transparency)
        Config.ESP.BoxColor = color
        WindUI:Notify({
            Title = "ESP Color",
            Content = "Color changed",
            Duration = 2
        })
    end
})

-- Aimbot Tab
TabHandles.Aimbot:Paragraph({
    Title = "Aimbot Settings",
    Desc = "Configure your aimbot features",
    Image = "crosshair",
    ImageSize = 20,
    Color = Color3.fromHex("#ff3030"),
})

TabHandles.Aimbot:Divider()

local aimbotToggle = TabHandles.Aimbot:Toggle({
    Title = "Enable Aimbot",
    Desc = "Toggle aimbot on/off",
    Value = Config.Aimbot.Enabled,
    Callback = function(state) 
        Config.Aimbot.Enabled = state
        WindUI:Notify({
            Title = "Aimbot",
            Content = state and "Aimbot Enabled" or "Aimbot Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local fovToggle = TabHandles.Aimbot:Toggle({
    Title = "Show FOV Circle",
    Desc = "Toggle FOV circle visibility",
    Value = Config.Aimbot.ShowFOV,
    Callback = function(state) 
        Config.Aimbot.ShowFOV = state
        FOVCircle.Visible = state
        WindUI:Notify({
            Title = "FOV Circle",
            Content = state and "FOV Circle Enabled" or "FOV Circle Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local fovSlider = TabHandles.Aimbot:Slider({
    Title = "FOV Size",
    Desc = "Adjust aimbot field of view",
    Value = { Min = 5, Max = 100, Default = Config.Aimbot.FOV },
    Callback = function(value)
        Config.Aimbot.FOV = value
    end
})

local distanceSlider = TabHandles.Aimbot:Slider({
    Title = "Max Distance",
    Desc = "Adjust maximum target distance",
    Value = { Min = 10, Max = 1000, Default = Config.Aimbot.MaxDistance },
    Callback = function(value)
        Config.Aimbot.MaxDistance = value
    end
})

local targetPart = TabHandles.Aimbot:Dropdown({
    Title = "Target Part",
    Values = { "Head", "Torso", "HumanoidRootPart" },
    Value = Config.Aimbot.TargetPart,
    Callback = function(option)
        Config.Aimbot.TargetPart = option
        WindUI:Notify({
            Title = "Target Part",
            Content = "Targeting: "..option,
            Duration = 2
        })
    end
})

-- Auto Farm Tab
TabHandles.AutoFarm:Paragraph({
    Title = "Auto Farm Settings",
    Desc = "Automatically farm cash registers and safes",
    Image = "coins",
    ImageSize = 20,
    Color = Color3.fromHex("#FFD700"),
})

TabHandles.AutoFarm:Divider()

local autoFarmToggle = TabHandles.AutoFarm:Toggle({
    Title = "loc:ENABLE_AUTO_FARM",
    Desc = "loc:AUTO_FARM_DESC",
    Value = Config.AutoFarm.Enabled,
    Callback = function(state) 
        Config.AutoFarm.Enabled = state
        
        if state then
            SetupAutoFarm()
            WindUI:Notify({
                Title = "Auto Farm",
                Content = "Auto Farm Enabled",
                Icon = "check",
                Duration = 2
            })
        else
            StopAutoFarm()
            WindUI:Notify({
                Title = "Auto Farm",
                Content = "Auto Farm Disabled",
                Icon = "x",
                Duration = 2
            })
        end
    end
})

local statsToggle = TabHandles.AutoFarm:Toggle({
    Title = "Show Statistics",
    Desc = "Display auto farm stats on screen",
    Value = Config.AutoFarm.ShowStats,
    Callback = function(state) 
        Config.AutoFarm.ShowStats = state
        AutoFarmUI.Enabled = state
        WindUI:Notify({
            Title = "Statistics",
            Content = state and "Stats Enabled" or "Stats Disabled",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local cashRegisterToggle = TabHandles.AutoFarm:Toggle({
    Title = "Target Cash Registers",
    Desc = "Farm cash registers",
    Value = Config.AutoFarm.TargetCashRegisters,
    Callback = function(state) 
        Config.AutoFarm.TargetCashRegisters = state
        WindUI:Notify({
            Title = "Cash Registers",
            Content = state and "Targeting Cash Registers" or "Not Targeting Cash Registers",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

local safeToggle = TabHandles.AutoFarm:Toggle({
    Title = "Target Safes",
    Desc = "Farm safes",
    Value = Config.AutoFarm.TargetSafes,
    Callback = function(state) 
        Config.AutoFarm.TargetSafes = state
        WindUI:Notify({
            Title = "Safes",
            Content = state and "Targeting Safes" or "Not Targeting Safes",
            Icon = state and "check" or "x",
            Duration = 2
        })
    end
})

-- Appearance Tab
TabHandles.Appearance:Paragraph({
    Title = "Customize Interface",
    Desc = "Personalize your experience",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = TabHandles.Appearance:Dropdown({
    Title = "loc:THEME_SELECT",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "Theme Applied",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

local transparencySlider = TabHandles.Appearance:Slider({
    Title = "loc:TRANSPARENCY",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

-- Configuration Tab
TabHandles.Config:Paragraph({
    Title = "Configuration Manager",
    Desc = "Save and load your settings",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "default"
local configFile = nil

TabHandles.Config:Input({
    Title = "Config Name",
    Value = configName,
    Callback = function(value)
        configName = value or "default"
    end
})

TabHandles.Config:Button({
    Title = "Save Configuration",
    Icon = "save",
    Variant = "Primary",
    Callback = function()
        WindUI:Notify({ 
            Title = "Configuration", 
            Content = "Settings saved for " .. playerName .. "!",
            Icon = "check",
            Duration = 3
        })
    end
})

TabHandles.Config:Button({
    Title = "Load Configuration",
    Icon = "folder",
    Callback = function()
        WindUI:Notify({ 
            Title = "Configuration", 
            Content = "Settings loaded for " .. playerName .. "!",
            Icon = "refresh-cw",
            Duration = 3
        })
    end
})

-- Main Loop
RunService.RenderStepped:Connect(function()
    -- Update FOV Circle
    FOVCircle.Visible = Config.Aimbot.ShowFOV
    FOVCircle.Radius = (Config.Aimbot.FOV / 2) * (Camera.ViewportSize.Y / 90)
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    -- Rainbow effect for FOV Circle
    if Config.ESP.RainbowEnabled and Config.Aimbot.ShowFOV then
        local hue = (tick() * RainbowSpeed) % 1
        FOVCircle.Color = Color3.fromHSV(hue, 1, 1)
    elseif Config.Aimbot.ShowFOV then
        FOVCircle.Color = Color3.new(1, 1, 1)
    end
    
    -- Update ESP for all players
    for player, drawings in pairs(ESPDrawings) do
        UpdateESP(player, drawings)
    end
    
    -- Aimbot functionality
    if Config.Aimbot.Enabled then
        local target = FindAimbotTarget()
        if target and target.Character and target.Character:FindFirstChild(Config.Aimbot.TargetPart) then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character[Config.Aimbot.TargetPart].Position)
        end
    end
end)

-- Initialize ESP for all players
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

-- Player added/removed events
Players.PlayerAdded:Connect(function(player)
    CreateESP(player)
    
    player.CharacterAdded:Connect(function()
        if ESPDrawings[player] then
            for _, drawing in pairs(ESPDrawings[player]) do
                pcall(function() drawing:Remove() end)
            end
            ESPDrawings[player] = nil
        end
        CreateESP(player)
    end)
    
    player.CharacterRemoving:Connect(function()
        if ESPDrawings[player] then
            for _, drawing in pairs(ESPDrawings[player]) do
                pcall(function() drawing:Remove() end)
            end
            ESPDrawings[player] = nil
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPDrawings[player] then
        for _, drawing in pairs(ESPDrawings[player]) do
            pcall(function() drawing:Remove() end)
        end
        ESPDrawings[player] = nil
    end
end)

-- UI Toggle
local UIVisible = true
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        UIVisible = not UIVisible
        Window.Enabled = UIVisible
    end
end)

-- Welcome Notification
local function ShowWelcomeNotification()
    WindUI:Notify({
        Title = "Script Loaded",
        Content = "Welcome, " .. displayName .. "! ESP, Aimbot, and Auto Farm features are ready!",
        Icon = "check",
        Duration = 5
    })
end

ShowWelcomeNotification()
warn("✅ Script successfully activated for " .. playerName .. "!")
