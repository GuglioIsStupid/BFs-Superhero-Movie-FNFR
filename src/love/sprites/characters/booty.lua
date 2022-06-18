return graphics.newSprite(
	love.graphics.newImage(graphics.imagePath("characters/booty")),
    	-- Automatically generated from booty.xml
	{
		{x = 0, y = 0, width = 373, height = 352, offsetX = 0, offsetY = -16, offsetWidth = 373, offsetHeight = 368}, -- 1: booty0000
		{x = 373, y = 0, width = 367, height = 357, offsetX = -2, offsetY = -11, offsetWidth = 373, offsetHeight = 368}, -- 2: booty0001
		{x = 0, y = 357, width = 365, height = 362, offsetX = -4, offsetY = -6, offsetWidth = 373, offsetHeight = 368}, -- 3: booty0002
		{x = 365, y = 357, width = 362, height = 368, offsetX = -7, offsetY = 0, offsetWidth = 373, offsetHeight = 368} -- 4: booty0003
	},
	{
		["booty"] = {start = 1, stop = 4, speed = 24, offsetX = 0, offsetY = 0},
        ["idle"] = {start = 1, stop = 1, speed = 0, offsetX = 0, offsetY = 0}
	},
	"idle",
	false
)
