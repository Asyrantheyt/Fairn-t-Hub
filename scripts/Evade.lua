local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local esp = false
local botesp = false
local instoption
local instrevive
local instkey

local EvadeWindow = OrionLib:MakeWindow({Name = "Fairn't Hub (Evade)", HidePremium = true, SaveConfig = true, ConfigFolder = "Fairnt_Evade"})

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

function plresp()
    if esp then
        for i,v in pairs(workspace.Game.Players:GetChildren()) do
            if v:GetAttribute("Team") == "PlayerTeam" and v.Name ~= game.Players.LocalPlayer.Name then
                local esphigh = Instance.new("BoxHandleAdornment")
                esphigh.ZIndex = 1
                esphigh.Visible = true
                esphigh.AlwaysOnTop = true
                esphigh.Transparency = 0.7
                esphigh.Name = "Fairnt_Esp_Player"
                local esptext = Drawing.new('Text')
                esptext.Text = "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v).DisplayName)
                esptext.Center = true
                esptext.Outline = false
                esptext.Size = 10
                esptext.Font = Drawing.Fonts.Monospace -- Monospace, UI, System, Plex
                esptext.Transparency = 0.9
                function always()
                    spawn(function()
                    while task.wait() do
                        if esp then
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                -- workspace.Game.Players.ChildRemoved:Connect(function(v2)
                                --     wait(0.08)
                                --     if esp then
                                --         if esptext.Text == "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v2).DisplayName) then
                                --             esptext:Destroy()
                                --         end
                                --     end
                                -- end)
                                local vector,ison = workspace.CurrentCamera:WorldToViewportPoint(v.HumanoidRootPart.Position)
                                esphigh.Adornee = v.HumanoidRootPart
                                esphigh.Size = v.HumanoidRootPart.Size
                                pcall(function() esphigh.Parent = v.HumanoidRootPart end)
                                esptext.Position = vector
                                if ison then
                                    esptext.Visible = true
                                else
                                    esptext.Visible = false
                                end
                                if v:GetAttribute("Downed") == true then
                                    esphigh.Color3 = Color3.fromRGB(255,255,0)
                                    esptext.Color = Color3.fromRGB(255,255,0)
                                else
                                    esphigh.Color3 = Color3.fromRGB(0,0,255)
                                    esptext.Color = Color3.fromRGB(0,0,255)
                                end
                            else 
                                esptext.Visible = false
                            end
                        end
                    end
                    end)
                end
                coroutine.wrap(always)()
            end
        end
        workspace.Game.Players.ChildAdded:Connect(function(v)
            if esp and v:GetAttribute("Team") == "PlayerTeam" and v.Name ~= game.Players.LocalPlayer.Name then
                local esphigh = Instance.new("BoxHandleAdornment")
                esphigh.ZIndex = 1
                esphigh.Visible = true
                esphigh.AlwaysOnTop = true
                esphigh.Transparency = 0.7
                esphigh.Name = "Fairnt_Esp_Player"
                local esptext = Drawing.new('Text')
                esptext.Text = "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v).DisplayName)
                esptext.Center = true
                esptext.Outline = false
                esptext.Size = 10
                esptext.Font = Drawing.Fonts.Monospace -- Monospace, UI, System, Plex
                esptext.Transparency = 0.9
                function always()
                    spawn(function()
                    while task.wait() do
                        if esp then
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                -- workspace.Game.Players.ChildRemoved:Connect(function(v2)
                                --     wait(0.08)
                                --     if esp then
                                --         if esptext.Text == "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v2).DisplayName) then
                                --             esptext:Destroy()
                                --         end
                                --     end
                                -- end)
                                local vector,ison = workspace.CurrentCamera:WorldToViewportPoint(v.HumanoidRootPart.Position)
                                esphigh.Adornee = v.HumanoidRootPart
                                esphigh.Size = v.HumanoidRootPart.Size
                                pcall(function() esphigh.Parent = v.HumanoidRootPart end)
                                esptext.Position = vector
                                if ison then
                                    esptext.Visible = true
                                else
                                    esptext.Visible = false
                                end
                                if v:GetAttribute("Downed") == true then
                                    esphigh.Color3 = Color3.fromRGB(255,255,0)
                                    esptext.Color = Color3.fromRGB(255,255,0)
                                else
                                    esphigh.Color3 = Color3.fromRGB(0,0,255)
                                    esptext.Color = Color3.fromRGB(0,0,255)
                                end
                            else
                                esptext.Visible = false
                            end
                        end
                    end
                    end)
                end
                coroutine.wrap(always)()
            end
        end)
    elseif not esp then
        cleardrawcache()
        for i,v in pairs(workspace.Game.Players:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if v.HumanoidRootPart:FindFirstChild("Fairnt_Esp_Player") then
                    pcall(function() v.HumanoidRootPart.Fairnt_Esp_Player:Destroy() end)
                end
            end
        end
    end
end

function botsesp()
    if esp then
        for i,v in pairs(workspace.Game.Players:GetChildren()) do
            if v:GetAttribute("Team") ~= "PlayerTeam" and v.Name ~= game.Players.LocalPlayer.Name then
                local esphigh = Instance.new("BoxHandleAdornment")
                esphigh.ZIndex = 1
                esphigh.Visible = true
                esphigh.AlwaysOnTop = true
                esphigh.Transparency = 0.7
                esphigh.Name = "Fairnt_Esp_Bot"
                local esptext = Drawing.new('Text')
                esptext.Text = "Name: "..v.Name
                esptext.Center = true
                esptext.Outline = false
                esptext.Size = 10
                esptext.Font = Drawing.Fonts.Monospace -- Monospace, UI, System, Plex
                esptext.Transparency = 0.9
                function always()
                    spawn(function()
                    while task.wait() do
                    --game:GetService("RunService").RenderStepped:Connect(function(s)
                        if botesp then
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                -- workspace.Game.Players.ChildRemoved:Connect(function(v2)
                                --     wait(0.08)
                                --     if esp then
                                --         if esptext.Text == "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v2).DisplayName) then
                                --             esptext:Destroy()
                                --         end
                                --     end
                                -- end)
                                local vector,ison = workspace.CurrentCamera:WorldToViewportPoint(v.HumanoidRootPart.Position)
                                esphigh.Adornee = v.HumanoidRootPart
                                esphigh.Size = v.HumanoidRootPart.Size
                                pcall(function() esphigh.Parent = v.HumanoidRootPart end)
                                esptext.Position = vector
                                if ison then
                                    esptext.Visible = true
                                else
                                    esptext.Visible = false
                                end
                                esphigh.Color3 = Color3.fromRGB(255,0,0)
                                esptext.Color = Color3.fromRGB(255,0,0)
                            else 
                                esptext.Visible = false
                            end
                        end
                    end
                    end)
                end
                coroutine.wrap(always)()
            end
        end
        workspace.Game.Players.ChildAdded:Connect(function(v)
            if botesp and v:GetAttribute("Team") ~= "PlayerTeam" and v.Name ~= game.Players.LocalPlayer.Name then
                local esphigh = Instance.new("BoxHandleAdornment")
                esphigh.ZIndex = 1
                esphigh.Visible = true
                esphigh.AlwaysOnTop = true
                esphigh.Transparency = 0.7
                esphigh.Name = "Fairnt_Esp_Bot"
                local esptext = Drawing.new('Text')
                esptext.Text = "Name: "..v.Name
                esptext.Center = true
                esptext.Outline = false
                esptext.Size = 10
                esptext.Font = Drawing.Fonts.Monospace -- Monospace, UI, System, Plex
                esptext.Transparency = 0.9
                function always()
                    spawn(function()
                    while task.wait() do
                        if botesp then
                            if v:FindFirstChild("HumanoidRootPart") ~= nil then
                                -- workspace.Game.Players.ChildRemoved:Connect(function(v2)
                                --     wait(0.08)
                                --     if esp then
                                --         if esptext.Text == "(Display) Name: "..(game.Players:GetPlayerFromCharacter(v2).DisplayName) then
                                --             esptext:Destroy()
                                --         end
                                --     end
                                -- end)
                                local vector,ison = workspace.CurrentCamera:WorldToViewportPoint(v.HumanoidRootPart.Position)
                                esphigh.Adornee = v.HumanoidRootPart
                                esphigh.Size = v.HumanoidRootPart.Size
                                pcall(function() esphigh.Parent = v.HumanoidRootPart end)
                                esptext.Position = vector
                                if ison then
                                    esptext.Visible = true
                                else
                                    esptext.Visible = false
                                end
                                esphigh.Color3 = Color3.fromRGB(255,0,0)
                                esptext.Color = Color3.fromRGB(255,0,0)
                            else
                                esptext.Visible = false
                            end
                        end
                    end
                    end)
                end
                coroutine.wrap(always)()
            end
        end)
    elseif not botesp then
        cleardrawcache()
        for i,v in pairs(workspace.Game.Players:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                if v.HumanoidRootPart:FindFirstChild("Fairnt_Esp_Bot") then
                    pcall(function() v.HumanoidRootPart.Fairnt_Esp_Bot:Destroy() end)
                end
            end
        end
    end
end

local MainTab = EvadeWindow:MakeTab({
	Name = "MainTab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "Player and Bot Esp",
	Default = false,
	Callback = function(Value)
        esp = Value
        botesp = Value
        plresp()
        botsesp()
	end    
})

MainTab:AddDropdown({
	Name = "Instant Revive Option",
	Default = "1: Hover on Player",
	Options = {"1: Hover on Player", "2: Press Selected Key (Hold)"},
	Save = true,
    Flag = "Inst revive op",
    Callback = function(Value)
		instoption = Value
	end    
})

MainTab:AddToggle({
	Name = "Instant Revive",
	Default = false,
	Callback = function(Value)
        instrevive = Value
	end    
})

MainTab:AddBind({
	Name = "Keybind For Revive",
	Default = Enum.KeyCode.E,
	Hold = true,
	Callback = function(v)
        instkey = v
	end    
})

function getcloset()
    local clodis = math.huge
    local cloplr = nil
    for i,v in pairs(game:GetService("Players"):GetPlayers())do
        pcall(function()
            if v.Character:GetAttribute("Downed") == true then
                local dis = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if dis < clodis then
                    clodis = dis
                    cloplr = v
                end
            end
        end)
    end
    return cloplr
end

spawn(function()
    while task.wait(.08) do
        local yay,sus = pcall(function()
            if instrevive and instoption == "1: Hover on Player" then
                print("Hold")
                local close = getcloset()
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - close.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 20 then
                    local args = {
                    [1] = "Revive",
                    [2] = true,
                    [3] = close.Name
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Character"):WaitForChild("Interact"):FireServer(unpack(args))
                end
            elseif instrevive and instoption == "2: Press Selected Key (Hold)" and instkey then
                print("Key")
                local close = getcloset()
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - close.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 20 then
                    local args = {
                    [1] = "Revive",
                    [2] = true,
                    [3] = close.Name
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Character"):WaitForChild("Interact"):FireServer(unpack(args))
                end
            end
        end)
        if sus then warn(sus) end
    end
end)

OrionLib:Init()
