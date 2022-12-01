local SSXP = {}
SSXP.XPGiven = false
SSXP.Counted = false
SSXP.XPTable = SSXP.XPTable or {}
SSXP.Timer = 0
SSXP.VanillaPerks = { Strength = "Strength",
                      Fitness = "Fitness",
                      Sprinting = "Sprinting",
                      Lightfoot = "Lightfooted",
                      Nimble = "Nimble",
                      Sneak = "Sneaking",
                      Axe = "Axe",
                      Blunt = "Long Blunt",
                      SmallBlunt = "Short Blunt",
                      LongBlade = "Long Blade",
                      SmallBlade = "Short Blade",
                      Spear = "Spear",
                      Maintenance = "Maintenance",
                      Woodwork = "Carpentry",
                      Cooking = "Cooking",
                      Farming = "Farming",
                      Doctor = "First Aid",
                      Electricity = "Electrical",
                      MetalWelding = "Metalworking",
                      Mechanics = "Mechanics",
                      Tailoring = "Tailoring",
                      Aiming = "Aiming",
                      Reloading = "Reloading",
                      Fishing = "Fishing",
                      Trapping = "Trapping",
                      PlantScavenging = "Foraging"}
SSXP.IgnorePerks = {Foraging=true}
SSXP.AppliedSettings = SSXP.AppliedSettings or {}
--╭────────────────────────╮
--|   ModOptions Addon     |
--╰────────────────────────╯
if ModOptions and ModOptions.getInstance then
    print("test")
    local ApplySSXPSettings = function(optionValues)
        SSXP.AppliedSettings.debugMode = optionValues.settings.options.debugMode
        SSXP.AppliedSettings.showNumbers = optionValues.settings.options.showNumbers
        SSXP.AppliedSettings.OnlyNegative = optionValues.settings.options.showOnlyNegative
        SSXP.AppliedSettings.OnlyPositive = optionValues.settings.options.showOnlyPositive
        SSXP.AppliedSettings.refreshMode = optionValues.settings.options.refreshMode
        SSXP.AppliedSettings.refreshModeSeconds = optionValues.settings.options.refreshModeSeconds
        SSXP.AppliedSettings.OtherSkills = optionValues.settings.options.OtherSkills
        for k,v in pairs(optionValues.settings.options) do
            if SSXP.VanillaPerks[k] then
                if v and not SSXP.IgnorePerks[k] then
                    SSXP.IgnorePerks[k] = v
                elseif SSXP.IgnorePerks[k] and not v then
                    SSXP.IgnorePerks[k] = v
                end
            end
        end
    end
    local Settings =
    {
        options_data = {
            debugMode = {
                name = "IGUI_SSXP_debugMode",
                tooltip = "IGUI_SSXP_debugMode_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            showNumbers = {
                name = "IGUI_SSXP_showNumbers",
                tooltip = "IGUI_SSXP_showNumbers_tooltip",
                default = true,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            showOnlyPositive = {
                name = "IGUI_SSXP_showOnlyPositive",
                tooltip = "IGUI_SSXP_showOnlyPositive_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            showOnlyNegative = {
                name = "IGUI_SSXP_showOnlyNegative",
                tooltip = "IGUI_SSXP_showOnlyNegative_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            refreshMode = {
                getText("IGUI_SSXP_refreshMode_1"),getText("IGUI_SSXP_refreshMode_2"),getText("IGUI_SSXP_refreshMode_3"),getText("IGUI_SSXP_refreshMode_4"),getText("IGUI_SSXP_refreshMode_5"),
                name = "IGUI_SSXP_refreshMode",
                tooltip = "IGUI_SSXP_refreshMode_tooltip",
                default = 5,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            refreshModeSeconds = {
                "3","4","5","6","7","8","9","10","15","30","60",
                name = "IGUI_SSXP_refreshModeSeconds",
                tooltip = "IGUI_SSXP_refreshModeSeconds_tooltip",
                default = 3,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Strength = {
                name = "IGUI_SSXP_Strength",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Fitness = {
                name = "IGUI_SSXP_Fitness",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Sprinting = {
                name = "IGUI_SSXP_Sprinting",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Lightfoot = {
                name = "IGUI_SSXP_Lightfoot",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Nimble = {
                name = "IGUI_SSXP_Nimble",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Sneak = {
                name = "IGUI_SSXP_Sneak",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Axe = {
                name = "IGUI_SSXP_Axe",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Blunt = {
                name = "IGUI_SSXP_Blunt",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            SmallBlunt = {
                name = "IGUI_SSXP_SmallBlunt",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            LongBlade = {
                name = "IGUI_SSXP_LongBlade",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            SmallBlade = {
                name = "IGUI_SSXP_SmallBlade",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Spear = {
                name = "IGUI_SSXP_Spear",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Maintenance = {
                name = "IGUI_SSXP_Maintenance",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Woodwork = {
                name = "IGUI_SSXP_Woodwork",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Cooking = {
                name = "IGUI_SSXP_Cooking",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Farming = {
                name = "IGUI_SSXP_Farming",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Doctor = {
                name = "IGUI_SSXP_Doctor",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Electricity = {
                name = "IGUI_SSXP_Electricity",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            MetalWelding = {
                name = "IGUI_SSXP_MetalWelding",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Mechanics = {
                name = "IGUI_SSXP_Mechanics",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Tailoring = {
                name = "IGUI_SSXP_Tailoring",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Aiming = {
                name = "IGUI_SSXP_Aiming",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Reloading = {
                name = "IGUI_SSXP_Reloading",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Fishing = {
                name = "IGUI_SSXP_Fishing",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Trapping = {
                name = "IGUI_SSXP_Trapping",
                tooltip = "IGUI_SSXP_VanillaPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            OtherSkills = {
                name = "Hide Modded Skills",
                tooltip = "IGUI_SSXP_ModdedPerks_tooltip",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
        },
        mod_id = "SimpleShowXP",
        mod_shortname = "Simple Show XP",
        mod_fullname = "Simple Show XP",
    }
    ModOptions:getInstance(Settings)
    ModOptions:loadFile()
    local getSettings = ModOptions:getInstance(Settings)
    local OnlyPositive = getSettings:getData("showOnlyPositive")
    local OnlyNegative = getSettings:getData("showOnlyNegative")
    function OnlyPositive:onUpdate(boolean)
        if boolean then
            OnlyNegative:set(false)
        end
    end
    function OnlyNegative:onUpdate(boolean)
        if boolean then
            OnlyPositive:set(false)
        end
    end
    Events.OnGameStart.Add(function() ApplySSXPSettings({settings = Settings}) end)
end
--╭────────────────────────╮
--|       Functions        |
--╰────────────────────────╯
SSXP.CheckIfPerkIsIgnored =  function(skill)
    if SSXP.VanillaPerks[tostring(skill)] and not SSXP.IgnorePerks[tostring(skill)] then
        return true
    elseif not SSXP.AppliedSettings.OtherSkills and not SSXP.VanillaPerks[tostring(skill)] then
        return true
    end
end
SSXP.GainAllXPs = function(player, skill, level)
    if not player:isNPC() and not player:isDead() and SSXP.CheckIfPerkIsIgnored(skill) then
        local tsSkill = skill:getName()
        local roundLevel = math.ceil(level*100)/100
        if roundLevel ~= 0  and not SSXP.AppliedSettings.debugMode then
            if SSXP.XPTable[tsSkill] then
                SSXP.XPTable[tsSkill]["number"] = SSXP.XPTable[tsSkill]["number"] + level
            else
                SSXP.XPTable[tsSkill] = {name = tsSkill, number = level}
            end
            SSXP.XPGiven = true
        elseif roundLevel ~= 0 and SSXP.AppliedSettings.debugMode then
            SSXP.ShowXP(player,tsSkill,level)
        end
    end
        --[[for _, Perk in pairs(Perks) do
            if SSXP.VanillaPerks[tostring(Perk)] then
                --print("The perk is vanilla: "..tostring(SSXP.VanillaPerks[tostring(Perks)]))
            else
                print(tostring(Perk).." is missing")
            end
        end]]--
end
SSXP.ShowXP = function(player,perk,float)
    if not player:isNPC() and not player:isDead() then
        if not SSXP.AppliedSettings.debugMode then
            local HaloText = HaloTextHelper --For optimizing
            if SSXP.AppliedSettings.refreshMode == 1 then
                HaloText.addText(player, "In the last minute",HaloText.getColorWhite())
            elseif SSXP.AppliedSettings.refreshMode == 2 then
                HaloText.addText(player, "In the last ten minute",HaloText.getColorWhite())
            elseif SSXP.AppliedSettings.refreshMode == 3 then
                HaloText.addText(player, "In the last hour",HaloText.getColorWhite())
            elseif SSXP.AppliedSettings.refreshMode == 4 then
                HaloText.addText(player, "In the last day",HaloText.getColorWhite())
            end
            for _, XPT in pairs(SSXP.XPTable) do
                local showAmountString = ""
                local roundValue = math.floor(XPT.number*100)/100
                if SSXP.AppliedSettings.showNumbers then
                    showAmountString = string.format("%.2f", tostring(roundValue))
                end
                if roundValue > 0 and not SSXP.AppliedSettings.OnlyNegative then
                    HaloText.addTextWithArrow(player, XPT.name .. " +" .. showAmountString, true, HaloText.getColorGreen())
                elseif roundValue < 0 and not SSXP.AppliedSettings.OnlyPositive then
                    HaloText.addTextWithArrow(player, XPT.name .. " " .. showAmountString, false, HaloText.getColorRed())
                end
            end
            SSXP.Counted = false
            SSXP.Timer = 0
            SSXP.XPGiven = false
            SSXP.XPTable = {}
        else
            local HaloText = HaloTextHelper --For optimizing
            local showAmountString = ""
            local roundValue = math.floor(float*100)/100
            if SSXP.AppliedSettings.showNumbers then
                showAmountString = string.format("%.2f", tostring(roundValue))
            end
            if roundValue > 0 and not SSXP.AppliedSettings.OnlyNegative then
                HaloText.addTextWithArrow(player, perk .. " +" .. showAmountString, true, HaloText.getColorGreen())
            elseif roundValue < 0 and not SSXP.AppliedSettings.OnlyPositive then
                HaloText.addTextWithArrow(player, perk .. " " .. showAmountString, false, HaloText.getColorRed())
            end
        end
    end
end
SSXP.CheckToGiveOPU = function(player) -- OnPlayerUpdate
    if not player:isNPC() and not player:isDead() and not SSXP.AppliedSettings.debugMode then
        if SSXP.AppliedSettings.refreshMode == 5 then
            local Calendar = Calendar.getInstance() -- For optimizing
            if not SSXP.Counted then
                local Seconds = Calendar:getTimeInMillis()/1000
                if SSXP.Timer == 0 then
                    SSXP.Timer = Seconds + (SSXP.AppliedSettings.refreshModeSeconds+2)
                    SSXP.Counted = true
                    --print("Seconds: ",SSXP.AppliedSettings.refreshModeSeconds)
                end
            end
            if (Calendar:getTimeInMillis()/1000) >= SSXP.Timer and SSXP.XPGiven then
                SSXP.ShowXP(player)
            end
        end
    end
end
SSXP.CheckToGiveEOM = function() --EveryOneMinute
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 1 and not SSXP.AppliedSettings.debugMode then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                SSXP.ShowXP(_player)
            end
        end
    end
end
SSXP.CheckToGiveETM = function() --EveryTenMinutes
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 2 and not SSXP.AppliedSettings.debugMode then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                SSXP.ShowXP(_player)
            end
        end
    end
end
SSXP.CheckToGiveEH = function() --EveryHours
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 3 and not SSXP.AppliedSettings.debugMode then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                SSXP.ShowXP(_player)
            end
        end
    end
end
SSXP.CheckToGiveED = function() --EveryDays
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 4 and not SSXP.AppliedSettings.debugMode then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                SSXP.ShowXP(_player)
            end
        end
    end
end
--╭────────────────────────╮
--|         Events         |
--╰────────────────────────╯
Events.OnPlayerUpdate.Add(SSXP.CheckToGiveOPU)
Events.EveryOneMinute.Add(SSXP.CheckToGiveEOM)
Events.EveryTenMinutes.Add(SSXP.CheckToGiveETM)
Events.EveryHours.Add(SSXP.CheckToGiveEH)
Events.EveryDays.Add(SSXP.CheckToGiveED)
Events.AddXP.Add(SSXP.GainAllXPs)