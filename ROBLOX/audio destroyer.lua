-- List of provided Sound IDs
local soundIds = {
	"rbxassetid://99861801994947",
-- add more in
}

-- Function to replace SoundId in all Sound objects
local function replaceSoundIds(object)
	for _, descendant in ipairs(object:GetDescendants()) do
		-- Check if the descendant is a Sound object
		if descendant:IsA("Sound") then
			-- Assign a random SoundId from the list
			descendant.SoundId = soundIds[math.random(1, #soundIds)]
		end
	end
end

-- Call the function for specific parts of the game
replaceSoundIds(workspace)
replaceSoundIds(game.StarterPack)