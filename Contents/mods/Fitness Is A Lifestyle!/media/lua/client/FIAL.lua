require "TimedAction/ISFitnessAction"

local default_start = ISFitnessAction.start
local default_exeLooped = ISFitnessAction.exeLooped
--local default_update = ISFitnessAction.update
local default_stop = ISFitnessAction.stop


function ISFitnessAction:start()
    default_start(self)
    if _player then
        isExercising = true
        _ExerciseName = self.exercise
        _getRegularityExercise = mathsUp00(_player:getFitness():getRegularity(_ExerciseName))
    else
        _player = getPlayer(0)
    end
end

function ISFitnessAction:exeLooped()
    default_exeLooped(self)
    if _player then
        if not isExercising or not _ExerciseName then
            isExercising = true
            _ExerciseName = self.exercise
        end
        -- Works! print(_G["modLvl"..tostring(_LvlPerkFitness)])
        _getRegularityExercise = mathsUp00(_player:getFitness():getRegularity(_ExerciseName))
        if _getRegularityExercise then
            mathMulXP(_player, _PerkStrength, _LvlPerkStrength, _getRegularityExercise)
            mathMulXP(_player, _PerkFitness, _LvlPerkFitness, _getRegularityExercise)
        end
        if modXPEnable then
            if fOfFitness then
                if not modXPxLevel then
                    _player:getXp():AddXP(_TypePerkFitness, (fOfFitness * -1))
                    _player:getXp():AddXP(_TypePerkFitness, (mathsUp00((fOfFitness * (SVLM1+((SVLM10-SVLM1)*((_LvlPerkFitness+1)/10)))))))
                else
                    _player:getXp():AddXP(_TypePerkFitness, (fOfFitness * -1))
                    _player:getXp():AddXP(_TypePerkFitness, (mathsUp00((fOfFitness * (_G["modLvl"..tostring(_LvlPerkFitness)])))))
                end
            end
            if fOfStrength then
                if not modXPxLevel then
                    _player:getXp():AddXP(_TypePerkStrength, (fOfStrength * -1))
                    _player:getXp():AddXP(_TypePerkStrength, (mathsUp00((fOfStrength * (SVLM1+((SVLM10-SVLM1)*((_LvlPerkStrength+1)/10)))))))
                else
                    _player:getXp():AddXP(_TypePerkStrength, (fOfStrength * -1))
                    _player:getXp():AddXP(_TypePerkStrength, (mathsUp00((fOfStrength * (_G["modLvl"..tostring(_LvlPerkStrength)])))))
                end
            end
        end
    else
        _player = getPlayer(0)
    end
end

function ISFitnessAction:stop()
    if _player then
        isExercising = false
        _ExerciseName = nil
        _getRegularityExercise = nil
        _sumAvgRegularity = 0
        _totalAvgRegularity = 0
    else
        _player = getPlayer(0)
    end
    default_stop(self)
end

--[[function ISFitnessAction:update()
	default_update(self)
	--itsExercise = true
	--player = self.character
	--local exerciseName = self.exercise
	--StrengthPerk = Perks.Strength
	--FitnessPerk = Perks.Fitness
	--StrengthLvl = player:getPerkLevel(StrengthPerk)
	--FitnessLvl = player:getPerkLevel(FitnessPerk)

	if player then	

		regNum = math.ceil(player:getFitness():getRegularity(exerciseName)*100)/100

		if not itsExercise then
			itsExercise = true
			totAverage = 0
		end

		if regNum ~= saveregNum then
			saveregNum = regNum
			calcMulExe(player, StrengthPerk, StrengthLvl, saveregNum)
			calcMulExe(player, FitnessPerk, FitnessLvl, saveregNum)
		end
	end
end]]--

--[[function ISFitnessAction:stop()
	player = self.character	
	StrengthPerk = Perks.Strength
	FitnessPerk = Perks.Fitness
	StrengthLvl = player:getPerkLevel(StrengthPerk)
	FitnessLvl = player:getPerkLevel(FitnessPerk)
	--print("type")
	--print(FitnessPerk:getType())
	
	for k,v in pairs(FitnessExercises.exercisesType) do			
		count = count + 1
		sumAverage = (math.ceil((sumAverage + player:getFitness():getRegularity(k))*100))/100
	end

	totAverage = math.ceil((sumAverage/count)*100)/100

	calcMulExe(player, StrengthPerk, StrengthLvl, totAverage)
	calcMulExe(player, FitnessPerk, FitnessLvl, totAverage)

	count = 0
	sumAverage = 0
	regNum = 0
	saveregNum = 0
	itsExercise = false
	default_stop(self)
end]]--