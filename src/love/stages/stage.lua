return {
    enter = function()
        stageImages = {
            graphics.newImage(love.graphics.newImage(graphics.imagePath("week1/stage-back"))), -- stage-back
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("week1/stage-front"))), -- stage-front
		    graphics.newImage(love.graphics.newImage(graphics.imagePath("week1/curtains"))) -- curtains
        }

        stageImages[2].y = 400
        stageImages[3].y = -100

        enemy = love.filesystem.load("sprites/week3/pico-enemy.lua")()
        boyfriend = love.filesystem.load("sprites/characters/momentOfYes.lua")()
        boyfriendSilence = love.filesystem.load("sprites/characters/momentOfSilence.lua")()
        booty = love.filesystem.load("sprites/characters/booty.lua")()

        girlfriend.x, girlfriend.y = 30, -90
        enemy.x, enemy.y = -380, 100
        enemy.sizeX = -1 
        boyfriend.x, boyfriend.y = 260, 100
        boyfriendSilence.x, boyfriendSilence.y = boyfriend.x, boyfriend.y 
        booty.x, booty.y = boyfriend.x, boyfriend.y
    end,

    load = function()

    end,

    update = function(self, dt)
        boyfriendSilence:update(dt)
        booty:update(dt)

        if musicTime <= 24441 then
            if boyfriend:getAnimName() == "idle" then
                boyfriendSilence:animate("idle", false)
                boyfriend:animate("booty", false)
            elseif boyfriend:getAnimName() == "left" then
                boyfriendSilence:animate("left", false)
                boyfriend:animate("booty", false)
            elseif boyfriend:getAnimName() == "right" then
                boyfriendSilence:animate("right", false)
                boyfriend:animate("booty", false)
            elseif boyfriend:getAnimName() == "up" then
                boyfriendSilence:animate("up", false)
                boyfriend:animate("booty", false)
            elseif boyfriend:getAnimName() == "down" then
                boyfriendSilence:animate("down", false)
                boyfriend:animate("booty", false)
            end
        end
        if musicTime >= 41437 and musicTime <= 41487 then
            weeks:safeAnimate(boyfriend, "hey", false, 1)
        elseif musicTime >= 68999 and musicTime <= 68999 + 50 then
            weeks:safeAnimate(boyfriend, "hey", false, 1)
        elseif musicTime >= 110735 and musicTime <= 110785 then
            weeks:safeAnimate(boyfriend, "hey", false, 1)
        end
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(cam.x * 0.9, cam.y * 0.9)

			stageImages[1]:draw()
			stageImages[2]:draw()

			girlfriend:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x, cam.y)

            if musicTime >= 85941 and musicTime <= 87352 then
                healthBarColorEnemy = {183,216,85}
			    enemy:draw()
            else
                healthBarColorEnemy = {0,0,0}
            end
            if (musicTime >= 24441 and musicTime <= 39494) or musicTime >= 41029 then 
                if boyfriend:getAnimName() == "booty" then
                    boyfriend:animate("idle", false)
                end
			    boyfriend:draw()
            elseif musicTime <= 24441 then
                boyfriendSilence:draw()
            else
                if not booty:isAnimated() then
                    booty:animate("idle", false)
                end
                booty:draw()
            end
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(cam.x * 1.1, cam.y * 1.1)

			stageImages[3]:draw()
		love.graphics.pop()
    end,

    leave = function()
        stageImages[1] = nil
        stageImages[2] = nil
        stageImages[3] = nil
    end
}