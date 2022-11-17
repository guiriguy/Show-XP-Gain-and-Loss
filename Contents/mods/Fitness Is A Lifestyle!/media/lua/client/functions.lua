mathMulXP =  function(character, perkType, perkLvl, RegNum)
    local RegNumBool = 0
    local mulXP = 0
    local fixedRegNum = 0
    --print("MathMulXP Called")
    if RegNum > 0 then
        RegNumBool = 0.01
        fixedRegNum = RegNum /100
    end
    if XPHardcore then
        --[[if not SimpleLevelMultiplier and not mulXPxLevel then
            local mulXP = mathsUp00((((100^((PercRegNum/100)+0.002161)-1)*(XPMultiplier*(perkLvl+1)))/100)) + 1
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        else]]-- // Legacy
        if mulXPxLevel then
            mulXP = mathsUp00(((100^(fixedRegNum))*RegNumBool)*((_G["mulLvl"..tostring(perkLvl)])-1)) + 1
            --mulXP = mathsUp00((((100^((PercRegNum/100)+0.002161)-1)*(_G["mulLvl"..tostring(perkLvl)]))/100)) + 1 // Legacy
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        else
            mulXP = mathsUp00(((100^(fixedRegNum))*RegNumBool)*((SLM1-1)+((SLM10-SLM1)*((perkLvl+1)/10)))) + 1
            --mulXP = mathsUp00((((100^((PercRegNum/100)+0.002161)-1)*(SLM1+((SLM10-SLM1)*((perkLvl+1)/10))))/100)) + 1 // Legacy
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        end
    else
        --[[if not SimpleLevelMultiplier and not mulXPxLevel then
            mulXP = mathsUp00(((PercRegNum*(XPMultiplier*(perkLvl+1)))/100)) + 1
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        else]]-- Legacy
        if mulXPxLevel then
            mulXP = mathsUp00(fixedRegNum*((_G["mulLvl"..tostring(perkLvl)])-1)) + 1
            --mulXP = mathsUp00(((PercRegNum*(_G["mulLvl"..tostring(perkLvl)]))/100)) + 1 // Legacy
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        else
            mulXP = mathsUp00(fixedRegNum*((SLM1-1)+((SLM10-SLM1)*((perkLvl+1)/10)))) + 1
            --mulXP = mathsUp00(((PercRegNum*(SLM1+((SLM10-SLM1)*((perkLvl+1)/10))))/100)) + 1 // Legacy
            character:getXp():addXpMultiplier(perkType,mulXP,perkLvl,10)
        end
    end
end

CheckRegularity = function ()
	if not itsExercise then
        if _player and not _player:isDead() then
            if _PerkFitness and _PerkStrength and _LvlPerkFitness and _LvlPerkStrength then
                for k,v in pairs(FitnessExercises.exercisesType) do
                    NumberOfExercises = NumberOfExercises + 1
                    _sumAvgRegularity = mathsUp00((_sumAvgRegularity + _player:getFitness():getRegularity(k)))
                end
                _totalAvgRegularity = mathsUp00((_sumAvgRegularity/ NumberOfExercises))

                mathMulXP(_player, _PerkStrength, _LvlPerkStrength, _totalAvgRegularity)
                mathMulXP(_player, _PerkFitness, _LvlPerkFitness, _totalAvgRegularity)

                NumberOfExercises = 0
                _sumAvgRegularity = 0
            end
        elseif not _player then
            _player = getPlayer(0)
        end
        --[[for playerIndex=0,getNumActivePlayers()-1 do
			local character = getSpecificPlayer(playerIndex)
			if character and not character:isDead() then
			end
		end]]--
	end
end

mathsUp00 = function(x)
    x = math.ceil(x*100)/100
    return x
end

XPGiven = function(_character, _perk, _float)
    if _player then
        if tostring(_perk) == "Strength" then
            _PerkStrength = _perk
            _LvlPerkStrength = _player:getPerkLevel(_perk)
            _TypePerkStrength = _PerkStrength:getType()
            ExIsStrength = true
            if _float >= 0 then
                fOfStrength = _float
            end
        elseif tostring(_perk) == "Fitness" then
            _PerkFitness = _perk
            _LvlPerkFitness = _player:getPerkLevel(_perk)
            _TypePerkFitness = _PerkFitness:getType()
            ExIsFitness = true
            if _float >= 0 then
                fOfFitness = _float
            end
        end
    else
        _player = getPlayer(0)
    end
end

Starter = function()

    XPHardcore = SandboxVars.FitnessIsALifestyle.Hardcore
    SLM1 = SandboxVars.FitnessIsALifestyle.SLM1
    SLM10 = SandboxVars.FitnessIsALifestyle.SLM10

    modXPEnable = SandboxVars.FitnessIsALifestyle.VanillaMod
    SimpleVanillaMod = SandboxVars.FitnessIsALifestyle.SimpleVanillaMod
    SVLM1 = SandboxVars.FitnessIsALifestyle.SVLM1
    SVLM10 = SandboxVars.FitnessIsALifestyle.SVLM10

    mulXPxLevel = SandboxVars.FitnessIsALifestyleXLvl.XPPerLevel
    mulLvl0 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl1
    mulLvl1 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl2
    mulLvl2 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl3
    mulLvl3 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl4
    mulLvl4 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl5
    mulLvl5 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl6
    mulLvl6 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl7
    mulLvl7 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl8
    mulLvl8 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl9
    mulLvl9 = SandboxVars.FitnessIsALifestyleXLvl.XPLvl10

    modXPxLevel = SandboxVars.FitnessIsALifestyleXLvl.XPModPerLevel
    modLvl0 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl1
    modLvl1 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl2
    modLvl2 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl3
    modLvl3 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl4
    modLvl4 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl5
    modLvl5 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl6
    modLvl6 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl7
    modLvl7 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl8
    modLvl8 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl9
    modLvl9 = SandboxVars.FitnessIsALifestyleXLvl.XPModLvl10
end

ResetPlayer = function()
    --_player:getModData().LastTimeExercise = 0
    _player = nil
    --print("I've died")
    --print(_player)
end

Events.AddXP.Add(XPGiven)
Events.OnLoad.Add(Starter)
Events.EveryTenMinutes.Add(CheckRegularity)
Events.OnCharacterDeath.Add(ResetPlayer)

--[[writeSettingsFile = function(tbl, filename)
--    local file = getFileWriter(filename, true, false)
--    if not file then
--        return
--    end
--    for key, value in pairs(tbl) do
--        file:write(key .. " = ".. tostring(value) .. "\r\n")
--    end
--    file:close()
--end
--
--readSettingsFile = function(tbl, filename)
--    local file = getFileReader(filename, true)
--    if not file then return end
--    while true do repeat
--        local line = file:readLine()
--        if line == nil then
--            file:close()
--            return
--        end
--        line = string.gsub(line, "^ +(.+) +$", "%1", 1)
--        if line == "" then break end
--        for key, value in string.gmatch(line, "(%w+) *= *(.+)") do
--            tbl[key] = value -- note that value will be a string, you may need to convert to number or w/e
--        end
--    until true end
--    return tbl
--end
--this is essentially a stripped version of the code orgm used to read/write the settings .ini file]]--