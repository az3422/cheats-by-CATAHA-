-- AUTHENTICATION GUI WITH RED VISUAL EFFECTS
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DevilAuth"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- BACKGROUND WITH RED VISUALS
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
background.BackgroundTransparency = 0
background.Parent = screenGui

-- ANIMATED RED PARTICLES
local particles = {}
local colors = {
Color3.fromRGB(255, 40, 80),
Color3.fromRGB(255, 60, 100),
Color3.fromRGB(220, 30, 70),
Color3.fromRGB(255, 50, 90)
}

for i = 1, 30 do
local particle = Instance.new("Frame")
local size = math.random(20, 100)
particle.Size = UDim2.new(0, size, 0, size)
particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
particle.BackgroundColor3 = colors[math.random(1, #colors)]
particle.BackgroundTransparency = 0.85
particle.BorderSizePixel = 0
particle.Parent = background

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = particle

table.insert(particles, {
frame = particle,
speedX = (math.random() - 0.5) * 0.015,
speedY = (math.random() - 0.5) * 0.015,
rotSpeed = (math.random() - 0.5) * 1.5
})
end

-- ANIMATED RED WAVES
local waveContainer = Instance.new("Frame")
waveContainer.Size = UDim2.new(1, 0, 1, 0)
waveContainer.BackgroundTransparency = 1
waveContainer.Parent = background

local waves = {}
for i = 1, 10 do
local wave = Instance.new("Frame")
wave.Size = UDim2.new(1.5, 0, 0, 2)
wave.Position = UDim2.new(-0.25, 0, i * 0.1, 0)
wave.BackgroundColor3 = Color3.fromRGB(255, 50, 100)
wave.BackgroundTransparency = 0.6
wave.BorderSizePixel = 0
wave.Parent = waveContainer

table.insert(waves, {
frame = wave,
offset = i * 0.4,
speed = 0.4 + math.random() * 0.5
})
end

-- PULSING GLOW CIRCLE
local glowCircle = Instance.new("Frame")
glowCircle.Size = UDim2.new(0, 320, 0, 320)
glowCircle.Position = UDim2.new(0.5, -160, 0.5, -160)
glowCircle.BackgroundColor3 = Color3.fromRGB(255, 40, 80)
glowCircle.BackgroundTransparency = 0.9
glowCircle.BorderSizePixel = 0
glowCircle.Parent = background

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = glowCircle

-- MAIN FRAME
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 480, 0, 420)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 28)
corner.Parent = mainFrame

-- Glow effect
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 10, 1, 10)
glow.Position = UDim2.new(0, -5, 0, -5)
glow.BackgroundColor3 = Color3.fromRGB(255, 50, 110)
glow.BackgroundTransparency = 0.65
glow.BorderSizePixel = 0
glow.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 32)
glowCorner.Parent = glow

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 80)
title.Position = UDim2.new(0, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "CATAHA KEY LAUNCHER"
title.TextColor3 = Color3.fromRGB(255, 50, 110)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 35)
subtitle.Position = UDim2.new(0, 0, 0, 110)
subtitle.BackgroundTransparency = 1
subtitle.Text = "LICENSE VERIFICATION"
subtitle.TextColor3 = Color3.fromRGB(160, 160, 190)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame

-- Key input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 280, 0, 55)
keyBox.Position = UDim2.new(0.5, -140, 0, 175)
keyBox.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
keyBox.BorderSizePixel = 0
keyBox.Text = ""
keyBox.PlaceholderText = "ENTER LICENSE KEY"
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.PlaceholderColor3 = Color3.fromRGB(110, 110, 140)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 18
keyBox.TextXAlignment = Enum.TextXAlignment.Center

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 16)
boxCorner.Parent = keyBox
keyBox.Parent = mainFrame

-- Error label
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, 0, 0, 35)
errorLabel.Position = UDim2.new(0, 0, 0, 240)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 80, 100)
errorLabel.TextScaled = true
errorLabel.Font = Enum.Font.Gotham
errorLabel.Visible = false
errorLabel.Parent = mainFrame

-- Button
local authButton = Instance.new("TextButton")
authButton.Size = UDim2.new(0, 200, 0, 55)
authButton.Position = UDim2.new(0.5, -100, 0, 295)
authButton.BackgroundColor3 = Color3.fromRGB(255, 50, 110)
authButton.Text = "AUTHENTICATE"
authButton.TextColor3 = Color3.fromRGB(255, 255, 255)
authButton.TextScaled = true
authButton.Font = Enum.Font.GothamBold
authButton.BorderSizePixel = 0

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 28)
btnCorner.Parent = authButton
authButton.Parent = mainFrame

-- Button hover
authButton.MouseEnter:Connect(function()
TweenService:Create(authButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 35, 95)}):Play()
end)
authButton.MouseLeave:Connect(function()
TweenService:Create(authButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 110)}):Play()
end)

-- Footer
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 25)
footer.Position = UDim2.new(0, 0, 1, -35)
footer.BackgroundTransparency = 1
footer.Text = "https://discord.gg/uV8B2F7r"
footer.TextColor3 = Color3.fromRGB(80, 80, 100)
footer.TextScaled = true
footer.Font = Enum.Font.Gotham
footer.Parent = mainFrame

-- ANIMATION LOOP
local time = 0
local animationConnection = RunService.RenderStepped:Connect(function(dt)
time = time + dt

for _, p in ipairs(particles) do
local x = p.frame.Position.X.Scale + p.speedX * dt
local y = p.frame.Position.Y.Scale + p.speedY * dt
if x > 1 then x = 0 elseif x < 0 then x = 1 end
if y > 1 then y = 0 elseif y < 0 then y = 1 end
p.frame.Position = UDim2.new(x, 0, y, 0)
p.frame.Rotation = p.frame.Rotation + p.rotSpeed * dt
end

for _, w in ipairs(waves) do
local offset = math.sin(time * w.speed + w.offset) * 0.1
w.frame.Position = UDim2.new(-0.25 + offset, 0, w.frame.Position.Y.Scale, 0)
end

glowCircle.BackgroundTransparency = 0.7 + math.sin(time * 2) * 0.2
glowCircle.Size = UDim2.new(0, 300 + math.sin(time * 2) * 20, 0, 300 + math.sin(time * 2) * 20)
end)

-- Shake animation
local function shakeFrame()
local origPos = mainFrame.Position
for i = 1, 5 do
mainFrame.Position = UDim2.new(0.5, -240 + (i % 2 == 0 and -7 or 7), 0.5, -210)
task.wait(0.02)
end
mainFrame.Position = origPos
end

-- Authentication
local function authenticate()
if keyBox.Text == "devil_key" then
animationConnection:Disconnect()

TweenService:Create(background, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(mainFrame, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
TweenService:Create(glow, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()

for _, p in ipairs(particles) do
TweenService:Create(p.frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
end
for _, w in ipairs(waves) do
TweenService:Create(w.frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
end
TweenService:Create(glowCircle, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()

task.wait(0.5)
screenGui:Destroy()

-- ============================================
-- YOUR FULL SCRIPT
-- ============================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("CATAHA HUB [FREE]", "RJTheme3")

local Tab = Window:NewTab("players")

local Section = Tab:NewSection("powers")

Section:NewSlider("speedhack", "Makes you faster", 500, 0, function(s)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("Jump power", "allows you to jump higher", 500, 0, function(s)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Section = Tab:NewSection("reset stats")

Section:NewButton("reset stats", "makes the default speed and jump power", function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)

local Section = Tab:NewSection("Other powers")

Section:NewButton("Auto Leave", "it automatically pours when someone logs in to the server", function()
game.Players.PlayerAdded:Connect(function(player)
game.Players.LocalPlayer:Kick("Kicked because " .. player.Name .. " joined the game")
end)
end)

Section:NewButton("Target Gui (BUGS)", "target player TP", function()
local targetPlayerName = ""
local runScript = true
local player = game:GetService("Players").LocalPlayer
local PlayersService = game:GetService("Players")
local screenGui = Instance.new("ScreenGui")
local textBox = Instance.new("TextBox")
local button = Instance.new("TextButton")
local stopButton = Instance.new("TextButton")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "TargetPlayerGui"
textBox.Parent = screenGui
textBox.Position = UDim2.new(0.5, -100, 0, 10)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.PlaceholderText = "enter the player nick"
button.Parent = screenGui
button.Position = UDim2.new(0.5, -50, 0, 70)
button.Size = UDim2.new(0, 100, 0, 50)
button.Text = "Activate"
stopButton.Parent = screenGui
stopButton.Position = UDim2.new(0.5, -50, 0, 130)
stopButton.Size = UDim2.new(0, 100, 0, 50)
stopButton.Text = "Stop"
button.MouseButton1Click:Connect(function()
targetPlayerName = textBox.Text
end)
stopButton.MouseButton1Click:Connect(function()
runScript = false
end)
game:GetService("RunService").RenderStepped:Connect(function()
if not runScript then return end
local targetPlayer = PlayersService:FindFirstChild(targetPlayerName)
if targetPlayer and targetPlayer.Character then
local targetCharacter = targetPlayer.Character
if targetCharacter:FindFirstChild("Humanoid") and targetCharacter.Humanoid.Health > 0 and targetCharacter:FindFirstChild("HumanoidRootPart") then
local targetPosition = targetCharacter.HumanoidRootPart.Position
player.Character:MoveTo(targetPosition)
local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
if tool and tool:FindFirstChild("Handle") then
tool:Activate()
for _, part in ipairs(targetCharacter:GetChildren()) do
if part:IsA("BasePart") then
firetouchinterest(tool.Handle, part, 0)
firetouchinterest(tool.Handle, part, 1)
end
end
end
end
end
end)
end)

local Tab = Window:NewTab("untitled sans battles")
local Section = Tab:NewSection("Main")

Section:NewButton("ESP players", "ESP players", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function createHighlight(player)
if player.Character and not player.Character:FindFirstChild("ESPHighlight") then
local highlight = Instance.new("Highlight")
highlight.Name = "ESPHighlight"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Adornee = player.Character
highlight.Parent = player.Character
end
end
local function createNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and not player.Character.Head:FindFirstChild("NameTag") then
local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.Adornee = player.Character.Head
billboard.Size = UDim2.new(0, 130, 0, 25)
billboard.StudsOffset = Vector3.new(0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = player.Character.Head
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TagLabel"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Cartoon
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.6
textLabel.Text = ""
textLabel.Parent = billboard
end
end
local function updateNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") and player.Character:FindFirstChild("Humanoid") then
local tag = player.Character.Head.NameTag.TagLabel
local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
local health = math.floor(player.Character.Humanoid.Health)
tag.Text = player.Name .. " | " .. string.format("%.0f", distance) .. "m | ❤️" .. health
end
end
local function updateHighlight(player)
if player.Character and player.Character:FindFirstChild("ESPHighlight") and player.Character:FindFirstChild("Humanoid") then
if player.Character.Humanoid.Health <= 0 then
player.Character.ESPHighlight.FillColor = Color3.fromRGB(120, 0, 0)
else
player.Character.ESPHighlight.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local function setupESP(player)
if player ~= LocalPlayer then
player.CharacterAdded:Connect(function()
wait(0.1)
createHighlight(player)
createNameTag(player)
end)
if player.Character then
createHighlight(player)
createNameTag(player)
end
end
end
for _, player in ipairs(Players:GetPlayers()) do
setupESP(player)
end
Players.PlayerAdded:Connect(function(player)
setupESP(player)
end)
while true do
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
if player.Character and player.Character:FindFirstChild("Humanoid") then
updateNameTag(player)
updateHighlight(player)
end
end
end
wait(0.3)
end
end)

Section:NewButton("Auto Farm Souls (STOP BIND H)", "Collects all the souls on the map", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "Soul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("sell KR", "selling KR", function()
game:GetService("ReplicatedStorage"):WaitForChild("ShopPurchases"):WaitForChild("krToLvAll"):FireServer()
end)

Section:NewButton("aim lock player (BIND C)", "binds the screen to the player, making it easy to access", function()
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local targetLock = false
local lockedPlayer = nil
local function getClosestPlayer()
local closestPlayer = nil
local shortestDistance = math.huge
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local character = player.Character
local torso = character:FindFirstChild("HumanoidRootPart")
local screenPos = workspace.CurrentCamera:WorldToScreenPoint(torso.Position)
local mousePos = Vector2.new(mouse.X, mouse.Y)
local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
if distance < shortestDistance then
shortestDistance = distance
closestPlayer = player
end
end
end
return closestPlayer
end
local function lockOntoPlayer()
local closestPlayer = getClosestPlayer()
if closestPlayer and closestPlayer.Character then
local torso = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
mouse.TargetFilter = torso
lockedPlayer = closestPlayer
targetLock = true
end
end
end
local function updateLock()
if lockedPlayer and lockedPlayer.Character then
local torso = lockedPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, torso.Position)
end
end
end
UIS.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.C then
if not targetLock then
lockOntoPlayer()
else
mouse.TargetFilter = nil
lockedPlayer = nil
targetLock = false
end
end
end)
RunService.RenderStepped:Connect(function()
if targetLock then
updateLock()
end
end)
end)

local Section = Tab:NewSection("TP hub")

Section:NewButton("AntiVoid", "TP void", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3076.39819, 4349.40625, 7585.1123, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)

Section:NewButton("Snowdin", "TP snowdin", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4588.96484, -3946.73242, 5373.57471, -0.342006564, -0.939697623, -7.00354576e-06, 7.00354576e-06, -1.00135803e-05, 1, -0.939697623, 0.342006564, 1.00135803e-05)
end)

Section:NewButton("WatterFall", "TP watterfall", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(540.083679, 202.89212, 3383.97778, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

Section:NewButton("Corridor", "TP Corridor", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2493.26636, 144.424667, 7829.0957, -4.529953e-06, -9.68575478e-07, -1, 0.406711876, -0.913556457, -9.68575478e-07, -0.913556457, -0.406711876, 4.529953e-06)
end)

Section:NewButton("La jupo hall", "TP la jupo hall", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6582.38965, 2189.19653, 7497.25, -5.25712967e-05, 5.55068254e-06, -1, -0.208693326, -0.977981091, 5.55068254e-06, -0.977981091, 0.208693326, 5.2511692e-05)
end)

Section:NewButton("Baseplate", "TP baseplate", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16364.2246, 48304.2422, -35074.4141, 0.356812239, 0.934176087, 0, -0.934176087, 0.356812239, -0, -0, 0, 1)
end)

local Tab = Window:NewTab("Undertale Last Multiverse")
local Section = Tab:NewSection("Main")

Section:NewButton("ESP players", "ESP players", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function createHighlight(player)
if player.Character and not player.Character:FindFirstChild("ESPHighlight") then
local highlight = Instance.new("Highlight")
highlight.Name = "ESPHighlight"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Adornee = player.Character
highlight.Parent = player.Character
end
end
local function createNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and not player.Character.Head:FindFirstChild("NameTag") then
local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.Adornee = player.Character.Head
billboard.Size = UDim2.new(0, 130, 0, 25)
billboard.StudsOffset = Vector3.new(0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = player.Character.Head
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TagLabel"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Cartoon
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.6
textLabel.Text = ""
textLabel.Parent = billboard
end
end
local function updateNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") and player.Character:FindFirstChild("Humanoid") then
local tag = player.Character.Head.NameTag.TagLabel
local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
local health = math.floor(player.Character.Humanoid.Health)
tag.Text = player.Name .. " | " .. string.format("%.0f", distance) .. "m | ❤️" .. health
end
end
local function updateHighlight(player)
if player.Character and player.Character:FindFirstChild("ESPHighlight") and player.Character:FindFirstChild("Humanoid") then
if player.Character.Humanoid.Health <= 0 then
player.Character.ESPHighlight.FillColor = Color3.fromRGB(120, 0, 0)
else
player.Character.ESPHighlight.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local function setupESP(player)
if player ~= LocalPlayer then
player.CharacterAdded:Connect(function()
wait(0.1)
createHighlight(player)
createNameTag(player)
end)
if player.Character then
createHighlight(player)
createNameTag(player)
end
end
end
for _, player in ipairs(Players:GetPlayers()) do
setupESP(player)
end
Players.PlayerAdded:Connect(function(player)
setupESP(player)
end)
while true do
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
if player.Character and player.Character:FindFirstChild("Humanoid") then
updateNameTag(player)
updateHighlight(player)
end
end
end
wait(0.3)
end
end)

Section:NewButton("DestroyButton", "(destroy object)", function()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0.5, -100, 0.5, -65)
frame.Active = true
frame.Draggable = true
local onButton = Instance.new("TextButton")
onButton.Parent = frame
onButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
onButton.Size = UDim2.new(0, 60, 0, 30)
onButton.Position = UDim2.new(0, 20, 0, 20)
onButton.Text = "On"
onButton.TextScaled = true
local offButton = Instance.new("TextButton")
offButton.Parent = frame
offButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
offButton.Size = UDim2.new(0, 60, 0, 30)
offButton.Position = UDim2.new(0, 120, 0, 20)
offButton.Text = "Off"
offButton.TextScaled = true
local destroyButton = Instance.new("TextButton")
destroyButton.Parent = frame
destroyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
destroyButton.Size = UDim2.new(0, 160, 0, 30)
destroyButton.Position = UDim2.new(0, 20, 0, 60)
destroyButton.Text = "Destroy"
destroyButton.TextScaled = true
local recoverButton = Instance.new("TextButton")
recoverButton.Parent = frame
recoverButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
recoverButton.Size = UDim2.new(0, 160, 0, 30)
recoverButton.Position = UDim2.new(0, 20, 0, 100)
recoverButton.Text = "Recover"
recoverButton.TextScaled = true
local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = frame
statusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Size = UDim2.new(0, 200, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, -30)
statusLabel.Text = "Status: Off"
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
statusLabel.TextScaled = true
local buildingEnabled = false
local selectedPart = nil
local deletedParts = {}
local debounce = false
local function enableBuilding()
buildingEnabled = true
statusLabel.Text = "Status: On"
statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
mouse.Button1Down:Connect(function()
if buildingEnabled and not debounce then
debounce = true
local target = mouse.Target
if target and target ~= selectedPart then
if selectedPart then
selectedPart:Destroy()
end
selectedPart = target
print("Selected Part: " .. selectedPart.Name)
local partClone = selectedPart:Clone()
table.insert(deletedParts, {
Part = partClone,
Position = selectedPart.Position
})
selectedPart:Destroy()
selectedPart = nil
end
wait(0.1)
debounce = false
end
end)
end
local function disableBuilding()
buildingEnabled = false
statusLabel.Text = "Status: Off"
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
selectedPart = nil
end
local function recoverParts()
for _, partData in ipairs(deletedParts) do
local recoveredPart = partData.Part
recoveredPart.Parent = workspace
recoveredPart.Position = partData.Position
print("Recovered Part: " .. recoveredPart.Name)
end
deletedParts = {}
end
local function destroyGui()
recoverParts()
screenGui:Destroy()
disableBuilding()
end
onButton.MouseButton1Click:Connect(function()
if not buildingEnabled then
enableBuilding()
end
end)
offButton.MouseButton1Click:Connect(function()
if buildingEnabled then
disableBuilding()
end
end)
destroyButton.MouseButton1Click:Connect(function()
destroyGui()
end)
recoverButton.MouseButton1Click:Connect(function()
recoverParts()
end)
end)

Section:NewButton("aim lock player (BIND C)", "binds the screen to the player, making it easy to access", function()
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local targetLock = false
local lockedPlayer = nil
local function getClosestPlayer()
local closestPlayer = nil
local shortestDistance = math.huge
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local character = player.Character
local torso = character:FindFirstChild("HumanoidRootPart")
local screenPos = workspace.CurrentCamera:WorldToScreenPoint(torso.Position)
local mousePos = Vector2.new(mouse.X, mouse.Y)
local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
if distance < shortestDistance then
shortestDistance = distance
closestPlayer = player
end
end
end
return closestPlayer
end
local function lockOntoPlayer()
local closestPlayer = getClosestPlayer()
if closestPlayer and closestPlayer.Character then
local torso = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
mouse.TargetFilter = torso
lockedPlayer = closestPlayer
targetLock = true
end
end
end
local function updateLock()
if lockedPlayer and lockedPlayer.Character then
local torso = lockedPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, torso.Position)
end
end
end
UIS.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.C then
if not targetLock then
lockOntoPlayer()
else
mouse.TargetFilter = nil
lockedPlayer = nil
targetLock = false
end
end
end)
RunService.RenderStepped:Connect(function()
if targetLock then
updateLock()
end
end)
end)

local Section = Tab:NewSection("[BIND H] Undertale Last Multiverse AUTO FARM")

Section:NewButton("Auto collector DTsouls", "collect dt souls", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "DTsoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto collector white souls", "collect white souls", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "MSoul1" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto collector KidnessSouls", "collect KidnessSouls", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "KindnessSoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto collector HATE souls", "collect hate soul", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "HATEsoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto collector FearSouls", "collect fear soul", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "FearSoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto EXP collector", "EXP COLLECT", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "Exp2" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto Collector RAINBOW SOULS", "collect rainbow soul", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "RAINBOWSOUL" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto Collector Perserverance souls", "collect Perserverance soul", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "Perserverancesoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto Collector Intergrity Souls", "collect", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "IntergritySoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

Section:NewButton("Auto Collector Bravery Soul", "collect", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRoot = character:WaitForChild("HumanoidRootPart")
local isRunning = true
UserInput.InputBegan:Connect(function(input, gameProcessed)
if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
isRunning = false
end
end)
RunService.Heartbeat:Connect(function()
if not isRunning then return end
for _, obj in pairs(game:GetDescendants()) do
if obj.Name == "BraverySoul" and obj:IsA("BasePart") then
obj.CFrame = humanoidRoot.CFrame
end
end
end)
end)

local Section = Tab:NewSection("TP Hub")

Section:NewButton("WatterFall", "tp watterfall", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4017.71875, 2410.69458, 175.007141, -3.64780426e-05, -0.0546094999, 0.998507738, 0.00506710447, 0.998494983, 0.0546089821, -0.999987125, 0.00506153703, 0.000240266323)
end)

Section:NewButton("Snowdin", "TP snowdin", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3418.42163, 2443.03882, 431.875641, -5.85317612e-05, 0.0187992789, -0.999823272, -0.0159918331, 0.99969542, 0.0187978093, 0.999872148, 0.0159901064, 0.000242173672)
end)

Section:NewButton("Judgement hall", "tp judgement hall", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2471.13086, 2566.6438, -1156.29651, -1, 0, 0, 0, 1, 0, 0, 0, -1)
end)

Section:NewButton("ESP players", "ESP players", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function createHighlight(player)
if player.Character and not player.Character:FindFirstChild("ESPHighlight") then
local highlight = Instance.new("Highlight")
highlight.Name = "ESPHighlight"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Adornee = player.Character
highlight.Parent = player.Character
end
end
local function createNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and not player.Character.Head:FindFirstChild("NameTag") then
local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.Adornee = player.Character.Head
billboard.Size = UDim2.new(0, 130, 0, 25)
billboard.StudsOffset = Vector3.new(0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = player.Character.Head
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TagLabel"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Cartoon
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.6
textLabel.Text = ""
textLabel.Parent = billboard
end
end
local function updateNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") and player.Character:FindFirstChild("Humanoid") then
local tag = player.Character.Head.NameTag.TagLabel
local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
local health = math.floor(player.Character.Humanoid.Health)
tag.Text = player.Name .. " | " .. string.format("%.0f", distance) .. "m | ❤️" .. health
end
end
local function updateHighlight(player)
if player.Character and player.Character:FindFirstChild("ESPHighlight") and player.Character:FindFirstChild("Humanoid") then
if player.Character.Humanoid.Health <= 0 then
player.Character.ESPHighlight.FillColor = Color3.fromRGB(120, 0, 0)
else
player.Character.ESPHighlight.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local function setupESP(player)
if player ~= LocalPlayer then
player.CharacterAdded:Connect(function()
wait(0.1)
createHighlight(player)
createNameTag(player)
end)
if player.Character then
createHighlight(player)
createNameTag(player)
end
end
end
for _, player in ipairs(Players:GetPlayers()) do
setupESP(player)
end
Players.PlayerAdded:Connect(function(player)
setupESP(player)
end)
while true do
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
if player.Character and player.Character:FindFirstChild("Humanoid") then
updateNameTag(player)
updateHighlight(player)
end
end
end
wait(0.3)
end
end)

local Tab = Window:NewTab("Sans Game Remake")
local Section = Tab:NewSection("Main")

Section:NewButton("ESP players", "ESP players", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function createHighlight(player)
if player.Character and not player.Character:FindFirstChild("ESPHighlight") then
local highlight = Instance.new("Highlight")
highlight.Name = "ESPHighlight"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Adornee = player.Character
highlight.Parent = player.Character
end
end
local function createNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and not player.Character.Head:FindFirstChild("NameTag") then
local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.Adornee = player.Character.Head
billboard.Size = UDim2.new(0, 130, 0, 25)
billboard.StudsOffset = Vector3.new(0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = player.Character.Head
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TagLabel"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Cartoon
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.6
textLabel.Text = ""
textLabel.Parent = billboard
end
end
local function updateNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") and player.Character:FindFirstChild("Humanoid") then
local tag = player.Character.Head.NameTag.TagLabel
local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
local health = math.floor(player.Character.Humanoid.Health)
tag.Text = player.Name .. " | " .. string.format("%.0f", distance) .. "m | ❤️" .. health
end
end
local function updateHighlight(player)
if player.Character and player.Character:FindFirstChild("ESPHighlight") and player.Character:FindFirstChild("Humanoid") then
if player.Character.Humanoid.Health <= 0 then
player.Character.ESPHighlight.FillColor = Color3.fromRGB(120, 0, 0)
else
player.Character.ESPHighlight.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local function setupESP(player)
if player ~= LocalPlayer then
player.CharacterAdded:Connect(function()
wait(0.1)
createHighlight(player)
createNameTag(player)
end)
if player.Character then
createHighlight(player)
createNameTag(player)
end
end
end
for _, player in ipairs(Players:GetPlayers()) do
setupESP(player)
end
Players.PlayerAdded:Connect(function(player)
setupESP(player)
end)
while true do
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
if player.Character and player.Character:FindFirstChild("Humanoid") then
updateNameTag(player)
updateHighlight(player)
end
end
end
wait(0.3)
end
end)

Section:NewButton("aim lock player (BIND C)", "binds the screen to the player, making it easy to access", function()
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local targetLock = false
local lockedPlayer = nil
local function getClosestPlayer()
local closestPlayer = nil
local shortestDistance = math.huge
for _, player in pairs(Players:GetPlayers()) do
if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local character = player.Character
local torso = character:FindFirstChild("HumanoidRootPart")
local screenPos = workspace.CurrentCamera:WorldToScreenPoint(torso.Position)
local mousePos = Vector2.new(mouse.X, mouse.Y)
local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
if distance < shortestDistance then
shortestDistance = distance
closestPlayer = player
end
end
end
return closestPlayer
end
local function lockOntoPlayer()
local closestPlayer = getClosestPlayer()
if closestPlayer and closestPlayer.Character then
local torso = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
mouse.TargetFilter = torso
lockedPlayer = closestPlayer
targetLock = true
end
end
end
local function updateLock()
if lockedPlayer and lockedPlayer.Character then
local torso = lockedPlayer.Character:FindFirstChild("HumanoidRootPart")
if torso then
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, torso.Position)
end
end
end
UIS.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.C then
if not targetLock then
lockOntoPlayer()
else
mouse.TargetFilter = nil
lockedPlayer = nil
targetLock = false
end
end
end)
RunService.RenderStepped:Connect(function()
if targetLock then
updateLock()
end
end)
end)

local Section = Tab:NewSection("Auto Farming(BETA)")

local player = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local active = false
local connection = nil
local function getAllDeathSouls()
local souls = {}
for _, obj in ipairs(workspace:GetDescendants()) do
if obj.Name == "DeathSoul" and obj:IsA("BasePart") then
table.insert(souls, obj)
end
end
return souls
end
local function collectDeathSouls()
if not active then return end
local character = player.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
if not rootPart then return end
local souls = getAllDeathSouls()
local count = 0
for _, soul in ipairs(souls) do
if soul.Parent ~= character then
soul.CFrame = CFrame.new(rootPart.Position + Vector3.new(0, 2, 0))
soul.Velocity = Vector3.new(0, 0, 0)
count = count + 1
end
end
if count > 0 then
print("[AUTO COLLECTOR] Collected " .. count .. " DeathSouls")
end
end
local function toggleCollector(state)
if state then
if active then return end
active = true
connection = runService.Heartbeat:Connect(collectDeathSouls)
print("[AUTO COLLECTOR] ENABLED - Collecting DeathSouls")
else
if not active then return end
active = false
if connection then
connection:Disconnect()
connection = nil
end
print("[AUTO COLLECTOR] DISABLED")
end
end
Section:NewToggle("Auto Collector - DeathSoul", "Automatically collects all DeathSouls to your character", toggleCollector)

local player = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local active = false
local connection = nil
local function getAllOPSouls()
local souls = {}
for _, obj in ipairs(workspace:GetDescendants()) do
if obj.Name == "OPSoul" and obj:IsA("BasePart") then
table.insert(souls, obj)
end
end
return souls
end
local function collectOPSouls()
if not active then return end
local character = player.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
if not rootPart then return end
local souls = getAllOPSouls()
local count = 0
for _, soul in ipairs(souls) do
if soul.Parent ~= character then
soul.CFrame = CFrame.new(rootPart.Position + Vector3.new(0, 2, 0))
soul.Velocity = Vector3.new(0, 0, 0)
count = count + 1
end
end
if count > 0 then
print("[AUTO COLLECTOR] Collected " .. count .. " OPSouls")
end
end
local function toggleCollector(state)
if state then
if active then return end
active = true
connection = runService.Heartbeat:Connect(collectOPSouls)
print("[AUTO COLLECTOR] ENABLED - Collecting OPSouls")
else
if not active then return end
active = false
if connection then
connection:Disconnect()
connection = nil
end
print("[AUTO COLLECTOR] DISABLED")
end
end
Section:NewToggle("Auto Collector - OPSoul", "Automatically collects all OPSouls to your character", toggleCollector)

local player = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local active = false
local connection = nil
local function getAllSouls()
local souls = {}
for _, obj in ipairs(workspace:GetDescendants()) do
if obj.Name == "Soul" and obj:IsA("BasePart") then
table.insert(souls, obj)
end
end
return souls
end
local function collectSouls()
if not active then return end
local character = player.Character
if not character then return end
local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
if not rootPart then return end
local souls = getAllSouls()
local count = 0
for _, soul in ipairs(souls) do
if soul.Parent ~= character then
soul.CFrame = CFrame.new(rootPart.Position + Vector3.new(0, 2, 0))
soul.Velocity = Vector3.new(0, 0, 0)
count = count + 1
end
end
if count > 0 then
print("[AUTO COLLECTOR] Collected " .. count .. " Souls")
end
end
local function toggleCollector(state)
if state then
if active then return end
active = true
connection = runService.Heartbeat:Connect(collectSouls)
print("[AUTO COLLECTOR] ENABLED - Collecting Souls")
else
if not active then return end
active = false
if connection then
connection:Disconnect()
connection = nil
end
print("[AUTO COLLECTOR] DISABLED")
end
end
Section:NewToggle("Auto Collector - Soul", "Automatically collects all Souls to your character", toggleCollector)

local Tab = Window:NewTab("Мурино хоррор")
local Section = Tab:NewSection("Сoming soon!")
Section:NewButton("ESP players", "ESP players", function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local function createHighlight(player)
if player.Character and not player.Character:FindFirstChild("ESPHighlight") then
local highlight = Instance.new("Highlight")
highlight.Name = "ESPHighlight"
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
highlight.FillTransparency = 0.6
highlight.OutlineTransparency = 0
highlight.Adornee = player.Character
highlight.Parent = player.Character
end
end
local function createNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and not player.Character.Head:FindFirstChild("NameTag") then
local billboard = Instance.new("BillboardGui")
billboard.Name = "NameTag"
billboard.Adornee = player.Character.Head
billboard.Size = UDim2.new(0, 130, 0, 25)
billboard.StudsOffset = Vector3.new(0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = player.Character.Head
local textLabel = Instance.new("TextLabel")
textLabel.Name = "TagLabel"
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.Cartoon
textLabel.TextScaled = true
textLabel.TextStrokeTransparency = 0.6
textLabel.Text = ""
textLabel.Parent = billboard
end
end
local function updateNameTag(player)
if player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("NameTag") and player.Character:FindFirstChild("Humanoid") then
local tag = player.Character.Head.NameTag.TagLabel
local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
local health = math.floor(player.Character.Humanoid.Health)
tag.Text = player.Name .. " | " .. string.format("%.0f", distance) .. "m | ❤️" .. health
end
end
local function updateHighlight(player)
if player.Character and player.Character:FindFirstChild("ESPHighlight") and player.Character:FindFirstChild("Humanoid") then
if player.Character.Humanoid.Health <= 0 then
player.Character.ESPHighlight.FillColor = Color3.fromRGB(120, 0, 0)
else
player.Character.ESPHighlight.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local function setupESP(player)
if player ~= LocalPlayer then
player.CharacterAdded:Connect(function()
wait(0.1)
createHighlight(player)
createNameTag(player)
end)
if player.Character then
createHighlight(player)
createNameTag(player)
end
end
end
for _, player in ipairs(Players:GetPlayers()) do
setupESP(player)
end
Players.PlayerAdded:Connect(function(player)
setupESP(player)
end)
while true do
for _, player in ipairs(Players:GetPlayers()) do
if player ~= LocalPlayer then
if player.Character and player.Character:FindFirstChild("Humanoid") then
updateNameTag(player)
updateHighlight(player)
end
end
end
wait(0.3)
end
end)

local Tab = Window:NewTab("NOT my scripts")
local Section = Tab:NewSection("scripts")

Section:NewButton("infinite_yield", "типо админ панель", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Section:NewButton("DEX_explorer", "позволяет залазить в файлы игры", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)

Section:NewButton("GodMode by @botreal1", "godmode", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"))()
end)

print("[[CATAHA HUB]] Loaded")
-- ============================================
else
keyBox.Text = ""
errorLabel.Text = "INVALID LICENSE KEY"
errorLabel.Visible = true
shakeFrame()
task.wait(1.5)
errorLabel.Visible = false
end
end

authButton.MouseButton1Click:Connect(authenticate)
keyBox.FocusLost:Connect(function(enter) if enter then authenticate() end end)

-- Open animation
mainFrame.BackgroundTransparency = 1
glow.BackgroundTransparency = 1
TweenService:Create(mainFrame, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
TweenService:Create(glow, TweenInfo.new(0.4), {BackgroundTransparency = 0.65}):Play()
