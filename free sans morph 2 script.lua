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

local Window = Library.CreateLib("CATAHA SCRIPT Free sans morph 2 ", "RJTheme3")

local Tab = Window:NewTab("Main")

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
            tag.Text = player.Name .. " | " .. string.format("%.0f", distance).."m | ❤️"..health
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

local Section = Tab:NewSection("Grinds resets [STOP BIND H]")

Section:NewButton("geno sans grind", "grind", function()
    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local autoEnabled = true
    local bindKey = Enum.KeyCode.H
    local scriptStopped = false

    local function resetCharacter()
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    local function executeGenoSansSelection()
        local gui = player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local selectGui = gui:FindFirstChild("SelectCharacterGui")
        if not selectGui then return false end
        local frame = selectGui:FindFirstChild("Frame")
        if not frame then return false end
        local remote = frame:FindFirstChild("RemoteEvent")
        if not remote then return false end
        remote:FireServer(unpack({"geno sans", false}))
        return true
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
            autoEnabled = false
            scriptStopped = true
        end
    end)

    spawn(function()
        while autoEnabled do
            pcall(function()
                executeGenoSansSelection()
            end)
            wait(0.1)
        end
    end)

    spawn(function()
        while autoEnabled do
            wait(6)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(1)
            end
        end
    end)
end)

Section:NewButton("sudden changes grind", "grinds", function()
    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local autoEnabled = true
    local bindKey = Enum.KeyCode.H
    local scriptStopped = false

    local function resetCharacter()
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    local function executeSuddenChangesSelection()
        local gui = player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local selectGui = gui:FindFirstChild("SelectCharacterGui")
        if not selectGui then return false end
        local frame = selectGui:FindFirstChild("Frame")
        if not frame then return false end
        local remote = frame:FindFirstChild("RemoteEvent")
        if not remote then return false end
        remote:FireServer(unpack({"sudden changes", false}))
        return true
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
            autoEnabled = false
            scriptStopped = true
        end
    end)

    spawn(function()
        while autoEnabled do
            pcall(function()
                executeSuddenChangesSelection()
            end)
            wait(0.1)
        end
    end)

    spawn(function()
        while autoEnabled do
            wait(6)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(1)
            end
        end
    end)
end)

Section:NewButton("DustDustDust grind", "grinds", function()
    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local autoEnabled = true
    local bindKey = Enum.KeyCode.H
    local scriptStopped = false

    local function resetCharacter()
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    local function executeDustdustdustSelection()
        local gui = player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local selectGui = gui:FindFirstChild("SelectCharacterGui")
        if not selectGui then return false end
        local frame = selectGui:FindFirstChild("Frame")
        if not frame then return false end
        local remote = frame:FindFirstChild("RemoteEvent")
        if not remote then return false end
        remote:FireServer(unpack({"dustdustdust", false}))
        return true
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
            autoEnabled = false
            scriptStopped = true
        end
    end)

    spawn(function()
        while autoEnabled do
            pcall(function()
                executeDustdustdustSelection()
            end)
            wait(0.1)
        end
    end)

    spawn(function()
        while autoEnabled do
            wait(6)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(1)
            end
        end
    end)
end)

Section:NewButton("dusttrust2 grind", "grinds", function()
    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local autoEnabled = true
    local bindKey = Enum.KeyCode.H
    local scriptStopped = false

    local function resetCharacter()
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    local function executeDusttrust2Selection()
        local args = {"dusttrust2", true}
        local gui = player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local selectGui = gui:FindFirstChild("SelectCharacterGui")
        if not selectGui then return false end
        local frame = selectGui:FindFirstChild("Frame")
        if not frame then return false end
        local remote = frame:FindFirstChild("RemoteEvent")
        if not remote then return false end
        remote:FireServer(unpack(args))
        return true
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
            autoEnabled = false
            scriptStopped = true
        end
    end)

    spawn(function()
        while autoEnabled do
            pcall(function()
                executeDusttrust2Selection()
            end)
            wait(0.1)
        end
    end)

    spawn(function()
        while autoEnabled do
            wait(6)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(1)
            end
        end
    end)
end)

Section:NewButton("distrust grind", "grinds", function()
    local player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")

local autoEnabled = true
local bindKey = Enum.KeyCode.H
local scriptStopped = false

local function resetCharacter()
    local character = player.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = 0
    end
end

local function executeDistrustSelection()
    local gui = player:FindFirstChild("PlayerGui")
    if not gui then return false end
    local selectGui = gui:FindFirstChild("SelectCharacterGui")
    if not selectGui then return false end
    local frame = selectGui:FindFirstChild("Frame")
    if not frame then return false end
    local remote = frame:FindFirstChild("RemoteEvent")
    if not remote then return false end
    remote:FireServer(unpack({"distrust", false}))
    return true
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
        autoEnabled = false
        scriptStopped = true
    end
end)

spawn(function()
    while autoEnabled do
        pcall(function()
            executeDistrustSelection()
        end)
        wait(0.1)
    end
end)

spawn(function()
    while autoEnabled do
        wait(7)
        if autoEnabled then
            pcall(function()
                resetCharacter()
            end)
            wait(1)
        end
    end
end)
end)

Section:NewButton("Alpha sans grind", "grinds", function()
    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local autoEnabled = true
    local bindKey = Enum.KeyCode.H
    local scriptStopped = false

    local function resetCharacter()
        local character = player.Character
        local humanoid = character and character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    local function executeAlphaSansSelection()
        local args = {"Alpha sans", true}
        local gui = player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local selectGui = gui:FindFirstChild("SelectCharacterGui")
        if not selectGui then return false end
        local frame = selectGui:FindFirstChild("Frame")
        if not frame then return false end
        local remote = frame:FindFirstChild("RemoteEvent")
        if not remote then return false end
        remote:FireServer(unpack(args))
        return true
    end

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == bindKey and autoEnabled and not scriptStopped then
            autoEnabled = false
            scriptStopped = true
        end
    end)

    spawn(function()
        while autoEnabled do
            pcall(function()
                executeAlphaSansSelection()
            end)
            wait(0.1)
        end
    end)

    spawn(function()
        while autoEnabled do
            wait(6)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(1)
            end
        end
    end)
end)
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
