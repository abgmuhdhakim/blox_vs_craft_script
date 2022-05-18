local teleportFolder = workspace.Teleport
local TeleportEvent = game.ReplicatedStorage.Teleport

TeleportEvent.OnServerEvent:Connect(function(player, partName)
	local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart then
		local part = teleportFolder:FindFirstChild(partName)
		if part then
			humanoidRootPart.CFrame = part.CFrame
		end
	end
end)