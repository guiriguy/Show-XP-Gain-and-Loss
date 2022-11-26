local old_count = 0
local new_count = 0
local SSXP = false
local XPTable = XPTable or {}
local tsSkill = ""
local _player
local Timer = 0
local function GainAllXPs(player, skill, level)
    SSXP = true
    tsSkill = skill:getName()
    _player = player
    old_count = old_count + 1
    local roundLevel = math.ceil(level*100)/100
    if roundLevel ~= 0 then
        if XPTable[tsSkill] then
            XPTable[tsSkill]["number"] = XPTable[tsSkill]["number"] + level
        else
            XPTable[tsSkill] = {name = tsSkill, number = level}
        end
    end
    tsSkill = ""
end
local function ShowXP(player)
    if not player:isNPC() and not player:isDead() then
        for _, XPT in pairs(XPTable) do
            local showAmountString = 0
            showAmountString = string.format("%.2f", tostring(XPT.number))
            if XPT.number > 0 then
                HaloTextHelper.addTextWithArrow(player, XPT.name .. " +" .. showAmountString, true, HaloTextHelper.getColorGreen())
            elseif XPT.number < 0 then
                HaloTextHelper.addTextWithArrow(player, XPT.name .. " " .. showAmountString, false, HaloTextHelper.getColorRed())
            end
        end
    end
end
local function CheckToGive()
    if Timer < 300 then
        Timer = Timer + 1
    end
    if SSXP == true and Timer == 300 then
        if old_count == new_count then
            Timer = 0
            old_count = 0
            new_count = 0
            SSXP = false
            ShowXP(_player)
            XPTable = {}
            _player = nil
        else
            new_count = old_count
        end
    end
end
Events.AddXP.Add(GainAllXPs)
Events.OnPlayerUpdate.Add(CheckToGive)