local RemoveEvent = game.ReplicatedStorage.ChooseTeam
local LobbyColor = "Institutional white"
local CraftColor = "Earth green"
local BloxColor = "Medium stone grey"
local LobbySpawn = game.Workspace.LobbySpawn
local CraftSpawn = game.Workspace.Teleport.CraftSpawn
local BloxSpawn = game.Workspace.Teleport.BloxSpawn
local InRound = game.ReplicatedStorage.InRound
local Gui = game.ReplicatedStorage.Gui
local frame = script.Parent:WaitForChild("Frame")
local TeleportEvent = game.ReplicatedStorage.Teleport
local RS = game:GetService('ReplicatedStorage')
local RemoteEvent = RS:WaitForChild('ToolEvent')
local WEAPON = game.ReplicatedStorage['LinkedSword']
local GotSword = false
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

frame.Craft.MouseButton1Click:Connect(function()
	RemoveEvent:FireServer(BrickColor.new(CraftColor))
	frame.Visible = false
	TeleportEvent:FireServer("CraftSpawn")
	if GotSword == false then
		local item = RS:WaitForChild(WEAPON.Name)
		if item then
			RemoteEvent:FireServer('steppedOn',item)
		end
		GotSword = true
	end
end)

frame.Blox.MouseButton1Click:Connect(function()
	RemoveEvent:FireServer(BrickColor.new(BloxColor))
	frame.Visible = false
	TeleportEvent:FireServer("BloxSpawn")
	if GotSword == false then
		local item = RS:WaitForChild(WEAPON.Name)
		if item then
			RemoteEvent:FireServer('steppedOn',item)
		end
		GotSword = true
	end
end)

InRound.Changed:Connect(function()
	if InRound.Value == false then
		for _, player in pairs(game.Teams["Craft"]:GetPlayers()) do
			RemoveEvent:FireServer(BrickColor.new(LobbyColor))
			local char = player.Character
			char.HumanoidRootPart.CFrame = LobbySpawn.CFrame
			local item = Character:FindFirstChild(WEAPON.Name)
			local item2 = Player.Backpack:FindFirstChild(WEAPON.Name)
			if item or item2 then
				RemoteEvent:FireServer('steppedOff',item or item2)
			end
			GotSword = false
		end
		for _, player in pairs(game.Teams["Blox"]:GetPlayers()) do
			RemoveEvent:FireServer(BrickColor.new(LobbyColor))
			local char = player.Character
			char.HumanoidRootPart.CFrame = LobbySpawn.CFrame
			local item = Character:FindFirstChild(WEAPON.Name)
			local item2 = Player.Backpack:FindFirstChild(WEAPON.Name)
			if item or item2 then
				RemoteEvent:FireServer('steppedOff',item or item2)
			end
			GotSword = false
		end
	end
end)

Gui.Changed:Connect(function()
	if Gui.Value == true then
		frame.Visible = true
	else
		frame.Visible = false
	end
end)
