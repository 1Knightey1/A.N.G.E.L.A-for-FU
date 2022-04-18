local oldInit = init
local oldUpdate = update

local protectorate

function init()
	if oldInit then oldInit() end
	protectorate = world.type() == "protectorate"
end

function update(...)
	if oldUpdate then oldUpdate(...) end
	
	if protectorate and not storage.lobotomyflyer then
		storage.lobotomyflyer = true
		
		local h = world.containerAddItems(entity.id(), "lobotomyflyer")
		if h then
			world.spawnItem(h, entity.position())
		end
	end
end