--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

local song, difficulty

local stageBack, stageFront, curtains

return {
	enter = function(self, from, songNum, songAppend)
		weeks:enter()
		stages["stage"]:enter()

		week = 1

		song = songNum
		difficulty = songAppend

		healthBarColorEnemy = {0,0,0}	
		enemyIcon:animate("pico", false)	

		self:load()
	end,

	load = function(self)
		weeks:load()
		stages["stage"]:load()

		inst = nil
		voices = love.audio.newSource("songs/superheromovie/Voices.ogg", "stream")

		self:initUI()

		weeks:setupCountdown()
	end,

	initUI = function(self)
		weeks:initUI()

		weeks:generateNotes(love.filesystem.load("songs/superheromovie/normal.lua")())
	end,

	update = function(self, dt)
		weeks:update(dt)
		stages["stage"]:update(dt)

		if not (countingDown or graphics.isFading()) and not (voices:isPlaying()) and not paused then
			status.setLoading(true)

			graphics.fadeOut(
				0.5,
				function()
					if storyMode then
						Gamestate.switch(menuWeek)
					else
						Gamestate.switch(menuFreeplay)
					end

					status.setLoading(false)
				end
			)
		end

		weeks:updateUI(dt)
	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(cam.sizeX, cam.sizeY)

			stages["stage"]:draw()

			weeks:drawRating(0.9)
		love.graphics.pop()

		weeks:drawHealthBar()
		weeks:drawUI()
	end,

	leave = function(self)
		stages["stage"]:leave()
		weeks:leave()
	end
}
