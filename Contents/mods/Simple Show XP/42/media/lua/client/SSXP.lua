--╭────────────────────────╮
--|          Vars          |
--╰────────────────────────╯
SSXP = {}
SSXP.XPTableCreated = false
SSXP.OptionsTableCreated = false
SSXP.Options = nil
SSXP.Timer = 0
SSXP.ActivePerks = {}
SSXP.GainedPerks = {}
SSXP.XPPerks = {}
_player = nil
--╭────────────────────────╮
--|       Functions        |
--╰────────────────────────╯
SSXP.getOptions = function()
    SSXP.Options = PZAPI.ModOptions:getOptions("2891170430")
    for _,v in pairs(SSXP.Options:getOption("10").values) do
        if v["value"] then
            local perk = SSXP.PerkTranslation[v["name"]]
            --print(v["value"])
            --print(perk)
            SSXP.getAllEnabledPerks(perk, v["value"])
        end
    end
end
SSXP.saveXPEnabledPerks = function(name, value)
    SSXP.XPPerks[name] = value
end
SSXP.getPlayer =  function(player)
    --Set Player
    _player = player
    --First table creation
    if not SSXP.OptionsTableCreated then
        SSXP.getOptions()
        SSXP.OptionsTableCreated = true
    end
    if not SSXP.XPTableCreated then
        for activePerk,v in pairs(SSXP.ActivePerks) do
            if SSXP.XPPerks[activePerk] == nil then
                SSXP.saveXPEnabledPerks(activePerk, _player:getXp():getXP(Perks[activePerk]))
            end
        end
        SSXP.XPTableCreated = true
    end
end
SSXP.getAllEnabledPerks = function(name, value)
    SSXP.ActivePerks[name] = value
end
SSXP.showXPHalo = function()
    local textHalo = nil
    local arrow = true
    local r = 0
    local g = 255
    local b = 0
    if not SSXP.XPTableCreated then
        return
    end
    for gainedPerk in pairs(SSXP.GainedPerks) do
        local getShowType = SSXP.Options:getOption("5").selected            
        local maths =_player:getXp():getXP(Perks[gainedPerk]) - SSXP.XPPerks[gainedPerk] 
        local showValue = string.format("%.2f", maths)
        if SSXP.Options:getOption("2").isEnabled then
            if maths > 0 and (getShowType == 1 or getShowType == 2) then
                textHalo = PerkFactory.getPerkName(Perks[gainedPerk]) .. " +" .. showValue .. " "
            elseif maths < 0 and (getShowType == 1 or getShowType == 3) then
                textHalo = PerkFactory.getPerkName(Perks[gainedPerk]) .. " (" .. showValue .. ") "
            end
        else            
            textHalo = PerkFactory.getPerkName(Perks[gainedPerk]) .. " "
        end
        if maths > 0  and (getShowType == 1 or getShowType == 2) then
            arrow = true
            r = 255 * SSXP.Options:getOption("6")["color"]["r"]
            g = 255 * SSXP.Options:getOption("6")["color"]["g"]
            b = 255 * SSXP.Options:getOption("6")["color"]["b"]
        elseif maths < 0 and (getShowType == 1 or getShowType == 3) then
            arrow = false
            r = 255 * SSXP.Options:getOption("7")["color"]["r"]
            g = 255 * SSXP.Options:getOption("7")["color"]["g"]
            b = 255 * SSXP.Options:getOption("7")["color"]["b"]
        end
        if maths ~= 0 then
            if maths < 0 and (getShowType == 1 or getShowType == 2) then 
                HaloTextHelper.addTextWithArrow(
                _player, 
                textHalo, 
                arrow, 
                r, 
                g, 
                b 
            )   
            end
            if maths > 0 and (getShowType == 1 or getShowType == 3) then 
                HaloTextHelper.addTextWithArrow(
                _player, 
                textHalo, 
                arrow, 
                r, 
                g, 
                b 
            )   
            end         
            SSXP.saveXPEnabledPerks(gainedPerk, _player:getXp():getXP(Perks[gainedPerk]))
            SSXP.GainedPerks = {}
        end
    end
end
SSXP.eventOneMinute = function()
    if not _player:isNPC() and not _player:isDead() and SSXP.Options:getOption("8").selected == 1 then
        SSXP.showXPHalo()
    end
end
SSXP.eventTenMinutes = function()
    if not _player:isNPC() and not _player:isDead() and SSXP.Options:getOption("8").selected == 2 then
        SSXP.showXPHalo()
    end
end
SSXP.eventEveryHours = function()
    if not _player:isNPC() and not _player:isDead() and SSXP.Options:getOption("8").selected == 3 then
        SSXP.showXPHalo()
    end
end
SSXP.eventEveryDays = function()
    if not _player:isNPC() and not _player:isDead() and SSXP.Options:getOption("8").selected == 4 then
        SSXP.showXPHalo()
    end
end
SSXP.eventPlayerUpdate = function(player)
    if not SSXP.OptionsTableCreated then
        return
    end
    if not player:isNPC() and not player:isDead() and SSXP.Options:getOption("8").selected == 5 and SSXP.OptionsTableCreated then
        local Calendar = Calendar.getInstance():getTimeInMillis()
        if SSXP.Timer == 0 then
            SSXP.Timer = Calendar
        end
        if ((Calendar-SSXP.Timer)/1000) >= SSXP.Options:getOption("9").value then
            SSXP.showXPHalo()
            SSXP.getOptions()
            SSXP.Timer  = 0
        end
    end
end
SSXP.GainedXPPerks = function(player, perk, level)
    local perk = perk:getId()
    if SSXP.ActivePerks[perk] then
        SSXP.GainedPerks[perk] = true
    end
end
--╭────────────────────────╮
--|        Events          |
--╰────────────────────────╯
Events.EveryOneMinute.Add(SSXP.eventOneMinute)
Events.EveryTenMinutes.Add(SSXP.eventTenMinutes)
Events.EveryHours.Add(SSXP.eventEveryHours)
Events.EveryDays.Add(SSXP.eventEveryDays)
Events.OnPlayerUpdate.Add(SSXP.eventPlayerUpdate)
Events.OnPlayerUpdate.Add(SSXP.getPlayer)
Events.AddXP.Add(SSXP.GainedXPPerks)
Events.OnInitWorld.Add(SSXP.getOptions)