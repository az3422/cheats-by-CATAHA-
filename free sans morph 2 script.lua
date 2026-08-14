local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("DIVINE SCRIPT Free sans morph 2 ", "RJTheme3")

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

Section:NewButton("geno sans grind (20 resets)", "grind", function()
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.2)
            end
        end
    end)
end)

Section:NewButton("sudden changes grind (26 resets)", "grinds", function()
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.2)
            end
        end
    end)
end)

Section:NewButton("DustDustDust grind(30 resets)", "grinds", function()
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.1)
            end
        end
    end)
end)

Section:NewButton("dusttrust2 grind (32 resets)", "grinds", function()
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.1)
            end
        end
    end)
end)

Section:NewButton("distrust grind (17 resets)", "grinds", function()
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
        wait(2.4)
        if autoEnabled then
            pcall(function()
                resetCharacter()
            end)
            wait(0.1)
        end
    end
end)
end)

Section:NewButton("Alpha sans grind (40 resets)", "grinds", function()
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.1)
            end
        end
    end)
end)

Section:NewButton("Error404 grind(35 resets)", "grinds", function()
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
        local args = {"Error404", true}
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
            wait(2.4)
            if autoEnabled then
                pcall(function()
                    resetCharacter()
                end)
                wait(0.1)
            end
        end
    end)
end)

Section:NewButton("farm op characters", "grinds", function()
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

local function executeSansSelection()
    local gui = player:FindFirstChild("PlayerGui")
    if not gui then return false end
    local selectGui = gui:FindFirstChild("SelectCharacterGui")
    if not selectGui then return false end
    local frame = selectGui:FindFirstChild("Frame")
    if not frame then return false end
    local remote = frame:FindFirstChild("RemoteEvent")
    if not remote then return false end
    remote:FireServer(unpack({"sans", false}))
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
            executeSansSelection()
        end)
        wait(0.1)
    end
end)

spawn(function()
    while autoEnabled do
        wait(2.4)
        if autoEnabled then
            pcall(function()
                resetCharacter()
            end)
            wait(0.1)
        end
    end
end)
end)

Section:NewButton("ultra sans grind (33 resets)", "grinds", function()
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

local function executeSansSelection()
    local gui = player:FindFirstChild("PlayerGui")
    if not gui then return false end
    local selectGui = gui:FindFirstChild("SelectCharacterGui")
    if not selectGui then return false end
    local frame = selectGui:FindFirstChild("Frame")
    if not frame then return false end
    local remote = frame:FindFirstChild("RemoteEvent")
    if not remote then return false end
    remote:FireServer(unpack({"delta sans", false}))
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
            executeSansSelection()
        end)
        wait(0.1)
    end
end)

spawn(function()
    while autoEnabled do
        wait(2.4)
        if autoEnabled then
            pcall(function()
                resetCharacter()
            end)
            wait(0.1)
        end
    end
end)
end)

local Tab = Window:NewTab("INFO")

local Section = Tab:NewSection("this script is not complete. updates will be made")
