player = {}

function player.load()
	--Stats of player
	player.x = 10
	player.mass = 100 -- default: 100
	player.gravity = 500 -- default: 500
	player.y = 50
	player.velX = 0
	player.velY = 0 -- speed of fall - default: 0
	player.friction = 13 -- default: 15
	player.speed = 300 -- default: 250
	player.width = 40
	player.height = 48
	player.jump = 300	-- max height of jump - default:
	player.fall = false
	player.ground = 3000
	player.wRPic = love.graphics.newImage("walkR.png")
	player.wLPic = love.graphics.newImage("walkL.png")
	player.pic = love.graphics.newImage("Idle.png")
	player.walkR = newAnimation(player.wRPic,29,51,0.2,2)
	player.walkL = newAnimation(player.wLPic,29,51,0.2,2)
end
	
function DRAW_PLAYER()
	love.graphics.setColor(255,255,255)
	player.draw()
	if player.velX > 0 then
		player.pic = love.graphics.newImage("blank.png")
		player.walkR:draw(player.x,player.y)
	elseif player.velX < 0 then
		player.pic = love.graphics.newImage("blank.png")
		player.walkL:draw(player.x,player.y)
	end
end

function player.update(dt)
	player.movement(dt)
	player.collide()
end

function player.draw()
	--Creating Player
	love.graphics.draw(player.pic,player.x,player.y)
end

function player.movement(dt)
	
	--Increase x and y position by the velocity
	player.x = player.x + player.velX *dt
	
	--Gravity
	player.velY = player.velY + player.gravity*dt
	if player.velY ~= 0 then
		player.y = player.y + player.velY*dt
	end
	
	if love.keyboard.isDown("left")
		then player.velX = -player.speed
		player.walkL:update(dt)
	elseif love.keyboard.isDown("right")
		then player.velX = player.speed
		player.walkR:update(dt)
	end
	
	--Smooths the increaing of the velocity
	player.velX = player.velX * (1-math.min(dt*player.friction,1))	
end

function player.collide()
	for i,v in pairs(ai)do
		if collide(player.x,player.y,player.width,player.height,v.x,v.y,20,20) then
			gamestate = "end"
		end
	end
	for i,v in pairs(special)do
		if collide(player.x,player.y,player.width,player.height,v.x,v.y,20,20) then
			gamestate = "end"
		end
	end
	if player.y > 5000
		then gamestate = "end"
	end
	if player.x < 5 then
		player.velX=0
		player.x = 5
	end
end

function player.keypressed(key)

	if key == "space" and player.velY == 0 then
		player.velY = -player.jump
	end
	
end

function player.keyreleased(key)
	if key == "left" then
		player.pic = love.graphics.newImage("IdleL.png")
	elseif key == "right" then
		player.pic = love.graphics.newImage("Idle.png")
	end
end