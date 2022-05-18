local DataStoreService = game:GetService("DataStoreService")
local PointsStore = DataStoreService:GetDataStore("PointsStore")

game.Players.PlayerAdded:Connect(function(Player)
	local SavedPoints = PointsStore:GetAsync(Player.UserId)

	local Leaderstats = Instance.new("Folder", Player)
	Leaderstats.Name = "leaderstats"

	local PointsValue = Instance.new("IntValue", Leaderstats)
	PointsValue.Name = "Points"

	if SavedPoints ~= nil then
		PointsValue.Value = SavedPoints
	end

	PointsValue.Changed:Connect(function(NewPoints)
		PointsStore:SetAsync(Player.UserId, NewPoints)
	end)
end)