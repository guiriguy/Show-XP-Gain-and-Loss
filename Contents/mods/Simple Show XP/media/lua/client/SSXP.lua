local SSXP = {}
SSXP.XPGiven = false
SSXP.Counted = false
SSXP.XPTable = SSXP.XPTable or {}
SSXP.Timer = 0
local function GainAllXPs(player, skill, level)
    if not player:isNPC() and not player:isDead() then
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
end
local function ShowXP(player)
    if not player:isNPC() and not player:isDead() then
        for _, XPT in pairs(SSXP.XPTable) do
            local showAmountString = 0
            local roundValue = math.floor(XPT.number*100)/100
            showAmountString = string.format("%.2f", tostring(roundValue))
            if roundValue > 0 then
                HaloTextHelper.addTextWithArrow(player, XPT.name .. " +" .. showAmountString, true, HaloTextHelper.getColorGreen())
            elseif roundValue < 0 then
                HaloTextHelper.addTextWithArrow(player, XPT.name .. " " .. showAmountString, false, HaloTextHelper.getColorRed())
            end
        end
    end
end
local function CheckToGive(player)
    if not player:isNPC() and not player:isDead() then
        if not SSXP.Counted then
            local Calendar = Calendar.getInstance()
            local Seconds = Calendar:getTimeInMillis()/1000
            if SSXP.Timer == 0 then
                SSXP.Timer = Seconds + 3
                SSXP.Counted = true
            end
        end
        if SSXP.XPGiven and (Calendar.getInstance():getTimeInMillis()/1000) >= SSXP.Timer then
            SSXP.Counted = false
            SSXP.Timer = 0
            SSXP.XPGiven = false
            ShowXP(player)
            SSXP.XPTable = {}
        end
    end
end
Events.AddXP.Add(GainAllXPs)
Events.OnPlayerUpdate.Add(CheckToGive)