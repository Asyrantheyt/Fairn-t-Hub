local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local char = plr.Character
local cam = game.workspace.CurrentCamera
local cucam = workspace.CurrentCamera
wrltoscr = cucam.WorldToViewportPoint



local Window = OrionLib:MakeWindow({Name = "Fairn't Hub (SSE2)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_SSE2"})

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

local Moonstones = workspace.MoonstoneScript

local maiTab = Window:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local tpTab = Window:MakeTab({
	Name = "TeleportTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local distance = maiTab:AddLabel("")

maiTab:AddButton({
	Name = "Get Moonstone (tp to moon first)",
	Callback = function(Value)
            local char = game.Players.LocalPlayer.Character
            char.HumanoidRootPart.CFrame = Moonstones:GetChildren()[1].CFrame
            fireclickdetector(Moonstones:GetChildren()[1])
            OrionLib:MakeNotification({
                Name = "Moonstone Grabbed",
                Content = "why do u need do read this?",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
    end    
})

maiTab:AddButton({
	Name = "Get ShockStone (Miranda Version and tp to Mirandaa first)",
	Callback = function(Value)
            local char = game.Players.LocalPlayer.Character
            char.HumanoidRootPart.CFrame = workspace.Miranda.MirandaStoneScript:GetChildren()[1].CFrame
            fireclickdetector(workspace.Miranda.MirandaStoneScript:GetChildren()[1])
            OrionLib:MakeNotification({
                Name = "Shockstone Grabbed",
                Content = "why do u need do read this?",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
    end    
})

maiTab:AddButton({
	Name = "Get ShockStone (Workspace Version)",
	Callback = function(Value)
            local char = game.Players.LocalPlayer.Character
            for i,v in workspace:GetChildren() do
                if v.Name == "Shockstone" then
                    char.HumanoidRootPart.CFrame = v.CFrame
                    fireclickdetector(v) 
                    OrionLib:MakeNotification({
                        Name = "Shockstone Grabbed",
                        Content = "why do u need do read this?",
                        Image = "rbxassetid://4483345998",
                        Time = 5
                    })
                    break
                end
            end
 
    end    
})

--[[maiTab:AddToggle({
	Name = "Moonstone Esp",
	Default = false,
	Callback = function(Value)
        local esphight = Instance.new("BoxHandleAdornment")
        esphight.Color3 = Color3.fromRGB(0,255,0)
        esphight.Size = Vector3.new(4,4,4)
        esphight.CFrame = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        esphight.Visible = true
        esphight.Parent = 
	end    
})]]

local onslot
local lastpos1 
local lastpos2 
local lastpos3 
local lastpos4 
local lastpos5 
local lastpos6 
local lastpos7 
local lastpos8

tpTab:AddDropdown({
	Name = "Slot",
	Default = 1,
	Options = {1, 2, 3, 4, 5, 6, 7, 8},
	Callback = function(Value)
		onslot = Value
	end    
})

tpTab:AddButton({
	Name = "save pos char pos",
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

tpTab:AddButton({
	Name = "Goto Moon",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(7237.69873, -10.4476233, -579.328247, -0.935050189, 0.119485594, 0.333772928, -0.338141739, -0.0177712888, -0.940927386, -0.106495693, -0.992676854, 0.0570201166)
    end    
})

tpTab:AddButton({
	Name = "Goto Earth",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(124.651794, 1215.68481, -1654.4032, -0.00435729232, 0.0606043264, 0.998152375, -0.805669308, 0.591053545, -0.039403744, -0.592349529, -0.804352403, 0.0462516546)
    end    
})

tpTab:AddButton({
	Name = "Goto Mars",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(13701.8232, 984.389343, 6842.90625, -0.979423821, -0.0119954683, 0.201457486, -0.200964943, -0.0335160531, -0.979024887, 0.0184959229, -0.999366164, 0.0304157529)
    end    
})

tpTab:AddButton({
	Name = "Goto Venus",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(-13842.543, -3847.33472, -16415.1836, 0.603632569, 0.754775286, -0.256791651, 0.253484666, 0.123684771, 0.959399581, 0.755892336, -0.64421761, -0.116663806)
    end    
})

tpTab:AddButton({
	Name = "Goto Mindara",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(-24971.3418, 88.4085083, 26143.1992, 0.293683767, 0.779479444, 0.553318799, -0.0506638214, 0.590723455, -0.805281937, -0.954559088, 0.20846498, 0.21297729)
    end                                           
})

tpTab:AddButton({
	Name = "Goto Ariel",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(-23227.7383, -1802.86047, 25623.0684, 0.959641039, 0.253275901, -0.122231103, 1.07185906e-06, 0.434630364, 0.900608957, 0.281227887, -0.864261389, 0.417088866)
    end                                           
})

tpTab:AddButton({
	Name = "Goto Umbriel",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(-24206.9727, -4729.76221, 24367.1992, -0.830648661, 0.414398611, 0.371882498, -0.13917844, 0.492163658, -0.859304547, -0.539121628, -0.765538216, -0.351139724)
    end                                           
})

tpTab:AddButton({
	Name = "Goto Callisto (outside)",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(-36568.4258, 2484.57031, 41453.543, 0.560249567, -0.395209789, 0.727962673, -0.458721668, 0.583734393, 0.669946671, -0.689706326, -0.709269583, 0.14574565)
    end                                           
})

tpTab:AddButton({
	Name = "Goto Callisto (inside)",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(36880.4141, 2373.95654, 41829.293, -0.311382264, -0.836334348, 0.451204956, -0.949322939, 0.295123219, -0.108111933, -0.0427433364, -0.46200338, -0.885847569)
    end                                           
})

tpTab:AddButton({
	Name = "Goto Labyrint",
	Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        char.HumanoidRootPart.CFrame = CFrame.new(8181.53955, 24650.2402, -8167.10156, -0.712964296, 0.141760781, 0.686721027, 0.631570518, -0.295646459, 0.716736913, 0.304631829, 0.944720626, 0.121253446)
    end                                           
})

game:GetService("RunService").RenderStepped:Connect(function()
    local yay,sus = pcall(function()
    distance:Set(workspace.Tracker.Model.Background.SurfaceGui.Distance.Text)
    end)
    if yay then return elseif sus then distance:Set("Nibiru has crashed into earth") end
end)

OrionLib:Init()
