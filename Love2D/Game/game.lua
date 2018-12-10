hub = {}
down = love.graphics.newImage("down.png")

function hub.load()
	hub.x = 0
	hub.y = 450
	hub.w = 900
	hub.h = 150
end

function DRAW_HUB()
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill",hub.x,hub.y,hub.w,hub.h)
	love.graphics.setColor(254, 231, 219)
	love.graphics.print(string.format("Local : ", love.timer.getDelta()), hub.x + 20, hub.y + 50)
end

function collide(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function reset_player()
	player.x = 5
	player.y = 5
	player.velX = 0
	player.velY = 0
end


function first_load()
	player.load()
	ai = {}
	ground = {}
	wall = {}
	side = {}
	move = {}
	player.velX = 0
	player.velY = 0 -- speed of fall - default: 0
	hub.load()
	--ai_load(400,0,20,20)
	ground_load(0,700,200,2)
	ground_load(402,748,100,2)
	ground_load(602,700,100,2)
	--bad_load(855,690,10,10)
	move_load(825,750,150,2)
	move_load(1300,700,150,2)
	move_load(2550,2500,200,2)
	ground_load(2050,2600,200,2)
	wall_load(0,0,5,2000)
	wall_load(0,5000,1000,1000)
end

function first_draw()
   love.graphics.draw(down, 2600, 600)	
end