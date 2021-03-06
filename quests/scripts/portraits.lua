function setPortraits(titleFn)
  quest.setParameter("sail", {
    type = "noDetail",
	-- name = "S.A.I.L",
    name = "A.N.G.E.L.A",
    portrait = {
      { image = "/ai/portraits/angela_questportrait.png" }
    }
  })

  local config = config.getParameter("portraits")
  local portraitParameters = {
      QuestStarted = config.questStarted or config.default,
      QuestComplete = config.questComplete or config.default,
      QuestFailed = config.questFailed or config.default,
      Objective = config.objective
    }

  local parameters = quest.parameters()
  for portraitName, portrait in pairs(portraitParameters) do
    local drawables
    local title

    if type(portrait) == "string" then
      local paramValue = parameters[portrait]
      if paramValue then
        drawables = paramValue.portrait
        title = paramValue.name
      end
    else
      drawables = portrait.portrait
      title = portrait.title
    end

    if titleFn then
      title = titleFn(title)
    end

    quest.setPortrait(portraitName, drawables)
    quest.setPortraitTitle(portraitName, title)
  end
end
