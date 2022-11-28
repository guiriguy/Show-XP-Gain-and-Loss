local SSXP = {}
SSXP.showNumbers = true
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
if ModOptions and ModOptions.getInstance then
    local ApplySSXPSettings = function(optionValues)
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
            showNumbers = {
                name = "Show Numbers",
                tooltip = "If true, it will show the XP numbers",
                default = true,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            refreshMode = {
                "EveryOneMinute","EveryTenMinutes","EveryHours","EveryDays","Custom",
                name = "Refresh mode",
                tooltip = "All options are on game time, except for Custom, this option is for real life seconds",
                default = 5,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            refreshModeSeconds = {
                "3","4","5","6","7","8","9","10",
                name = "Real life seconds",
                tooltip = "When Custom is selected, these are the seconds it will take to show the gained XP again",
                default = 1,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Strength = {
                name = "Hide Strength",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Fitness = {
                name = "Hide Fitness",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Sprinting = {
                name = "Hide Sprinting",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Lightfoot = {
                name = "Hide Lightfooted",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Nimble = {
                name = "Hide Nimble",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Sneak = {
                name = "Hide Sneak",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Axe = {
                name = "Hide Axe",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Blunt = {
                name = "Hide Blunt",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            SmallBlunt = {
                name = "Hide SmallBlunt",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            LongBlade = {
                name = "Hide LongBlade",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            SmallBlade = {
                name = "Hide SmallBlade",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Spear = {
                name = "Hide Spear",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Maintenance = {
                name = "Hide Maintenance",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Woodwork = {
                name = "Hide Crafting",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Cooking = {
                name = "Hide Cooking",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Farming = {
                name = "Hide Farming",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Doctor = {
                name = "Hide First Aid",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Electricity = {
                name = "Hide Electrical",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            MetalWelding = {
                name = "Hide Metalworking",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Mechanics = {
                name = "Hide Mechanics",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Tailoring = {
                name = "Hide Tailoring",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Aiming = {
                name = "Hide Aiming",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Reloading = {
                name = "Hide Reloading",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Fishing = {
                name = "Hide Fishing",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            Trapping = {
                name = "Hide Trapping",
                tooltip = "Hide the gains of this Perk",
                default = false,
                OnApplyMainMenu = ApplySSXPSettings,
                OnApplyInGame = ApplySSXPSettings,
            },
            OtherSkills = {
                name = "Hide Modded Skills",
                tooltip = "Hide the gains of these Perks",
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
    Events.OnGameStart.Add(function() ApplySSXPSettings({settings = Settings}) end)
end
local function CheckIfPerkIsIgnored(skill)
    if SSXP.VanillaPerks[tostring(skill)] and not SSXP.IgnorePerks[tostring(skill)] then
        --print("Vanilla Skill code should run")
        return true
    elseif not SSXP.AppliedSettings.OtherSkills and not SSXP.VanillaPerks[tostring(skill)] then
        --print("Modded Skill code should run")
        return true
    end
end
local function GainAllXPs(player, skill, level)
    if not player:isNPC() and not player:isDead() then
        if CheckIfPerkIsIgnored(skill) then
            local tsSkill = skill:getName()
            local roundLevel = math.ceil(level*100)/100
            if roundLevel ~= 0 then
                if SSXP.XPTable[tsSkill] then
                    SSXP.XPTable[tsSkill]["number"] = SSXP.XPTable[tsSkill]["number"] + level
                else
                    SSXP.XPTable[tsSkill] = {name = tsSkill, number = level}
                end
            end
            SSXP.XPGiven = true
            tsSkill = ""
        end
        --[[for _, Perk in pairs(Perks) do
            if SSXP.VanillaPerks[tostring(Perk)] then
                --print("The perk is vanilla: "..tostring(SSXP.VanillaPerks[tostring(Perks)]))
            else
                print(tostring(Perk).." is missing")
            end
        end]]--
    end
end
local function ShowXP(player)
    if not player:isNPC() and not player:isDead() then
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
            if SSXP.showNumbers then
                showAmountString = string.format("%.2f", tostring(roundValue))
            end
            if roundValue > 0 then
                HaloText.addTextWithArrow(player, XPT.name .. " +" .. showAmountString, true, HaloText.getColorGreen())
            elseif roundValue < 0 then
                HaloText.addTextWithArrow(player, XPT.name .. " " .. showAmountString, false, HaloText.getColorRed())
            end
        end
        SSXP.Counted = false
        SSXP.Timer = 0
        SSXP.XPGiven = false
        SSXP.XPTable = {}
    end
end
local function CheckToGiveOPU(player)
    if not player:isNPC() and not player:isDead() then
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
                ShowXP(player)
            end
        end
    end
end
local function CheckToGiveEOM()
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 1 then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                if SSXP.AppliedSettings.refreshMode == 1 and SSXP.XPGiven then
                    ShowXP(_player)
                end
            end
        end
    end
end
local function CheckToGiveETM()
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 2 then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                if SSXP.AppliedSettings.refreshMode == 2 and SSXP.XPGiven then
                    ShowXP(_player)
                end
            end
        end
    end
end
local function CheckToGiveEH()
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 3 then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                if SSXP.AppliedSettings.refreshMode == 1 and SSXP.XPGiven then
                    ShowXP(_player)
                end
            end
        end
    end
end
local function CheckToGiveED()
    if SSXP.XPGiven and SSXP.AppliedSettings.refreshMode == 4 then
        for i = 0,getNumActivePlayers()-1 do
            local _player = getSpecificPlayer(i)
            if not _player:isNPC() and not _player:isDead() and _player then
                if SSXP.AppliedSettings.refreshMode == 1 and SSXP.XPGiven then
                    ShowXP(_player)
                end
            end
        end
    end
end
Events.OnPlayerUpdate.Add(CheckToGiveOPU)
Events.EveryOneMinute.Add(CheckToGiveEOM)
Events.EveryTenMinutes.Add(CheckToGiveETM)
Events.EveryHours.Add(CheckToGiveEH)
Events.EveryDays.Add(CheckToGiveED)
Events.AddXP.Add(GainAllXPs)