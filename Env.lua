print("Hello world!")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		while humanoidRootPart do
			local brickPosition = workspace.Goal1.Position
			local playerPosition = humanoidRootPart.Position
			local Xdistance = brickPosition.X - playerPosition.X
			local Ydistance = brickPosition.Y - playerPosition.Y
			local distance = math.sqrt(Xdistance * Xdistance + Ydistance * Ydistance)
            local data = {
                playerDimension = playerPosition,
                targetDistance = distance
            }
            local dataField = HttpService:JSONEncode(data)
            local response = HttpService:PostAsync("http://localhost:8080/store.json", dataField)
            print(response)
			print("brickPosition", brickPosition)
			print("Humanoid", playerPosition)
			print("distance", distance)
			wait(4)
		end
	end)
end)
