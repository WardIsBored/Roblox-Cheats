local Players = game:GetService("Players")

while task.wait(1) do
	for _, player in ipairs(Players:GetPlayers()) do
		local character = player.Character
		if character then
			-- ✅ Clear existing ESP parts
			for _, obj in ipairs(character:GetDescendants()) do
				if obj:IsA("Highlight") and obj.Name == "ESP-H" then
					obj:Destroy()
				elseif obj:IsA("BillboardGui") and obj.Name == "ESP-T" then
					obj:Destroy()
				end
			end

			-- ✅ Add new ESP parts
			for _, part in ipairs(character:GetChildren()) do
				if part:IsA("BasePart") then
					-- ✅ Create highlight
					local highlight = Instance.new("Highlight")
					highlight.Name = "ESP-H"
					highlight.Adornee = part
					highlight.Parent = character -- Safer to parent to character or workspace

					-- ✅ Create BillboardGui on head only
					if part.Name == "Head" then
						local tag = Instance.new("BillboardGui")
						tag.Name = "ESP-T"
						tag.Size = UDim2.new(0, 100, 0, 40) -- GUI size
						tag.StudsOffset = Vector3.new(0, 3, 0) -- Offset above head
						tag.AlwaysOnTop = true
						tag.Parent = part

						local nameLabel = Instance.new("TextLabel")
						nameLabel.Parent = tag
						nameLabel.Size = UDim2.new(1, 0, 1, 0)
						nameLabel.BackgroundTransparency = 1
						nameLabel.Text = player.Name
						nameLabel.TextColor3 = Color3.new(1, 1, 1)
						nameLabel.TextScaled = true -- Auto-scale text to fit
					end
				end
			end
		end
	end
end
