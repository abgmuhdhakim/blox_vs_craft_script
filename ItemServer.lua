--Variable
local RS = game:GetService('ReplicatedStorage')
local RemoteEvent = RS:WaitForChild('ToolEvent')

RemoteEvent.OnServerEvent:Connect(function(plr,val,item)
	if val == 'steppedOn' then
		local Character = plr.Character
		local NewWEAPON = item:Clone()
		NewWEAPON.Parent = plr.Backpack
		Character.Humanoid:EquipTool(NewWEAPON)
	elseif val == 'steppedOff' then
		local Character = plr.Character
		for i,v in pairs(Character:GetChildren()) do
			if v then
				if v:IsA('Tool') then
					if v.Name == item.Name then
						v:Destroy()
					end
				end
			end
		end
		for i,v in pairs(plr.Backpack:GetChildren()) do
			if v then
				if v:IsA('Tool') then
					if v.Name == item.Name then
						v:Destroy()
					end
				end
			end
		end
	end
end)