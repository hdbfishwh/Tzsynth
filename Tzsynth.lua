local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local LunarUi = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local stroke = Instance.new("UIStroke")
local ImageLabel = Instance.new("ImageLabel")
local MainText = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local Overlay = Instance.new("Frame") 

LunarUi.Name = "LunarUi"
LunarUi.IgnoreGuiInset = true
LunarUi.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
LunarUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Overlay.Name = "GlassOverlay"
Overlay.Parent = LunarUi
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.new(0, 0, 0)
Overlay.BackgroundTransparency = 1
Overlay.ZIndex = 0

TweenService:Create(Overlay, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
	BackgroundTransparency = 0.2
}):Play()

Frame.Parent = LunarUi
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.100
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 1.5, 0)
Frame.Size = UDim2.new(0, 326, 0, 193)

UICorner.Parent = Frame

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.354749441, 0, 0.164281815, 0)
ImageLabel.Size = UDim2.new(0, 95, 0, 76)
ImageLabel.Image = "rbxassetid://81628958072398"

stroke.Name = "UIStroke"
stroke.Parent = Frame
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Color = Color3.fromRGB(0, 170, 255)
stroke.LineJoinMode = Enum.LineJoinMode.Round
stroke.Thickness = 2
stroke.Transparency = 0

MainText.Name = "MainText"
MainText.Parent = Frame
MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainText.BackgroundTransparency = 1.000
MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainText.BorderSizePixel = 0
MainText.Position = UDim2.new(0.0730055347, 0, 0.729062259, 0)
MainText.Size = UDim2.new(0.854823947, 0, -0.122750714, 40)
MainText.Font = Enum.Font.Arial
MainText.Text = "Loading Car Driving Indonesia Script...."
MainText.TextColor3 = Color3.fromRGB(255, 255, 255)
MainText.TextScaled = true
MainText.TextSize = 14.000
MainText.TextWrapped = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0699380487, 0, 0.844559431, 0)
TextLabel.Size = UDim2.new(0.854823947, 0, -0.130853057, 40)
TextLabel.Font = Enum.Font.Arial
TextLabel.Text = "(discord.gg/DShBJfBvDS)"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true


local tweenIn = TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, 0, 0.5, 0)
})

local tweenOut = TweenService:Create(Frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
	Position = UDim2.new(0.5, 0, -0.5, 0)
})

tweenIn:Play()
tweenIn.Completed:Wait()

task.wait(4)

tweenOut:Play()

TweenService:Create(Overlay, TweenInfo.new(0.6, Enum.EasingStyle.Sine), {
	BackgroundTransparency = 1
}):Play()

tweenOut.Completed:Wait()
task.wait(0.2)

LunarUi:Destroy()

-- Instances:
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local MainUi = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local LunarLogos = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Money = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Time = Instance.new("TextLabel")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Last = Instance.new("TextLabel")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local Total = Instance.new("TextLabel")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local MoneyLogos = Instance.new("ImageLabel")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local StopwatchLogos = Instance.new("ImageLabel")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local LastLogos = Instance.new("ImageLabel")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local BankLogos = Instance.new("ImageLabel")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local MoneyChangable = Instance.new("TextLabel")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
local TimeChangable = Instance.new("TextLabel")
local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
local LastChangable = Instance.new("TextLabel")
local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
local TotalEarnChangable = Instance.new("TextLabel")
local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
local Maintenance = Instance.new("TextLabel")
local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")

--Properties:

MainUi.Name = "MainUi"
MainUi.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MainUi
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 261, 0, 162)
Main.Size = UDim2.new(0, 479, 0, 279)

UICorner.Parent = Main

LunarLogos.Name = "Lunar Logos"
LunarLogos.Parent = Main
LunarLogos.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LunarLogos.BorderColor3 = Color3.fromRGB(0, 0, 0)
LunarLogos.BorderSizePixel = 0
LunarLogos.Position = UDim2.new(0.0340966173, 0, 0, 0)
LunarLogos.Size = UDim2.new(0, 91, 0, 72)
LunarLogos.Image = "rbxassetid://8922788417"

UIAspectRatioConstraint.Parent = LunarLogos
UIAspectRatioConstraint.AspectRatio = 1.264

Money.Name = "Money"
Money.Parent = Main
Money.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Money.BackgroundTransparency = 2.000
Money.BorderColor3 = Color3.fromRGB(0, 0, 0)
Money.BorderSizePixel = 0
Money.Position = UDim2.new(0.116840616, 0, 0.349860966, 0)
Money.Size = UDim2.new(0, 76, 0, 32)
Money.Font = Enum.Font.Unknown
Money.Text = "Money"
Money.TextColor3 = Color3.fromRGB(255, 255, 255)
Money.TextSize = 16.000
Money.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_2.Parent = Money
UIAspectRatioConstraint_2.AspectRatio = 2.375

Time.Name = "Time"
Time.Parent = Main
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 2.000
Time.BorderColor3 = Color3.fromRGB(0, 0, 0)
Time.BorderSizePixel = 0
Time.Position = UDim2.new(0.169959515, 0, 0.498494476, 0)
Time.Size = UDim2.new(0, 74, 0, 39)
Time.Font = Enum.Font.Unknown
Time.Text = "Farming Time"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextSize = 16.000
Time.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_3.Parent = Time
UIAspectRatioConstraint_3.AspectRatio = 1.897

Last.Name = "Last"
Last.Parent = Main
Last.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Last.BackgroundTransparency = 2.000
Last.BorderColor3 = Color3.fromRGB(0, 0, 0)
Last.BorderSizePixel = 0
Last.Position = UDim2.new(0.136147186, 0, 0.648945808, 0)
Last.Size = UDim2.new(0, 100, 0, 36)
Last.Font = Enum.Font.Unknown
Last.Text = "Last Earning"
Last.TextColor3 = Color3.fromRGB(255, 255, 255)
Last.TextSize = 16.000
Last.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_4.Parent = Last
UIAspectRatioConstraint_4.AspectRatio = 2.778

Total.Name = "Total"
Total.Parent = Main
Total.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Total.BackgroundTransparency = 2.000
Total.BorderColor3 = Color3.fromRGB(0, 0, 0)
Total.BorderSizePixel = 0
Total.Position = UDim2.new(0.155940056, 0, 0.787522852, 0)
Total.Size = UDim2.new(0, 90, 0, 50)
Total.Font = Enum.Font.Unknown
Total.Text = "Total Earning"
Total.TextColor3 = Color3.fromRGB(255, 255, 255)
Total.TextSize = 16.000
Total.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_5.Parent = Total
UIAspectRatioConstraint_5.AspectRatio = 1.800

MoneyLogos.Name = "MoneyLogos"
MoneyLogos.Parent = Main
MoneyLogos.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MoneyLogos.BorderColor3 = Color3.fromRGB(0, 0, 0)
MoneyLogos.BorderSizePixel = 0
MoneyLogos.Position = UDim2.new(0.0337662324, 0, 0.340245605, 0)
MoneyLogos.Size = UDim2.new(0, 31, 0, 35)
MoneyLogos.Image = "rbxassetid://119551410175894"

UIAspectRatioConstraint_6.Parent = MoneyLogos
UIAspectRatioConstraint_6.AspectRatio = 0.886

StopwatchLogos.Name = "StopwatchLogos"
StopwatchLogos.Parent = Main
StopwatchLogos.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StopwatchLogos.BorderColor3 = Color3.fromRGB(0, 0, 0)
StopwatchLogos.BorderSizePixel = 0
StopwatchLogos.Position = UDim2.new(0.0311688315, 0, 0.527745605, 0)
StopwatchLogos.Size = UDim2.new(0, 31, 0, 30)
StopwatchLogos.Image = "rbxassetid://15034073441"

UIAspectRatioConstraint_7.Parent = StopwatchLogos
UIAspectRatioConstraint_7.AspectRatio = 1.033

LastLogos.Name = "LastLogos"
LastLogos.Parent = Main
LastLogos.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LastLogos.BorderColor3 = Color3.fromRGB(0, 0, 0)
LastLogos.BorderSizePixel = 0
LastLogos.Position = UDim2.new(0.038961038, 0, 0.663885415, 0)
LastLogos.Size = UDim2.new(0, 31, 0, 30)
LastLogos.Image = "rbxassetid://11253545248"

UIAspectRatioConstraint_8.Parent = LastLogos
UIAspectRatioConstraint_8.AspectRatio = 1.033

BankLogos.Name = "BankLogos"
BankLogos.Parent = Main
BankLogos.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BankLogos.BorderColor3 = Color3.fromRGB(0, 0, 0)
BankLogos.BorderSizePixel = 0
BankLogos.Position = UDim2.new(0.038961038, 0, 0.825659513, 0)
BankLogos.Size = UDim2.new(0, 31, 0, 30)
BankLogos.Image = "rbxassetid://12773863425"

UIAspectRatioConstraint_9.Parent = BankLogos
UIAspectRatioConstraint_9.AspectRatio = 1.033

MoneyChangable.Name = "MoneyChangable"
MoneyChangable.Parent = Main
MoneyChangable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoneyChangable.BackgroundTransparency = 2.000
MoneyChangable.BorderColor3 = Color3.fromRGB(0, 0, 0)
MoneyChangable.BorderSizePixel = 0
MoneyChangable.Position = UDim2.new(0.555109024, 0, 0.349860936, 0)
MoneyChangable.Size = UDim2.new(0, 83, 0, 32)
MoneyChangable.Font = Enum.Font.Unknown
MoneyChangable.Text = "Rp 0"
MoneyChangable.TextColor3 = Color3.fromRGB(255, 255, 255)
MoneyChangable.TextSize = 16.000
MoneyChangable.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_10.Parent = MoneyChangable
UIAspectRatioConstraint_10.AspectRatio = 2.594

TimeChangable.Name = "TimeChangable"
TimeChangable.Parent = Main
TimeChangable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TimeChangable.BackgroundTransparency = 2.000
TimeChangable.BorderColor3 = Color3.fromRGB(0, 0, 0)
TimeChangable.BorderSizePixel = 0
TimeChangable.Position = UDim2.new(0.555109024, 0, 0.501952171, 0)
TimeChangable.Size = UDim2.new(0, 83, 0, 32)
TimeChangable.Font = Enum.Font.Unknown
TimeChangable.Text = "0 Sec"
TimeChangable.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeChangable.TextSize = 16.000
TimeChangable.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_11.Parent = TimeChangable
UIAspectRatioConstraint_11.AspectRatio = 2.594

LastChangable.Name = "LastChangable"
LastChangable.Parent = Main
LastChangable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LastChangable.BackgroundTransparency = 2.000
LastChangable.BorderColor3 = Color3.fromRGB(0, 0, 0)
LastChangable.BorderSizePixel = 0
LastChangable.Position = UDim2.new(0.555109024, 0, 0.657845736, 0)
LastChangable.Size = UDim2.new(0, 83, 0, 32)
LastChangable.Font = Enum.Font.Unknown
LastChangable.Text = "Rp 0"
LastChangable.TextColor3 = Color3.fromRGB(255, 255, 255)
LastChangable.TextSize = 16.000
LastChangable.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_12.Parent = LastChangable
UIAspectRatioConstraint_12.AspectRatio = 2.594

TotalEarnChangable.Name = "TotalEarnChangable"
TotalEarnChangable.Parent = Main
TotalEarnChangable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TotalEarnChangable.BackgroundTransparency = 2.000
TotalEarnChangable.BorderColor3 = Color3.fromRGB(0, 0, 0)
TotalEarnChangable.BorderSizePixel = 0
TotalEarnChangable.Position = UDim2.new(0.555109024, 0, 0.821343839, 0)
TotalEarnChangable.Size = UDim2.new(0, 83, 0, 32)
TotalEarnChangable.Font = Enum.Font.Unknown
TotalEarnChangable.Text = "Rp 0"
TotalEarnChangable.TextColor3 = Color3.fromRGB(255, 255, 255)
TotalEarnChangable.TextSize = 16.000
TotalEarnChangable.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_13.Parent = TotalEarnChangable
UIAspectRatioConstraint_13.AspectRatio = 2.594

Maintenance.Name = "Maintenance"
Maintenance.Parent = Main
Maintenance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Maintenance.BackgroundTransparency = 2.000
Maintenance.BorderColor3 = Color3.fromRGB(0, 0, 0)
Maintenance.BorderSizePixel = 0
Maintenance.Position = UDim2.new(0.352674127, 0, 0.0386606641, 0)
Maintenance.Size = UDim2.new(0, 134, 0, 50)
Maintenance.Font = Enum.Font.Unknown
Maintenance.Text = "Welcome User"
Maintenance.TextColor3 = Color3.fromRGB(255, 255, 255)
Maintenance.TextSize = 16.000
Maintenance.TextStrokeTransparency = 0.000

UIAspectRatioConstraint_14.Parent = Maintenance
UIAspectRatioConstraint_14.AspectRatio = 2.680

UIAspectRatioConstraint_15.Parent = Main
UIAspectRatioConstraint_15.AspectRatio = 1.717

Main.Active = true
Main.Draggable = false -- kita pakai custom drag
Main.Selectable = true

Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Main.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

-- [ global variables ] -- 
local TweenService = game:GetService("TweenService")

local Player = game.Players.LocalPlayer
local CarName = Player.Name .. "sCar"

-- [ function ] --
function ToggleGlassOverlay()
	
	local overlay = Instance.new("ScreenGui")
	overlay.Name = "GlassOverlay"
	overlay.IgnoreGuiInset = true
	overlay.ResetOnSpawn = false
	overlay.DisplayOrder = 1
	overlay.Parent = CoreGui

	local bg = Instance.new("Frame", overlay)
	bg.Size = UDim2.new(1, 0, 1, 0)
	bg.Position = UDim2.new(0, 0, 0, 0)
	bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	bg.BackgroundTransparency = 1
	bg.BorderSizePixel = 0

	local TextContainer = Instance.new("Frame", overlay)
	TextContainer.Size = UDim2.new(1, 0, 1, 0)
	TextContainer.BackgroundTransparency = 1

	local CombinedText = Instance.new("TextLabel", TextContainer)
	CombinedText.Size = UDim2.new(0, 800, 0, 50)
	CombinedText.Position = UDim2.new(0.5, 0, 0.5, -25)
	CombinedText.AnchorPoint = Vector2.new(0.5, 0.5)
	CombinedText.BackgroundTransparency = 1
	CombinedText.Font = Enum.Font.Ubuntu
	CombinedText.TextSize = 26
	CombinedText.TextColor3 = Color3.fromRGB(255, 255, 255)
	CombinedText.TextStrokeTransparency = 0.6
	CombinedText.TextWrapped = true
	CombinedText.TextScaled = true
	CombinedText.RichText = true
	CombinedText.Text = ""
	CombinedText.TextTransparency = 0

	local SubText = Instance.new("TextLabel", TextContainer)
	SubText.AnchorPoint = Vector2.new(0.5, 0.5)
	SubText.Position = UDim2.new(0.5, 0, 0.5, 30)
	SubText.Size = UDim2.new(0, 400, 0, 30)
	SubText.BackgroundTransparency = 1
	SubText.Text = "discord.gg/DShBJfBvDS"
	SubText.Font = Enum.Font.Ubuntu
	SubText.TextSize = 20
	SubText.TextColor3 = Color3.fromRGB(104, 168, 255)
	SubText.TextStrokeTransparency = 0.7
	SubText.TextWrapped = true
	SubText.TextScaled = true
	SubText.TextTransparency = 1

	TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
	TweenService:Create(SubText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

	task.spawn(function()
		local prefix = "Auto Farming"
		local suffix = " actived, dont close or do anyting"
		local fullText = prefix .. suffix

		local delayPerChar = 0.03
		for i = 1, #fullText do
			local typed = fullText:sub(1, i)
			if typed:sub(1, #prefix) == prefix then
				CombinedText.Text = "<font color='rgb(104,168,255)'>" ..
					typed:sub(1, #prefix) ..
					"</font>" .. typed:sub(#prefix + 1)
			else
				CombinedText.Text = typed
			end
			game:GetService("RunService").RenderStepped:Wait()
			task.wait(delayPerChar)
		end
	end)
end

function UpdateStat(name, newValue)
    local label = Main:FindFirstChild(name)
    if label and label:IsA("TextLabel") then
        label.Text = tostring(newValue)
    else
        warn("Changeable UI element '" .. name .. "' not found.")
    end
end

function InitialMap()

	local Workspace = cloneref(game:GetService("Workspace"))

	local MapRoot = Workspace:FindFirstChild("Map", true)
	local PropFolder = MapRoot and MapRoot:FindFirstChild("Prop", true)

	if not PropFolder then
		warn("Map not found")
		return true
	end


	local Target = PropFolder:GetChildren()[499]

	if not Target then
		warn("Target object not found in Map")
		return false
	end

	Target:Destroy()


	local function CreatePlatform(size, position, name)
		local part = Instance.new("Part")
		part.Size = size
		part.CFrame = CFrame.new(position)
		part.Anchored = true
		part.CanCollide = true
		part.Material = Enum.Material.Plastic
		part.Color = Color3.fromRGB(163, 162, 165)
		part.Name = name
		part.Parent = workspace

		print(name .. " created at " .. tostring(position))
	end


	local charPosition = Player.Character.HumanoidRootPart.Position

	CreatePlatform(Vector3.new(128, 1, 128), Vector3.new(charPosition.X, 1, charPosition.Z), "BaseChar")
	CreatePlatform(Vector3.new(128, 1, 128), Vector3.new(-21797.74, 1037.11, -26793.34), "BaseCarPart")
	CreatePlatform(Vector3.new(2048, 1, 2048), Vector3.new(-21801, 1015, -26836), "BaseTruckPart")
	CreatePlatform(Vector3.new(2048, 1, 2048), Vector3.new(-50919, 1005, -86457), "BaseRGPart")


	local mapFolder = workspace:FindFirstChild("Map")

	if mapFolder then
		mapFolder:Destroy()
	else
		print("Map folder not found")
	end


	return true

end

function TweenToJob()

	game.ReplicatedStorage.NetworkContainer.RemoteEvents.Job:FireServer("Truck")


	local Root = Player.Character:FindFirstChild("HumanoidRootPart")

	if not Root then
		return
	end


	local liftTween = TweenService:Create(
		Root,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad),
		{ CFrame = Root.CFrame + Vector3.new(0, 100, 0) }
	)
	liftTween:Play()


	task.delay(0.5, function()

		local moveTween = TweenService:Create(
			Root,
			TweenInfo.new(1, Enum.EasingStyle.Quad),
			{ CFrame = CFrame.new(-21799.8, 1142.65, -26797.7) }
		)
		moveTween:Play()


		task.delay(1, function()

			local descendTween = TweenService:Create(
				Root,
				TweenInfo.new(1, Enum.EasingStyle.Exponential),
				{ CFrame = CFrame.new(-21799.8, 1042.65, -26797.7) }
			)
			descendTween:Play()


			task.delay(1, function()
				Root.Anchored = true
				task.wait(0.3)
				Root.Anchored = false
			end)
		end)
	end)

end

function TakingJob()

	repeat
        
		local Root = Player.Character:FindFirstChild("HumanoidRootPart")
		local Waypoint = workspace.Etc.Waypoint:FindFirstChild("Waypoint")
		local Billboard = Waypoint and Waypoint:FindFirstChild("BillboardGui")
		local Label = Billboard and Billboard:FindFirstChild("TextLabel")


		if Root then
			Root.Anchored = true
		end


		if Label and Label.Text ~= "Rojod Semarang" then

			game.ReplicatedStorage.NetworkContainer.RemoteEvents.Job:FireServer("Truck")

			local prompt = workspace.Etc.Job.Truck.Starter:FindFirstChildWhichIsA("ProximityPrompt", true)

			if prompt then
				prompt.MaxActivationDistance = 100000
				fireproximityprompt(prompt)
			end
		end


		if Root then
			Root.Anchored = false
		end


		task.wait(0.8)

	until Label and Label.Text == "Rojod Semarang"


	Player.Character.HumanoidRootPart.Anchored = false

end

function SpawningTruck()

	local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

	if not Root then
		return
	end


	Root.CFrame = CFrame.new(-21782.941, 1042.03, -26786.959)


	task.wait(2)

	local Vim = game:GetService("VirtualInputManager")

	Vim:SendKeyEvent(true, "F", false, game)
	task.wait(0.3)
	Vim:SendKeyEvent(false, "F", false, game)


	task.wait(5)


	local Car = workspace.Vehicles:FindFirstChild(CarName)
	local Humanoid = Player.Character and Player.Character:FindFirstChild("Humanoid")
	local Seat = Car and Car:FindFirstChild("DriveSeat")


	if Humanoid and Seat then
		pcall(function()
			Seat:Sit(Humanoid)
		end)

		task.wait(0.5)

		Vim:SendKeyEvent(true, "Space", false, game)
		task.wait(0.1)
		Vim:SendKeyEvent(false, "Space", false, game)
	end


	local Trailer = Car and Car:FindFirstChild("Trailer1")

	if Trailer then
		Trailer:Destroy()
		print("Trailer destroyed to prevent interference.")
	end

end

function MovingCharacterToDestination(Destination)

	local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
	local Car = workspace.Vehicles:FindFirstChild(CarName)

	if not (Root and Car) then
		return
	end


	if not Car.PrimaryPart then
		for _, part in ipairs(Car:GetDescendants()) do
			if part:IsA("BasePart") then
				Car.PrimaryPart = part
				break
			end
		end
	end


	local Follow = true

	task.spawn(function()
		while Follow do
			if Car.PrimaryPart then
				Car:PivotTo(Root.CFrame + Vector3.new(5, 0, 0))
			end
			task.wait(0.15)
		end
	end)


	local AboveStart = Root.CFrame + Vector3.new(0, 100, 0)
	local AboveDest = CFrame.new(Destination.Position + Vector3.new(0, 100, 0))


	local liftTween = TweenService:Create(
		Root,
		TweenInfo.new(0.4, Enum.EasingStyle.Quad),
		{ CFrame = AboveStart }
	)
	liftTween:Play()


	task.delay(0.4, function()
		local flyTween = TweenService:Create(
			Root,
			TweenInfo.new(1.6, Enum.EasingStyle.Sine),
			{ CFrame = AboveDest }
		)
		flyTween:Play()


		task.delay(1.6, function()
			local descendTween = TweenService:Create(
				Root,
				TweenInfo.new(1.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
				{ CFrame = Destination }
			)
			descendTween:Play()


			task.delay(1.8, function()

				Follow = false

				Root.Anchored = true

				if Car.PrimaryPart then
					Car.PrimaryPart.Anchored = true
				end

				task.wait(0.8)

				if Car.PrimaryPart then
					Car.PrimaryPart.Anchored = false
				end

			end)
		end)
	end)
end

function CountdownTeleport(seconds)

	local countdownGui = game:GetService("CoreGui"):FindFirstChild("CountdownUI")

	if not countdownGui then
		countdownGui = Instance.new("ScreenGui")
		countdownGui.Name = "CountdownUI"
		countdownGui.IgnoreGuiInset = true
		countdownGui.ResetOnSpawn = false
		countdownGui.Parent = game:GetService("CoreGui")
	end


	if not CountdownLabel then
		CountdownLabel = Instance.new("TextLabel")
		CountdownLabel.Name = "CountdownLabel"
		CountdownLabel.Parent = countdownGui
		CountdownLabel.Size = UDim2.new(0, 200, 0, 100)
		CountdownLabel.Position = UDim2.new(0.5, 0, 0.5, 100)
		CountdownLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		CountdownLabel.BackgroundTransparency = 1
		CountdownLabel.Font = Enum.Font.GothamBlack
		CountdownLabel.TextSize = 72
		CountdownLabel.TextColor3 = Color3.new(1, 1, 1)
		CountdownLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
		CountdownLabel.TextStrokeTransparency = 0.4
		CountdownLabel.TextScaled = true
		CountdownLabel.Text = ""
	end


	CountdownLabel.Visible = true

	for i = seconds, 1, -1 do
		CountdownLabel.Text = tostring(i)
		task.wait(1)
	end


	CountdownLabel.Visible = false
end

function SitInVehicle()

	local Car = workspace.Vehicles:FindFirstChild(CarName)
	local Hum = Player.Character and Player.Character:FindFirstChild("Humanoid")

	local Seat = Car and Car:FindFirstChild("DriveSeat")
	if Hum and Seat then pcall(function() Seat:Sit(Hum) end) end

end

function UpdateEarningStats()

	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	local cashFrame = playerGui:FindFirstChild("Main") and playerGui.Main:FindFirstChild("Container") 
		and playerGui.Main.Container:FindFirstChild("Hub") 
		and playerGui.Main.Container.Hub:FindFirstChild("CashFrame") 
		or nil

	if not cashFrame then
		warn("CashFrame not found.")
		return
	end

	local uangLabel = cashFrame.Frame and cashFrame.Frame:FindFirstChild("TextLabel")
	local earningText = cashFrame:FindFirstChild("TextLabel")

	local function cleanToNumber(text)
		text = tostring(text or "")
		text = text:gsub("[^%d]", "")
		return tonumber(text) or 0
	end

	local function formatRupiah(amount)
		local formatted = tostring(amount)
		local k
		while true do
			formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", "%1.%2")
			if k == 0 then break end
		end
		return "Rp " .. formatted
	end

	if uangLabel and earningText then
		local uangText = uangLabel.Text
		local earningValue = cleanToNumber(earningText.Text)
		local earned = earningValue

		TotalEarning = TotalEarning or 0
		TotalEarning += earned

		_G.LastEarningFormatted = formatRupiah(earned)
		_G.TotalEarningFormatted = formatRupiah(TotalEarning)

		UpdateStat("MoneyChangable", uangText)
		UpdateStat("LastChangable", _G.LastEarningFormatted)
		UpdateStat("TotalEarnChangable", _G.TotalEarningFormatted)

		LastRecorded = currentMoney or 0
	end

	if StartTime then
		local elapsed = math.floor(os.clock() - StartTime)
		UpdateStat("TimeChangable", elapsed .. " sec")
	end

end


function CarTween(TargetCFrame)

	local Root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

	if not Root then
		return
	end

	Root.Anchored = false

	task.wait(0.2)


	local Car = workspace.Vehicles:FindFirstChild(CarName)

	if not Car then
		warn("Vehicle not found.")
		return
	end

	if not Car.PrimaryPart then
		local Seat = Car:FindFirstChild("DriveSeat")
		if Seat then
			Car.PrimaryPart = Seat
		else
			return
		end
	end


	local TempCFrameValue = Instance.new("CFrameValue", workspace)
	TempCFrameValue.Value = Car:GetPivot()

	local tween = TweenService:Create(
		TempCFrameValue,
		TweenInfo.new(3, Enum.EasingStyle.Linear),
		{ Value = TargetCFrame }
	)

	TempCFrameValue:GetPropertyChangedSignal("Value"):Connect(function()
		Car:PivotTo(TempCFrameValue.Value)
	end)

	tween:Play()
	tween.Completed:Wait()

	TempCFrameValue:Destroy()


	game.ReplicatedStorage.NetworkContainer.RemoteEvents.Job:FireServer("Truck")

	task.wait(0.2)

	Root = Player.Character:FindFirstChild("HumanoidRootPart")

	if not Root then
		return
	end

	Root.Anchored = true
	task.wait(0.2)
	Root.Anchored = false

	task.wait(0.02)


	UpdateEarningStats()

end

function StartFarming()
	
	StartTime = os.clock()
	ToggleGlassOverlay()
		
	while true do
		InitialMap()
		task.wait(0.5)
		TweenToJob()
		task.wait(0.5)
		TakingJob()
		task.wait(0.5)
		SpawningTruck()
		task.wait(0.5)
		MovingCharacterToDestination(CFrame.new(-50937.152, 1012.215, -86353.031))
		CountdownTeleport(55)
		SitInVehicle()
		CarTween(CFrame.new(-50899.6015625, 1013.977783203125, -86534.9765625))
		task.wait(0.5)
	end

end

StartFarming()
