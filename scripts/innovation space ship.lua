local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local char = plr.Character 
local cam = workspace.CurrentCamera



local Window = OrionLib:MakeWindow({Name = "Fairn't Hub (Space Ship)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_coolspaceship"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CoreTab = Window:MakeTab({
	Name = "Core",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local tpTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddDropdown({
	Name = "Select Engine Number",
	Default = 1,
	Options = {1, 2, 3, 4, 5, 6, 7},
	Callback = function(Value)
		enginethaton = Value
	end    
})

MainTab:AddButton({
	Name = "On/Off engines (all)",
	Callback = function()
        for i,v in pairs(workspace.Engies:GetDescendants()) do
            if v.Name == "ClickDetector" then
                fireclickdetector(v.Parent)
                wait()
            end
        end
  	end    
})

tpTab:AddButton({
	Name = "Refresh Camera",
	Callback = function()
        cam = workspace.CurrentCamera
  	end    
})

MainTab:AddButton({
	Name = "On/Off engine",
	Callback = function()
        fireclickdetector(workspace.Engies["Engine"..tostring(enginethaton)..tostring(enginethaton)])
  	end    
})

MainTab:AddButton({
	Name = "Fix engine (click 10 time for it to work)",
	Callback = function()
        fireclickdetector(workspace["Engines"..enginethaton].RepairButton.Part.ClickDetector)
    end    
})

function litte() 
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "HyperjumpChair" then
            return v[math.random(0,#v)]
        end
    end 
end

tpTab:AddButton({
	Name = "Goto Random Hyperjump seat",
	Callback = function()
        local randhyperseat = litte()
        char.HumanoidRootPart.CFrame = randhyperseat.CFrame
  	end    
})

MainTab:AddToggle({
	Name = "Look at Panel (Engine Monitor)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-190.59288, 112.895058, -594.917786, -0.999660254, 0.0225821305, -0.0130152451, 0, 0.499350876, 0.866399825, 0.0260643288, 0.866105497, -0.499181241)
        else
            cam.CameraType = 5
        end
	end    
})

MainTab:AddToggle({
	Name = "Look at Panel (Hyperdrive Controls)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-203.271637, 112.550446, -596.098755, -0.999730229, -0.0185777657, 0.0139409248, 9.31322575e-10, 0.600209475, 0.799842954, -0.0232267659, 0.799627185, -0.600047529)
        else
            cam.CameraType = 5
        end
	end    
})

MainTab:AddToggle({
	Name = "Look at Panel (Laser Gun Controls)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-174.687714, 113.874886, -598.023376, -0.999978662, -0.00512052793, 0.00406212639, 0, 0.6214903, 0.783421814, -0.00653610565, 0.783405125, -0.621477008)
        else
            cam.CameraType = 5
        end
	end    
})

MainTab:AddToggle({
	Name = "Look at Captain's Deck",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-188.581894, 111.848724, -616.225525, -0.998950243, 0.0171098374, -0.0424950421, -1.86264515e-09, 0.927632749, 0.373494029, 0.0458102077, 0.37310195, -0.926658809)
        else
            cam.CameraType = 5
        end
	end    
})

MainTab:AddToggle({
	Name = "Look at Intergalactic Radio Device",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-189.531403, 113.126678, -602.646301, 0.999141753, 0.021201428, -0.0355859473, 0, 0.859088004, 0.511828184, 0.0414229408, -0.511388898, 0.858350575)
        else
            cam.CameraType = 5
        end
	end    
})

MainTab:AddButton({
	Name = "Open/Close Airlock",
	Callback = function()
        fireclickdetector(workspace.Hendelmidden.ClickDetector)
    end    
})

--[[MainTab:AddToggle({
	Name = "Remove Airlock Door",
	Default = false,
	Callback = function(Value)
		if Value == true then
            for i,v in pairs(workspace.AirlockDoorInside:GetDescendants()) do
                v.Transparency = 0.9
                v.CanCollide = false
            end
            for i,v in pairs(workspace.AirlockDoorOutside:GetDescendants()) do
                v.Transparency = 0.9
                v.CanCollide = false
            end
        elseif Value == false then
            for i,v in pairs(workspace.AirlockDoorInside:GetDescendants()) do
                v.Transparency = 0
                v.CanCollide = true
            end
            for i,v in pairs(workspace.AirlockDoorOutside:GetDescendants()) do
                v.Transparency = 0
                v.CanCollide = true
            end
        end
	end    
})]]

local toweron
local fanon
local coolon

local TempLabel = CoreTab:AddLabel("Core's Temp: ")

game:GetService("RunService").RenderStepped:Connect(function()
    TempLabel:Set("Core's Temp: "..workspace.Screen2.Temperature.SurfaceGui.Temp.Text)
    wait(.2)
end)

CoreTab:AddDropdown({
	Name = "Select Tower Number",
	Default = 1,
	Options = {1, 2, 3, 4, 5},
	Callback = function(Value)
		toweron = Value
	end    
})

CoreTab:AddDropdown({
	Name = "Select Fan Number",
	Default = 1,
	Options = {1, 2, 3},
	Callback = function(Value)
		fanon = Value
	end    
})

CoreTab:AddDropdown({
	Name = "Select Coolant Number",
	Default = 1,
	Options = {1, 2},
	Callback = function(Value)
		coolon = Value
	end    
})

CoreTab:AddButton({
	Name = "On/Off Towers (all)",
	Callback = function()
        for i,v in pairs(workspace.DischargeControls:GetDescendants()) do
            if v.Name == "ClickDetector" then
                fireclickdetector(v.Parent)
                wait(.5)
            end
        end
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Towers",
	Callback = function()
        fireclickdetector(workspace.DischargeControls["Button"..tostring(toweron)])
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Fan (all)",
	Callback = function()
        for i,v in pairs(workspace.Fancontrols:GetDescendants()) do
            if v.Name == "ClickDetector" then
                fireclickdetector(v.Parent)
                wait(.3)
            end
        end
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Fan",
	Callback = function()
        fireclickdetector(workspace["Fancontrols"..fanon])
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Coolant (all)",
	Callback = function()
        fireclickdetector(workspace.Coolantcont1.Button)
        wait(0.3)
        fireclickdetector(workspace.Coolantcont2.Button)
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Coolant",
	Callback = function()
        fireclickdetector(workspace["Coolantcont"..tostring(coolon)])
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Core's Doors",
	Callback = function()
        fireclickdetector(workspace.Doorcontrol.Open2)
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Cool Light",
	Callback = function()
        fireclickdetector(workspace.coolinglight.Button)
  	end    
})

CoreTab:AddButton({
	Name = "On/Off Coolant Water",
	Callback = function()
        fireclickdetector(workspace.Coolant.Button)
  	end    
})

CoreTab:AddToggle({
	Name = "Look at Panel (Screen)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-188.916855, 94.087265, -1308.99219, 0.999978006, 0.000490426901, 0.00661788136, -7.72993936e-09, 0.997265458, -0.0739025176, -0.00663602818, 0.0739008933, 0.997243524)
        else
            cam.CameraType = 5
        end
	end    
})

CoreTab:AddToggle({
	Name = "Look at Panel (Controls)",
	Default = false,
	Callback = function(Value)
        if Value == true then
            cam.CameraType = 6
            cam.CFrame = CFrame.new(-187.932938, 102.860321, -1312.60706, 0.997462749, -0.0643490702, 0.0304510556, 0, 0.42774117, 0.903901279, -0.0711903721, -0.901607871, 0.426655889)
        else
            cam.CameraType = 5
        end
	end    
})

local charposlast

tpTab:AddButton({
	Name = "Refresh LocalPlayer",
	Callback = function()
        plr = game.Players.LocalPlayer
        char = plr.Character
  	end    
})

tpTab:AddButton({
	Name = "Save char posititon",
	Callback = function()
        charposlast = char.HumanoidRootPart.CFrame
  	end    
})

tpTab:AddButton({
	Name = "Goto last saved pos",
	Callback = function()
        char.HumanoidRootPart.CFrame = charposlast
  	end    
})

tpTab:AddButton({
	Name = "Goto refuel station",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-165.91008, 165.898438, -1289.30786, 0.563662291, -0.0386073552, 0.825102568, -1.12203313e-08, 0.998907089, 0.0467398427, -0.82600534, -0.026345497, 0.563046277)
  	end    
})

tpTab:AddButton({
	Name = "Get jerrycan",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-200.069778, 106.896194, -1263.41101, 0.175045118, -5.11980822e-08, 0.98456043, -2.50700296e-08, 1, 5.6458159e-08, -0.98456043, -3.45656836e-08, 0.175045118)
        fireproximityprompt(workspace.Jerrygiver.ProximityPrompt)
      end
})

tpTab:AddButton({
	Name = "Goto Core Control",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-188.916702, 84.5063171, -1308.96362, 0.99865669, 8.13845047e-10, -0.0518150516, 2.05442574e-09, 1, 5.5302678e-08, 0.0518150516, -5.53348407e-08, 0.99865669)
  	end    
})

tpTab:AddButton({
	Name = "Goto Captain Wheel",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-188.765869, 106.896301, -605.981079, -0.963898003, -5.75509524e-08, 0.2662718, -4.95851431e-08, 1, 3.66390083e-08, -0.2662718, 2.21131398e-08, -0.963898003)
  	end    
})

tpTab:AddButton({
	Name = "Goto Deck",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-190.638977, 106.896294, -594.135193, -0.964038372, -5.12388603e-08, -0.265763104, -3.93583584e-08, 1, -5.0029108e-08, 0.265763104, -3.77699827e-08, -0.964038372)
  	end    
})

tpTab:AddButton({
	Name = "Goto AirLock (Outside)",
	Callback = function()
        char.HumanoidRootPart.CFrame = CFrame.new(-196.482605, 145.926315, -1272.4823, 0.0818316191, -4.3720112e-09, -0.996646166, -2.79244627e-09, 1, -4.61600314e-09, 0.996646166, 3.16081583e-09, 0.0818316191)
  	end    
})

OrionLib:Init()