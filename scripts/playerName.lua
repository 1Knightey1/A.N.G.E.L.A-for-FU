require("/objects/spawner/techstation.lua")

function onInteraction(args)
  if self.dialogTimer then
    sayNext(args.sourceId)
    return nil
  else
    return config.getParameter("interactAction")
  end
end

function sayNext(id)
  if self.dialog and #self.dialog > 0 then
    local options = {
      drawMoreIndicator = self.drawMoreIndicator
    }
    self.dialogTimer = self.dialogInterval
    if #self.dialog == 1 then
      options.drawMoreIndicator = false
      self.dialogTimer = 0.0
    end
    
    local name = world.entityName(id or world.players()[1])

    object.sayPortrait(self.dialog[1][1], self.dialog[1][2], {entityName = name or ""}, options)
    table.remove(self.dialog, 1)

    return true
  else
    self.dialog = nil
    return false
  end
end