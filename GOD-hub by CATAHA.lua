local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("CATAHA hub", "RJTheme3")

local Tab = Window:NewTab("players")

local Section = Tab:NewSection("powers")

Section:NewSlider("скорость", "делает тебя быстрее", 500, 0, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("сила прыжка", "позволяет выше прыгать", 500, 0, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewButton("noclip", "ну тут и так все ясно, ноуклип", function()
    
end)

local Section = Tab:NewSection("reset stats")

Section:NewButton("ресет статов", "делает дефолтную скорость и силу прыжка", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)

local Section = Tab:NewSection("остальные силы")

Section:NewButton("авто лив", "автоматически ливает когда кто то заходит на сервер", function()
    game.Players.PlayerAdded:Connect(function(player)
    game.Players.LocalPlayer:Kick("Kicked because " .. player.Name .. " joined the game")
end)
end)

local Tab = Window:NewTab("untitled sans battles")

local Section = Tab:NewSection("основные читы на эту игру")

Section:NewButton("Auto Farm Souls (STOP BIND H)", "пылисосит все души на карте", function()
    local Players      = game:GetService("Players")
local RunService   = game:GetService("RunService")
local UserInput    = game:GetService("UserInputService")

local player       = Players.LocalPlayer
local character    = player.Character or player.CharacterAdded:Wait()
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

Section:NewButton("sell KR", "продает кр", function()
    game:GetService("ReplicatedStorage"):WaitForChild("ShopPurchases"):WaitForChild("krToLvAll"):FireServer()
end)


Section:NewButton("aim lock player (BIND C)", "привязывает экран к игроку позволяя легко попадать", function()
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

Section:NewButton("AntiVoid", "телепортирует в пустоту", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3076.39819, 4349.40625, 7585.1123, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)

Section:NewButton("Snowdin", "телепортирует в сноудин", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4588.96484, -3946.73242, 5373.57471, -0.342006564, -0.939697623, -7.00354576e-06, 7.00354576e-06, -1.00135803e-05, 1, -0.939697623, 0.342006564, 1.00135803e-05)
end)

Section:NewButton("WatterFall", "телепортирует в водопадье", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(540.083679, 202.89212, 3383.97778, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

Section:NewButton("Corridor", "телепортирует в коридор", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2493.26636, 144.424667, 7829.0957, -4.529953e-06, -9.68575478e-07, -1, 0.406711876, -0.913556457, -9.68575478e-07, -0.913556457, -0.406711876, 4.529953e-06)
end)

Section:NewButton("La jupo hall", "телепортирует в ла джупо коридор", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6582.38965, 2189.19653, 7497.25, -5.25712967e-05, 5.55068254e-06, -1, -0.208693326, -0.977981091, 5.55068254e-06, -0.977981091, 0.208693326, 5.2511692e-05)
end)

Section:NewButton("Baseplate", "телепортирует на басплейт", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(16364.2246, 48304.2422, -35074.4141, 0.356812239, 0.934176087, 0, -0.934176087, 0.356812239, -0, -0, 0, 1)
end)

local Tab = Window:NewTab("дефолт скрипты")

local Section = Tab:NewSection("scripts")

Section:NewButton("infinity_yield", "типо админ панель", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

end)

Section:NewButton("DEX_explorer", "позволяет залазить в файлы игры", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)
