wall = {}
ground = {}
move = {}
side = {}
vel = 200

function wall_load(x,y,w,h)
	table.insert( wall, {x=x,y=y,w=w,h=h})
end

function move_load(x,y,w,h,d)
	table.insert( move, {x=x,y=y,w=w,h=h,bound=false,onTop=false})
end

function side_load(x,y,w,h)
	table.insert( side, {x=x,y=y,w=w,h=h,bound=false,pos=0})
end

function ground_load(x,y,w,h)
	table.insert( ground, {x=x,y=y,w=w,h=h,bound=false})
end

function wall_draw()
	--Creating ai
	for i, v in pairs(wall)do	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end

function ground_draw()
	--Creating ai
	for i, v in pairs(ground)do	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end

function move_draw()
	--Creating ai
	for i, v in pairs(move)do	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end

function side_draw()
	--Creating ai
	for i, v in pairs(side)do	
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end

function ground_stop(dt)
	for i, v in pairs(ground)do
		if player.x < v.x + v.w
		and player.x > v.x-player.height then
			v.bound = true
		else
			v.bound = false
		end
		if player.y <= v.y - player.height + 5 and v.bound == true then
			player.ground = v.y - player.height
		elseif player.y > v.y and v.bound == true then
			player.ground = 3000
		end
		if player.y > player.ground and v.bound == true then
			player.velY = 0
			player.y = player.ground
		end
	end
end

function side_stop()
	for i, v in pairs(side)do
		if player.y < v.y + v.h
			and player.y > v.y-30
			then v.bound = true
		else 
			v.bound = false
		end
		
		if v.bound == true
			and player.x < v.x - 30 then
			v.pos = 0
		elseif v.bound == true 
			and player.x>v.x+v.w then
			v.pos = 1
		end
		if v.bound == true 
			and v.pos == 0 and
			player.x>= v.x - 30 then
			player.speed = 0
			player.x = v.x-30
		else 
			player.speed = 400
		end
		if v.bound == true 
			and v.pos == 1 and
			player.x<= v.x+1 then
			player.speed = 0
			player.x = v.x+1
		else 
			player.speed = 400
		end
	end
end

function move_stop(dt)
	for i, v in pairs(move)do
		if player.x < v.x + v.w
		and player.x > v.x-player.height then
			v.bound = true
		else
			v.bound = false
		end
		if player.y < v.y and v.bound == true then
			player.ground = v.y - player.height
		elseif player.y > v.y and v.bound == true then
			player.ground = 3000
		end
		if player.y > player.ground and v.bound == true then
			player.velY = 0
			player.y = player.ground
			v.onTop = true
		else
			v.onTop = false
		end
		if v.onTop == true then
			v.x = v.x + vel*dt
		end
	end
end


function move_keypressed(key)
	if key == "s" then
		vel = -vel
	end	
end
