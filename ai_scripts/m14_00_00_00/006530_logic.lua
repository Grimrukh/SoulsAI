REGISTER_LOGIC_FUNC(LOGIC_ID_ManeaterMildredSummon6530, "ManeaterMildredSummon6530_Logic", "ManeaterMildredSummon6530_Interupt")
function ManeaterMildredSummon6530_Logic(ai)
    ai:AddTopGoal(GOAL_ManeaterMildredSummon6530_Battle, -1, 0, 0, 0, 0)
    return 
end

function ManeaterMildredSummon6530_Interupt(ai, goal)
    return 
end

return 
