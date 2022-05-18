game.ReplicatedStorage.ChooseTeam.OnServerEvent:Connect(function(player,teamColor)
	player.TeamColor = teamColor
end)