local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = game:GetService("Players").LocalPlayer

function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end
local RandomVar = RandomVariable(20)
_G.RandomVar48589345 = RandomVar
local doa = true

game:GetService("RunService").Stepped:Connect(function()
    if _G.RandomVar48589345 == RandomVar then
        if UserInputService:IsKeyDown(Enum.KeyCode.G) then
            if doa then
                doa = false
                local bosses = game.Workspace.Bosses:GetChildren()
                closest = nil
                local torso = game.Players.LocalPlayer.Character.Torso
                for i, v in pairs(bosses) do
                    if v:FindFirstChild("HumanoidRootPart") then
                    	if closest == nil then
                    		closest = v.HumanoidRootPart
                    	else
                    		if (torso.Position.Magnitude - closest.Position.Magnitude) < (torso.Position.Magnitude - v.HumanoidRootPart.Position.Magnitude) then
                    			closest = v.HumanoidRootPart
                    		end
                    	end
                	end
                end
                if closest ~= nil then
                    local args = {
                        [1] = closest.Position + (closest.Velocity * 0.5),
                        [2] = closest,
                        [3] = Enum.Material.Glass
                    }
                    
                    game:GetService("ReplicatedStorage").ClientServer.Basic:FireServer(unpack(args))
                end
                wait(0.3)
                doa = true
            end
        end
    end
end)
