local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local char = plr.Character
local aimbot = false
_G.aim = false


local SeWindows = OrionLib:MakeWindow({Name = "Fairn't Hub (Black Hole Core)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_BlackhCore"})

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

local MainTab = SeWindows:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local tpTab = SeWindows:MakeTab({
	Name = "TeleportTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

function getClosest()
    local closestDistance
    local closestalien
    for i,v in pairs(game.Workspace.Aliens:GetChildren()) do
        --if v ~= game.Players.LocalPlayer and v.Team ~=  game.Players.LocalPlayer.Team then
            pcall(function()
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestalien = v
            end
            end)
        --end
    end
    return closestalien
end

MainTab:AddToggle({
	Name = "Red and Blue Rock Esp",
	Default = false,
	Callback = function(Value)
        if Value == true then
            for i,v2 in pairs(workspace.Outside.Cave.Ores:GetDescendants()) do
                if v2.Name:lower() == "redrock" or v2.Name:lower() == "bluerock" then
                    local v = v2.Union
                    local esphight = Instance.new("BoxHandleAdornment")
                    esphight.Name = v.Name.."_Fairnt_Esp"
                    if v2.Name:lower() == "bluerock" then
                        esphight.Color3 = Color3.fromRGB(0,0,255)
                    else
                        esphight.Color3 = Color3.fromRGB(255,0,0)
                    end
                    pcall(function()
                        esphight.Size = v.Size
                        esphight.AlwaysOnTop = true
                        esphight.ZIndex = 0
                        esphight.Visible = true
                        esphight.Transparency = 0.5
                        esphight.Adornee = v
                        esphight.Parent = v
                    end)
                end
            end
            workspace.DescendantAdded:Connect(function(v2)
                if Value == true then
                if v2.Name:lower() == "union" then
                        if v2.Parent.Name:lower() == "redrock" or v2.Parent.Name:lower() == "bluerock" then
                            local v = v2
                            local esphight = Instance.new("BoxHandleAdornment")
                            esphight.Name = v.Name.."_Fairnt_Esp"
                            if v.Name:lower() == "bluerock" then
                                esphight.Color3 = Color3.fromRGB(0,0,255)
                            else
                                esphight.Color3 = Color3.fromRGB(255,0,0)
                            end
                            esphight.Size = v.Size
                            esphight.AlwaysOnTop = true
                            esphight.ZIndex = 0
                            esphight.Visible = true
                            esphight.Transparency = 0.5
                            esphight.Adornee = v
                            esphight.Parent = v
                        end
                    end
                end
            end)
            elseif Value == false then
                for i,v2 in pairs(workspace.Outside.Cave.Ores:GetDescendants()) do
                    if v2.Name:lower() == "union_fairnt_esp" then
                        v2:Destroy()
                    end
                end
            end
        end
})

MainTab:AddButton({
	Name = "Get Compass",
	Callback = function()
		game:GetService("ReplicatedStorage").Items.Compass:Clone().Parent = game.Players.LocalPlayer.Backpack
  	end    
})

MainTab:AddToggle({
	Name = "Aimbot to alien",
	Default = false,
	Callback = function(Value)
        aimbot = Value
    end
})

MainTab:AddBind({
	Name = "Keybind for aim",
	Default = Enum.KeyCode.F,
	Hold = true,
	Callback = function(v)
		_G.aim = v
	end    
})

local onslot
local lastpos1 
local lastpos2 
local lastpos3 
local lastpos4 
local lastpos5 
local lastpos6 
local lastpos7 
local lastpos8
local seted

local currentpos = tpTab:AddLabel("CSPS: ")

tpTab:AddDropdown({
	Name = "Slot",
	Default = 1,
	Options = {1, 2, 3, 4, 5, 6, 7, 8},
	Callback = function(Value)
		onslot = Value
        if onslot == 1 then
            seted = lastpos1
        elseif onslot == 2 then
            seted = lastpos2
        elseif onslot == 3 then
            seted = lastpos3
        elseif onslot == 4 then
            seted = lastpos4
        elseif onslot == 5 then
            seted = lastpos5
        elseif onslot == 6 then
            seted = lastpos6
        elseif onslot == 7 then
            seted = lastpos7
        elseif onslot == 8 then
            seted = lastpos8
        end
        pcall(function()
        currentpos:Set("CSPS: "..tostring(seted))
        end)
	end    
})

tpTab:AddButton({
	Name = "save char pos",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if onslot == 1 then
            lastpos1 = char.HumanoidRootPart.CFrame
        elseif onslot == 2 then
            lastpos2 = char.HumanoidRootPart.CFrame
        elseif onslot == 3 then
            lastpos3 = char.HumanoidRootPart.CFrame
        elseif onslot == 4 then
            lastpos4 = char.HumanoidRootPart.CFrame
        elseif onslot == 5 then
            lastpos5 = char.HumanoidRootPart.CFrame
        elseif onslot == 6 then
            lastpos6 = char.HumanoidRootPart.CFrame
        elseif onslot == 7 then
            lastpos7 = char.HumanoidRootPart.CFrame
        elseif onslot == 8 then
            lastpos8 = char.HumanoidRootPart.CFrame
        end
        pcall(function()
        currentpos:Set("CSPS: "..tostring(char.HumanoidRootPart.CFrame))
        seted = char.HumanoidRootPart.CFrame
        end)
    end    
})

tpTab:AddButton({
	Name = "Copy Selected Saved Position",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        setclipboard(tostring(seted))
    end    
})

tpTab:AddButton({
	Name = "Goto last saved pos",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if onslot == 1 then
            char.HumanoidRootPart.CFrame = lastpos1
        elseif onslot == 2 then
            char.HumanoidRootPart.CFrame = lastpos2
        elseif onslot == 3 then
            char.HumanoidRootPart.CFrame = lastpos3
        elseif onslot == 4 then
            char.HumanoidRootPart.CFrame = lastpos4
        elseif onslot == 5 then
            char.HumanoidRootPart.CFrame = lastpos5
        elseif onslot == 6 then
            char.HumanoidRootPart.CFrame = lastpos6
        elseif onslot == 7 then
            char.HumanoidRootPart.CFrame = lastpos7
        elseif onslot == 8 then
            char.HumanoidRootPart.CFrame = lastpos8
        end
    end    
})

local postogo

tpTab:AddDropdown({
	Name = "Room to go",
	Default = "Control Room",
	Options = {"Control Room", "Maintenances Room", "Server Room", "Pool Coolant Room", "Generator", "Generator Cockpit", "Core Enter", "Cave/Mines"},
	Callback = function(Value)
		postogo = Value
	end    
})

tpTab:AddButton({
	Name = "Goto Selected Room",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local postogo2
        if postogo == "Control Room" then
            postogo2 = CFrame.new(3.38286543, 178.051163, 214.861725, 0.918819249, 7.75229196e-08, -0.394678533, -8.47746549e-08, 1, -9.36617228e-10, 0.394678533, 3.43193172e-08, 0.918819249)
        elseif postogo == "Maintenances Room" then
            postogo2 = CFrame.new(25.8121223, 177.999146, 409.610168, -0.176479936, 7.3544058e-08, -0.984304249, -8.10844369e-08, 1, 8.92547547e-08, 0.984304249, 9.55634292e-08, -0.176479936)
        elseif postogo == "Server Room" then
            postogo2 = CFrame.new(-53.4618454, 178.015442, 297.137573, -0.998038173, 1.66632272e-08, 0.0626085773, 1.29519266e-08, 1, -5.96836784e-08, -0.0626085773, -5.87556883e-08, -0.998038173)
        elseif postogo == "Pool Coolant Room" then
            postogo2 = CFrame.new(-110.797089, 177.890457, 430.303833, -0.999982953, 2.38025297e-08, 0.00584218372, 2.32099815e-08, 1, -1.01493555e-07, -0.00584218372, -1.01356221e-07, -0.999982953)
        elseif postogo == "Generator" then
            postogo2 = CFrame.new(-160.855164, 145.890472, 349.67688, 0.0580636747, -2.25125927e-08, 0.998312891, 9.51980255e-08, 1, 1.70137504e-08, -0.998312891, 9.40495397e-08, 0.0580636747)
        elseif postogo == "Cave/Mines" then
            postogo2 = CFrame.new(232.085785, 185.243347, 187.62439, 0.998916805, -3.74319353e-10, 0.0465312749, 4.5966303e-10, 1, -1.82341453e-09, -0.0465312749, 1.84282822e-09, 0.998916805)
        elseif postogo == "Core Enter" then
            postogo2 = CFrame.new(-134.847214, 82.0154572, 98.5171509, 0.440725744, 5.16503889e-08, -0.897641778, 4.68380676e-08, 1, 8.05367222e-08, 0.897641778, -7.75384166e-08, 0.440725744)
        elseif postogo == "Generator Cockpit" then
            postogo2 = CFrame.new(-161.223801, 177.915466, 314.067535, 0.300712138, -4.70997108e-08, 0.953714967, -5.29599617e-08, 1, 6.60841195e-08, -0.953714967, -7.03810059e-08, 0.300712138)
        end
        char.HumanoidRootPart.CFrame = postogo2
    end    
})

spawn(function()
    while task.wait() do
        if aimbot and _G.aim then
            local cam = workspace.CurrentCamera
            cam.CFrame = CFrame.new(cam.CFrame.Position, getClosest().Head.Position)
        end
    end
end)

OrionLib:Init()
