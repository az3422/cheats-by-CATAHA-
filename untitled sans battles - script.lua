local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("мульти панель", "RJTheme3")

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

local Tab = Window:NewTab("дефолт скрипты")

local Section = Tab:NewSection("scripts")

Section:NewButton("infinity_yield", "типо админ панель", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

end)

Section:NewButton("DEX_explorer", "позволяет залазить в файлы игры", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)
