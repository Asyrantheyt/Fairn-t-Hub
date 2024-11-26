-- still working on script
-- just wait for update

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local plr = game.Players.LocalPlayer
local char = plr.Character
local cam = game.workspace.CurrentCamera
local cucam = workspace.CurrentCamera
wrltoscr = cucam.WorldToViewportPoint



local BidWindows = OrionLib:MakeWindow({Name = "Fairn't Hub (SSE2)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_BidBattles"})

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

local MainTab = BidWindow:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local bidmeth
Tab:AddDropdown({
	Name = "Auto Bid Method",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		bidmeth = Value
	end    
})

MainTab:AddToggle({
	Name = "Auto Bid",
	Default = false,
	Callback = function(Value)
		
	end    
})
