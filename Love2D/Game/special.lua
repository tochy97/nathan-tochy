special = {}

function special_load(x,y,w,h)
	table.insert(special, {x=x,y=y,w=w,h=h})
end

function drawSpecial()
	for i, v in pairs(special)do	
		love.graphics.setColor(250,128,114)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end

bad = {}

function bad_load(x,y,w,h)
	table.insert(bad, {x=x,y=y,w=w,h=h})
end

function drawBad()
	for i, v in pairs(bad)do	
		love.graphics.setColor(250,128,114)
		love.graphics.rectangle("fill",v.x,v.y,v.w,v.h)
	end
end