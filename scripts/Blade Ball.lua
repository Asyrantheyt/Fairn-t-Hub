local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/darkkcontrol/Roblox-Orion-UI-Libary-OP-UI-LIBARY-/refs/heads/main/source')))()
local uis = game:GetService("UserInputService")

local bBWindows = OrionLib:MakeWindow({Name = "Fairn't Hub (Blade Ball)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_BladeBall"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the SeWindows.
CloseCallback = <function> - Function to execute when the SeWindows is closed.
]]

local AutoaParry = false
local KeyCodeBlock = "F"
local apoffset = 0
local aimbot

local MainTab = bBWindows:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CreditsTab = bBWindows:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local aparry2
local aparry1 = MainTab:AddToggle({
	Name = "Auto Parry",
	Default = false,
    	Save = true,
    	Flag = "Auto Parry",
	Callback = function(Value)
    --pcall(function()
        --aparry2:Set(false)
        AutoaParry = Value
    --end)
	end    
})

--[[aparry2 = MainTab:AddToggle({
	Name = "Auto Parry (2 Ball Method and it doesn't work)",
	Default = false,
	Callback = function(Value)
        aparry1:Set(false)
	end    
})]]

MainTab:AddSlider({
	Name = "AutoParry Offset (Distance before parrying)",
	Min = 0,
	Max = 20,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = .1,
	ValueName = "Studs Offset",
	Callback = function(Value)
		apoffset = Value
	end    
})

local brsl = MainTab:AddLabel("RealBallSpeed: ")
local bsl = MainTab:AddLabel("BallSpeed: ")
local bdl = MainTab:AddLabel("BallDistance: ")

MainTab:AddTextbox({
	Name = "Keybind to press for parry",
	Default = "F",
	TextDisappear = false,
    	Save = true,
    	Flag = "KeyBind",
	Callback = function(Value)
		KeyCodeBlock = Value
	end	  
})

MainTab:AddToggle({
	Name = "Aimbot to ball",
	Default = false,
	Callback = function(Value)
        aimbot = Value
	end    
})

--Credits to Lunax hub for AutoParry script
-- i made the aimbot script not lunax hub

function getClosest()
    local clodis = math.huge
    local cloball = nil
    for i,v in pairs(game:GetService("Workspace").Balls:GetChildren())do
        if v:IsA("Part") then
            pcall(function()
                local bdis = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude
                if bdis < clodis then
                    clodis = bdis
                    cloball = v
                end
            end)
        end
    end
    return cloball
end

spawn(function()
    while task.wait() do
        if aimbot then
            local y,sus = pcall(function()
                local camera = game:GetService("Workspace").CurrentCamera
                local campos = camera.CFrame.Position
                camera.CFrame = CFrame.new(campos,getClosest().Position)
            end)
        end
    end
end)

local function getSpeed(part)
    if part:IsA("BasePart") then
        local speed = part.Velocity.Magnitude
        if speed > 1 then
            return part, speed
        end
        return nil, nil
    else
        print("The provided instance is not a BasePart.")
        return nil, nil
    end
end

--game:GetService("RunService").RenderStepped:Connect(function()
spawn(function()
    while task.wait() do
        if AutoaParry then
            pcall(function()
	            for i, v in pairs(game:GetService("Workspace").Balls:GetChildren()) do
                    if v:IsA("Part") then
                        if not game.Players.LocalPlayer.Character:FindFirstChild("Highlight") then return end
                        local part, speed = getSpeed(v)
                        if part and speed then
                            local minDistance = 2.5 * (speed * 0.1) + 2
                            if minDistance == 0 or minDistance <= 20 then
                                BallSpeed = 23 + apoffset
                                print("bspd: "..BallSpeed)
                            elseif minDistance == 20 or minDistance <= 88 then
                                BallSpeed = 2.5 * (speed * 0.1) + 5 + apoffset
                                print("bspd: "..BallSpeed)
                            elseif minDistance == 88 or minDistance <= 110 then
                                BallSpeed = 90 + ap
                                print("bspd: "..BallSpeed)
                            -- elseif minDistance >= 110 then
                            --     BallSpeed = 2 * (speed * 0.1)
                            end
                            print("bdisc :"..(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude)
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude <= (BallSpeed) then -- (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude <= minDistance and 
                                CanSlash = true
                            else
                                CanSlash = false
                            end
						end
                    end
                end
                --KeyCodeBlock = "F"
                if CanSlash then
                    if math.random(1, 5) == 5 then
                        print("Parried via mouseclick")
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    else
                        print("Parried via Keybind")
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode[KeyCodeBlock], false, game)
                    end
                    CanSlash = false
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        --if AutoaParry then
            pcall(function()
	            for i, v in pairs(game:GetService("Workspace").Balls:GetChildren()) do
                    if v:IsA("Part") then
		                --print("Ball no "..i,,":")
                        local part, speed = getSpeed(v)
                        if part and speed then
                            local minDistance = 2.5 * (speed * 0.1) + 2
                            if minDistance == 0 or minDistance <= 20 then
                                BallSpeed = 23 + apoffset
                                brsl:Set("RealBallSpeed: "..tostring(2.5 * (speed * 0.1) + 5))
                                bsl:Set("BallSpeed: "..BallSpeed)
                            elseif minDistance == 20 or minDistance <= 88 then
                                BallSpeed = 2.5 * (speed * 0.1) + 5 + apoffset
                                brsl:Set("RealBallSpeed: "..tostring(BallSpeed - apoffset))
                                bsl:Set("BallSpeed: "..BallSpeed)
                            elseif minDistance == 88 or minDistance <= 110 then
                                BallSpeed = 90 + ap
                                brsl:Set("RealBallSpeed: Cannot be Calulated (90+)")
                                bsl:Set("BallSpeed: "..BallSpeed)
                            -- elseif minDistance >= 110 then
                            --     BallSpeed = 2 * (speed * 0.1)
                            end
		                    bdl:Set("BallDistance: "..(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).Magnitude)
						end
                    end
                end
            end)
        --end
    end
end)

CreditsTab:AddLabel("AutoParry script by LunaxHub")

OrionLib:Init()
