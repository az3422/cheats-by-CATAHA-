local grill = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_outsideGrillby's")
local sans1 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_outsideSans'house")
local sans2 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_outsideSans'house2")
local burgerthing = game.Workspace.Locations.Snowdin:FindFirstChild("Grillby's")
local secretroom = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_secret_door")
local bp = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_Baseplate")
local LJ1 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_LAJUPO")
local LJ2 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_LAJUPO2")
local JH1 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_jhall1")
local JH2 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_jhall2")
local snow1 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_snowdin")
local snow2 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_snowdin2")
local snow3 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_snowdin3")
local water1 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_waterfall")
local water2 = game.Workspace.TeleportsFolder.Portals:FindFirstChild("loc_portal_waterfall2")
local rift = game.ReplicatedStorage.PhaseAttacks.fatal_error_sans.FATAL_WARP.Zone:FindFirstChild("Rift")
rift.toggle.ProximityPrompt.HoldDuration = 0

local TreesDeleted = false
local RiftHack = false
local InformationGuiEnable = false
local SureDeleteThis = false
local CustomOpened = false
local GodModesOpened = false

local sc = Instance.new("ScreenGui")
sc.Parent = game.Players.LocalPlayer.PlayerGui
sc.ResetOnSpawn = false

local bb = Instance.new("TextButton")
bb.Size = UDim2.new(0.1, 0, 0.05, 0)
bb.Position = UDim2.new(0.45, 0, 0.86, 0)
bb.TextScaled = true
bb.Text = "Открыть меню телепорта"
bb.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb.Name = "TB1"

bb.MouseButton1Click:Connect(function() 
	game.Players.LocalPlayer.PlayerGui.TeleportUI.Enabled = true
end)

local bb2 = Instance.new("TextButton")
bb2.Size = UDim2.new(0.05, 0, 0.025, 0)
bb2.Position = UDim2.new(0.01, 0, 0.97, 0)
bb2.TextScaled = true
bb2.Text = "Скрыть кнопки"
bb2.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb2.Name = "TB2"

bb2.MouseButton1Click:Connect(function() 
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB1.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB4.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB8.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB10.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB9.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB6.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB3.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB2.Visible = false
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB13.Visible = false		
end)

local bb3 = Instance.new("TextButton")
bb3.Size = UDim2.new(0.05, 0, 0.025, 0)
bb3.Position = UDim2.new(0.01, 0, 0.97, 0)
bb3.TextScaled = true
bb3.Text = "Показать кнопки"
bb3.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb3.Visible = false
bb3.Name = "TB3"

bb3.MouseButton1Click:Connect(function() 
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB1.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB2.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB4.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB8.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB10.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB13.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB9.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB6.Visible = true
	game.Players.LocalPlayer.PlayerGui.ScreenGui.TB3.Visible = false
end)

local bb4 = Instance.new("TextButton")
bb4.Size = UDim2.new(0.09, 0, 0.04, 0)
bb4.Position = UDim2.new(0.01, 0, 0.86, 0)
bb4.TextScaled = true
bb4.Text = "Актирировать основные функции"
bb4.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb4.Name = "TB4"

bb4.MouseButton1Click:Connect(function() 
	grill.toggle.ProximityPrompt.HoldDuration = 0
	sans1.toggle.ProximityPrompt.HoldDuration = 0
	sans2.toggle.ProximityPrompt.HoldDuration = 0
	secretroom.toggle.ProximityPrompt.HoldDuration = 0
	burgerthing.SnowBurg.Burger.toggle.ProximityPrompt.HoldDuration = 0
	bp.toggle.ProximityPrompt.HoldDuration = 0
	LJ1.toggle.ProximityPrompt.HoldDuration = 0
	LJ2.toggle.ProximityPrompt.HoldDuration = 0
	JH1.toggle.ProximityPrompt.HoldDuration = 0
	JH2.toggle.ProximityPrompt.HoldDuration = 0
	snow1.toggle.ProximityPrompt.HoldDuration = 0
	snow2.toggle.ProximityPrompt.HoldDuration = 0
	snow3.toggle.ProximityPrompt.HoldDuration = 0
	water1.toggle.ProximityPrompt.HoldDuration = 0
	water2.toggle.ProximityPrompt.HoldDuration = 0
end)

local bb5 = Instance.new("TextButton")
bb5.Size = UDim2.new(0.09, 0, 0.04, 0)
bb5.Position = UDim2.new(0.01, 0, 0.86, 0)
bb5.TextScaled = true
bb5.Text = "Создать объект который помогает залезть на крышу гриллби"
bb5.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb5.Name = "TBDeleted1"
bb5.Visible = false

bb4.MouseButton1Click:Connect(function() 
	Instance.new("Part", game.Workspace)
	mainpart = game.Workspace:FindFirstChild("Part")
	mainpart.Name = "WORK69"
	mainpart.CFrame = CFrame.new(4780, -3928, 4964)
	mainpart.Anchored = true
	mainpart.CFrame = CFrame.new(4780, -3928, 4964)
end)

local bb6 = Instance.new("TextButton")
bb6.Size = UDim2.new(0.09, 0, 0.04, 0)
bb6.Position = UDim2.new(0.11, 0, 0.86, 0)
bb6.TextScaled = true
bb6.Text = "Hack-Rift"
bb6.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb6.Name = "TB6"

bb6.MouseButton1Click:Connect(function() 
	if RiftHack then
		game.Workspace.Rift.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	else
		rift.Parent = game.workspace
		game.Workspace.Rift.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	end
end)

local bb8 = Instance.new("TextButton")
bb8.Size = UDim2.new(0.09, 0, 0.04, 0)
bb8.Position = UDim2.new(0.11, 0, 0.91, 0)
bb8.TextScaled = true
bb8.Text = "Врубить CustomEvade без Cooldown (Используйте кнопку Q для customevade)"
bb8.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb8.Name = "TB8"

bb8.MouseButton1Click:Connect(function() 
	local me = game.Players.LocalPlayer.Character
	local HRP = me:FindFirstChild("HumanoidRootPart")
	local UIS = game:GetService("UserInputService")

	local function customevade()
		local LD = HRP.CFrame.LookVector
		local evadepos = HRP.Position + (LD * 45)
		local NCF = CFrame.new(evadepos) * HRP.CFrame:ToObjectSpace(HRP.CFrame)
		HRP.CFrame = NCF
	end

	UIS.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.Q then
			customevade()
		end
	end)
end)

local bb9 = Instance.new("TextButton")
bb9.Size = UDim2.new(0.09, 0, 0.04, 0)
bb9.Position = UDim2.new(0.21, 0, 0.86, 0)
bb9.TextScaled = true
bb9.Text = "Убрать деревья"
bb9.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb9.Name = "TB9"

bb9.MouseButton1Click:Connect(function() 
	local function test()
		game.Workspace.Locations.Snowdin.Trees.Parent = game.ReplicatedStorage
		TreesDeleted = true
	end

	local function test2()
		game.ReplicatedStorage.Trees.Parent = game.Workspace.Locations.Snowdin
		TreesDeleted = false
	end

	if TreesDeleted then
		test2()
		bb9.Text = "Убрать деревья"
	else
		test()
		bb9.Text = "Вернуть деревья"
	end
end)

local bb10 = Instance.new("TextButton")
bb10.Size = UDim2.new(0.09, 0, 0.04, 0)
bb10.Position = UDim2.new(0.01, 0, 0.91, 0)
bb10.TextScaled = true
bb10.Text = "Дюпнуть предмет в руках [Клиент]"
bb10.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb10.Name = "TB10"

bb10.MouseButton1Click:Connect(function() 
	local TDP = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	local clone = TDP:Clone()
	clone.Parent = game.Players.LocalPlayer.Backpack
end)

local T1 = Instance.new("TextBox")
T1.Size = UDim2.new(0.4, 0, 0.05, 0)
T1.Position = UDim2.new(0.282, 0, 0.05, 0)
T1.TextScaled = true
T1.BackgroundTransparency = 0.42
T1.TextEditable = false
T1.ClearTextOnFocus = false
T1.Text = "Открыть меню телепорта: открывает GUI телепорта из USB"
T1.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T1.Name = "Text1"
T1.Visible = false

local T2 = Instance.new("TextBox")
T2.Size = UDim2.new(0.4, 0, 0.05, 0)
T2.Position = UDim2.new(0.282, 0, 0.11, 0)
T2.TextScaled = true
T2.BackgroundTransparency = 0.42
T2.TextEditable = false
T2.ClearTextOnFocus = false
T2.Text = "Актирировать основные функции: вырубает задержку у телепортов во всех локациях + создает объект который помогает залезть на крышу гриллби"
T2.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T2.Name = "Text2"
T2.Visible = false

local T3 = Instance.new("TextBox")
T3.Size = UDim2.new(0.4, 0, 0.05, 0)
T3.Position = UDim2.new(0.282, 0, 0.17, 0)
T3.TextScaled = true
T3.BackgroundTransparency = 0.42
T3.TextEditable = false
T3.ClearTextOnFocus = false
T3.Text = "Hack-Rift: телепортирует Rift от fatal_error_sans к вам, также вырубает у него задержку"
T3.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T3.Name = "Text3"
T3.Visible = false

local T4 = Instance.new("TextBox")
T4.Size = UDim2.new(0.4, 0, 0.05, 0)
T4.Position = UDim2.new(0.282, 0, 0.23, 0)
T4.TextScaled = true
T4.BackgroundTransparency = 0.42
T4.TextEditable = false
T4.ClearTextOnFocus = false
T4.Text = "Врубить CustomEvade: врубает CustomEvade с биндом на Q, если-что CustomEvade выключается после смерти/ресета не забывайте об этом!"
T4.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T4.Name = "Text4"
T4.Visible = false

local T5 = Instance.new("TextBox")
T5.Size = UDim2.new(0.4, 0, 0.05, 0)
T5.Position = UDim2.new(0.282, 0, 0.29, 0)
T5.TextScaled = true
T5.BackgroundTransparency = 0.42
T5.TextEditable = false
T5.ClearTextOnFocus = false
T5.Text = "Убрать деревья: убирает все деревья в Snowdin, можно вернуть"
T5.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T5.Name = "Text5"
T5.Visible = false

local T6 = Instance.new("TextBox")
T6.Size = UDim2.new(0.4, 0, 0.05, 0)
T6.Position = UDim2.new(0.282, 0, 0.35, 0)
T6.TextScaled = true
T6.BackgroundTransparency = 0.42
T6.TextEditable = false
T6.ClearTextOnFocus = false
T6.Text = "Дюпнуть предмет в руках: при нажатии у вас дюпнится предмет в инвентарь который вы держите, однако работает на очень маленькое количество предметов!"
T6.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T6.Name = "Text6"
T6.Visible = false

local T7 = Instance.new("TextBox")
T7.Size = UDim2.new(0.4, 0, 0.05, 0)
T7.Position = UDim2.new(0.282, 0, 0.41, 0)
T7.TextScaled = true
T7.BackgroundTransparency = 0.42
T7.TextEditable = false
T7.ClearTextOnFocus = false
T7.Text = "Рандомная телепортация: телепортирует в Rift в Anti-void (если кнопка не работает используйте hack-rift и тп в anti-void, после этого она должна работать)"
T7.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
T7.Name = "Text7"
T7.Visible = false

local bb11 = Instance.new("TextButton")
bb11.Size = UDim2.new(0.05, 0, 0.025, 0)
bb11.Position = UDim2.new(0.07, 0, 0.97, 0)
bb11.TextScaled = true
bb11.Text = "Показать подсказку"
bb11.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb11.Name = "TB11"

bb11.MouseButton1Click:Connect(function()
	if InformationGuiEnable then
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text1.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text2.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text3.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text4.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text5.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text6.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text7.Visible = false
		bb11.Text = "Показать подсказку"
		InformationGuiEnable = false
	else
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text1.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text2.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text3.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text4.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text5.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text6.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.Text7.Visible = true
		bb11.Text = "Скрыть подсказку"
		InformationGuiEnable = true
	end		
end)

local bb12 = Instance.new("TextButton")
bb12.Size = UDim2.new(0.05, 0, 0.025, 0)
bb12.Position = UDim2.new(0.13, 0, 0.97, 0)
bb12.TextScaled = true
bb12.Text = "Уничтожить ScreenGui"
bb12.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb12.Name = "TB12"
bb12.BackgroundColor3 = Color3.fromRGB(165, 0, 0)

bb12.MouseButton1Click:Connect(function()
	if SureDeleteThis then
		game.Players.LocalPlayer.PlayerGui.ScreenGui:Destroy()
	else
		bb12.Text = "Нажмите ещё раз для удаления GUI"
		SureDeleteThis = true
	end		
end)

local bb13 = Instance.new("TextButton")
bb13.Size = UDim2.new(0.09, 0, 0.04, 0)
bb13.Position = UDim2.new(0.21, 0, 0.91, 0)
bb13.TextScaled = true
bb13.Text = "Рандомная телепортация"
bb13.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb13.Name = "TB13"

bb13.MouseButton1Click:Connect(function() 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.workspace.Locations.AntiVoid.Rift.Position)
end)

local bb14 = Instance.new("TextButton")
bb14.Size = UDim2.new(0.05, 0, 0.025, 0)
bb14.Position = UDim2.new(0.19, 0, 0.97, 0)
bb14.TextScaled = true
bb14.Text = "Кастомизация"
bb14.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb14.Name = "TB14"
bb14.BackgroundColor3 = Color3.fromRGB(0, 255, 255)

bb14.MouseButton1Click:Connect(function()
	if CustomOpened then
		game.Players.LocalPlayer.PlayerGui.ScreenGui.SpecialText1.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.TB15.Visible = false
		CustomOpened = false
	else
		game.Players.LocalPlayer.PlayerGui.ScreenGui.SpecialText1.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.TB15.Visible = true
		CustomOpened = true
	end
end)

local TS1 = Instance.new("TextBox")
TS1.Size = UDim2.new(0.15, 0, 0.075, 0)
TS1.Position = UDim2.new(0.01, 0, 0.3333, 0)
TS1.TextScaled = true
TS1.BackgroundTransparency = 0
TS1.TextEditable = true
TS1.ClearTextOnFocus = false
TS1.Text = "напиши свой R(Red), G(Green), B(Blue) суда"
TS1.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
TS1.Name = "SpecialText1"
TS1.Visible = false

local bb15 = Instance.new("TextButton")
bb15.Size = UDim2.new(0.1, 0, 0.05, 0)
bb15.Position = UDim2.new(0.03, 0, 0.4125, 0)
bb15.TextScaled = true
bb15.Text = "Перекрасить все кнопки в ваш цвет"
bb15.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb15.Name = "TB15"
bb15.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
bb15.Visible = false

bb15.MouseButton1Click:Connect(function()
    -- Получаем текст из TextBox
    local inputText = game.Players.LocalPlayer.PlayerGui.ScreenGui.SpecialText1.Text

    -- Извлекаем три числа из строки (R, G, B)
    local rStr, gStr, bStr = inputText:match("(%d+),%s*(%d+),%s*(%d+)")

    if rStr and gStr and bStr then
        -- Преобразуем строки в числа
        local r, g, b = tonumber(rStr), tonumber(gStr), tonumber(bStr)

        -- Проверяем, что значения в диапазоне 0–255
        if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
            -- Устанавливаем цвет кнопки
            game.Players.LocalPlayer.PlayerGui.ScreenGui.TB1.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB4.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB6.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB8.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB9.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB10.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB13.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB2.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB3.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB15.BackgroundColor3 = Color3.fromRGB(r, g, b)
			game.Players.LocalPlayer.PlayerGui.ScreenGui.TB11.BackgroundColor3 = Color3.fromRGB(r, g, b)
        else
            warn("Значения должны быть от 0-255, не больше")
        end
    else
        warn("Ты ввёл не правильное значение, пример правильного значения: 0, 255, 0")
    end
end)

local bb16 = Instance.new("TextButton")
bb16.Size = UDim2.new(0.05, 0, 0.025, 0)
bb16.Position = UDim2.new(0.25, 0, 0.97, 0)
bb16.TextScaled = true
bb16.Text = "Иммунитеты [ALPHA]"
bb16.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
bb16.Name = "TB16"
bb16.BackgroundColor3 = Color3.fromRGB(255, 0, 255)

bb16.MouseButton1Click:Connect(function()
	if GodModesOpened then
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB1.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB2.Visible = false
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB3.Visible = false
		GodModesOpened = false
	else
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB1.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB2.Visible = true
		game.Players.LocalPlayer.PlayerGui.ScreenGui.IB3.Visible = true
		GodModesOpened = true
	end
end)

local function IB1Function()
	while true do
		wait(0.1)
		if game.Workspace:FindFirstChild("km_gameover1") then
			game.Workspace.km_gameover1:destroy()
		end
	end
end

local IB1 = Instance.new("TextButton")
IB1.Size = UDim2.new(0.05, 0, 0.025, 0)
IB1.Position = UDim2.new(0.01, 0, 0.58, 0)
IB1.TextScaled = true
IB1.Text = "Anti-GameOver"
IB1.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
IB1.Name = "IB1"
IB1.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
IB1.Visible = false

IB1.MouseButton1Click:Connect(function()
	IB1Function()
end)

local function IB2Function()
	while true do
		wait(0.1)
		if game.Workspace:FindFirstChild("km_chainzone") then
			game.Workspace.km_chainzone:destroy()
		end
	end
end

local IB2 = Instance.new("TextButton")
IB2.Size = UDim2.new(0.05, 0, 0.025, 0)
IB2.Position = UDim2.new(0.07, 0, 0.58, 0)
IB2.TextScaled = true
IB2.Text = "Anti-KmChainZone"
IB2.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
IB2.Name = "IB2"
IB2.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
IB2.Visible = false

IB2.MouseButton1Click:Connect(function()
	IB2Function()
end)

local function IB3Function()
	while true do
		wait(0.1)
		if game.Workspace:FindFirstChild("m87_bz") then
			game.Workspace.m87_bz:destroy()
		end
	end
end

local IB3 = Instance.new("TextButton")
IB3.Size = UDim2.new(0.05, 0, 0.025, 0)
IB3.Position = UDim2.new(0.13, 0, 0.58, 0)
IB3.TextScaled = true
IB3.Text = "Anti-M87_bz"
IB3.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui
IB3.Name = "IB3"
IB3.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
IB3.Visible = false

IB3.MouseButton1Click:Connect(function()
	IB3Function()
end)
