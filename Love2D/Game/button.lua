button = {}

function button_spawn(x,y,text,id)
	table.insert(button, {x = x, y = y, text = text, id = id, hover = false}) -- add a button to the screen
end

function button_draw()
	-- "i" is the table we are using is in the parentheses, "v" is specific point in table	
	for i,v in ipairs(button) do -- every "v" is a button
		if v.hover == false then
			love.graphics.setColor(142,69,133)
		end
		if v.hover == true then
			love.graphics.setColor(0,0,0)
			love.graphics.rectangle("line",v.x - 5,v.y -5, 150,70)
		end
		love.graphics.setFont(mid)
		love.graphics.print(v.text,v.x,v.y)
	end
end

function button_click(x,y)
	for i,v in ipairs(button) do
		if x > v.x and 
		x < v.x + mid:getWidth(v.text) and
		y > v.y and 
		y < v.y + mid:getHeight() then -- if the x and y of the mouse is inside the button
			if v.id == "start" then
				gamestate = "play"
			end
			if v.id == "option" then
				gamestate = "option"
			end
			if v.id == "close" then
				love.event.push("quit") -- closes game
			end
			if v.id == "rstart" then
				gamestate = "play"
				first_load()
				camera.x = 0
				camera.y = 0
			end
		end
	end
end	

function button_hover(x,y)
	for i,v in ipairs(button) do
		if mousex > v.x and 
		mousex < v.x + mid:getWidth(v.text) and
		mousey > v.y and
		mousey < v.y + mid:getHeight(v.text) then
			v.hover = true
		else
			v.hover = false
		end
	end
end
		