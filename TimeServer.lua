local timerSpawnLength = 20
local timerGameLength = 59
local ones = 9
local roundLength = 10 
local starting = 15
local intermissionLength = 10
local InRound = game.ReplicatedStorage.InRound
local Status = game.ReplicatedStorage.Status
local Starter = game.Workspace.Starter
local Gui = game.ReplicatedStorage.Gui

local function roundTimer()
	while wait() do 
		for i = timerSpawnLength, 11, -1 do
			Starter.CanCollide = true
			Starter.Transparency = 0
			InRound.Value = false
			wait(1)
			Status.Value = "Relax bro.. 0:".. i
		end
		for i = intermissionLength, 0, -1 do
			wait(1)
			Status.Value = "Intermission: ".. i .." seconds left!"
		end
		for i = starting, 0, -1 do
			InRound.Value = true
			Gui.Value = true
			wait(1)
			Status.Value = "Starting in..0:0".. i
		end
		for i = 2, 1, -1 do
			Gui.Value = false
			Starter.CanCollide = false
			Starter.Transparency = 1
			Gui.Value = false
			wait(1)
			Status.Value = "GO!"
		end
		for i = timerGameLength, 10, -1 do
			wait(1)
			Status.Value =  "3:".. i
		end
		for i = ones, 0, -1 do
			wait(1)
			Status.Value =  "3:0".. i
		end
		for i = timerGameLength, 10, -1 do
			wait(1)
			Status.Value =  "2:".. i
		end
		for i = ones, 0, -1 do
			wait(1)
			Status.Value =  "2:0".. i
		end
		for i = timerGameLength, 10, -1 do
			wait(1)
			Status.Value =  "1:".. i
		end
		for i = ones, 0, -1 do
			wait(1)
			Status.Value =  "1:0".. i
		end
		for i = timerGameLength, 11, -1 do
			wait(1)
			Status.Value =  "0:".. i
		end
		for i = roundLength, 1, -1 do
			wait(1)
			Status.Value = "Game: ".. i .." seconds left!"
		end
	end
end

spawn(roundTimer)