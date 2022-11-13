--[[local function CheckRegularity ()

	if not itsExercise then

		for playerIndex=0,getNumActivePlayers()-1 do
			local character = getSpecificPlayer(playerIndex)
			if character and not character:isDead() then
				for k,v in pairs(FitnessExercises.exercisesType) do
					count = count + 1
					sumAverage = (math.ceil((sumAverage + character:getFitness():getRegularity(k))*100))/100
				end		
		
				totAverage = math.ceil((sumAverage/count)*100)/100
		
				calcMulExe(character, Perks.Strength, character:getPerkLevel(Perks.Strength), totAverage)
				calcMulExe(character, Perks.Fitness, character:getPerkLevel(Perks.Fitness), totAverage)
		
				count = 0
				sumAverage = 0
			end
		end
	end
end

Events.EveryTenMinutes.Add(CheckRegularity)]]--

function Test(character, perk, Float)
	Float = Float * 0.1
	PerkToUp = perk
	print(character)
	print(perk)
	print(Float)
	character:getXP():AddXP(PerkToUp, -4.0)
end

Events.AddXP.Add(Test)