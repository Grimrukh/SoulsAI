REGISTER_LOGIC_FUNC(LOGIC_ID_LautrecSummon6590, "LautrecSummon6590_Logic", "LautrecSummon6590_Interupt")
function LautrecSummon6590_Logic(ai)
    ai:AddTopGoal(GOAL_LautrecSummon6590_Battle, -1, 0, 0, 0, 0)
    return 
end

function LautrecSummon6590_Interupt(ai, goal)
    return 
end

return 
