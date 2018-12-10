require "player"
require "button"
require "ai"
require "blocks"
require "game"
require "camera"
require "special"
require "AnAL"

function love.load()
	lard = love.graphics.newFont(100)
	mid = love.graphics.newFont(45)
	
	--GAME MENU
	gamestate = "menu" --game starts at menu
	love.graphics.setBackgroundColor(255,255,255)
	--Loading Classes
	first_load()
end

function love.update(dt)
	mousex = love.mouse.getX()
	mousey = love.mouse.getY()
	--GAME MENU
	if gamestate == "menu" then
		button = {}
		button_hover()
		button_spawn(150,150, "Start","start")
		button_spawn(150,225, "Restart","rstart")
		button_spawn(150,300, "Quit","close")		
	end
	
	--OPTION MENU
	if gamestate == "option" then
		option = {}
		option_hover()
		option_spawn(150,50, "Return?","back")
	end
	
	--End of Level
	if gamestate == "end" then
		button = {}
		button_hover()
		button_spawn(150,150, "Restart","rstart")
		button_spawn(150,300, "Quit","close")		
	end
	
	--IN GAME
	if gamestate == "play" then
		if love.keyboard.isDown("escape") then
			gamestate = "menu"
		end
		if player.x > love.graphics.getWidth()/2.5 then
			camera.x = player.x - love.graphics.getWidth()/2.5
			hub.x = camera.x
		end
		if player.y > love.graphics.getHeight()/2.5 then
			camera.y = player.y - love.graphics.getHeight() /2.5
			hub.y = camera.y + 450
		end
		--Updating Player
		player.update(dt)
		ai_update(dt)
		side_stop()
		ground_stop(dt)
		move_stop(dt)
		--playColl()
		--wall()
	end
	
end

function love.draw()
	--GAME MENU
	if gamestate == "menu" or gamestate == "end" 
	then	button_draw()	
	end
	if gamestate == "option"
	then	option_draw()	
	end
	--IN GAME
	if gamestate == "play" then
	camera:set()
		DRAW_PLAYER()
		first_draw()
		--Drawing Classes
		drawSpecial()
		drawBad()
		DRAW_HUB()
		drawAI()
		side_draw()
		wall_draw()
		move_draw()
		ground_draw()
	camera:unset()
	end
end

function love.keypressed(key)
	
	if gamestate == "play" then
		player.keypressed(key)
		move_keypressed(key)
	end
	
	if gamestate == "menu" then
		if key == "return" then
			gamestate = "play"
		end
		if key == "escape" then
			love.window.close()
		end
	end
	if gamestate == "end" then
		if key == "return" then
			gamestate = "play"
			first_load()
			camera.x = 0
			camera.y = 0
		end
		if key == "escape" then
			love.window.close()
		end
	end
end

function love.keyreleased(key)
	player.keyreleased(key)
end

function love.mousepressed(x,y)
-- check if the mouse was clicked
	if gamestate == "menu" or gamestate == "end" then
		button_click(x,y)
	end
	
	if gamestate == "option" then
		button_click(x,y)
	end
	
end
