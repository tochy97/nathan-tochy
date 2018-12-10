ai = {}

function ai_load(x,y,w,h)
	table.insert(ai, {x=x,y=y,w=w,h=h,velX=200,velY=0})
end

function ai_update(dt)
	ai_chase(dt)
end

function ai_chase(dt)
	for i, v in pairs(ai)do
		dx = v.x - player.x
		dy = v.y - player.y
		dis = math.sqrt(dx^2 + dy^2) -- vector from ai to player
		v.x = v.x - dx/dis * v.velX * dt -- creep left or right		
		v.y = v.y - dy/dis * v.velX * dt
	end
end

function drawAI()
	--Creating ai
	for i, v in pairs(ai)do	
		love.graphics.setColor(100,100,100)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end
