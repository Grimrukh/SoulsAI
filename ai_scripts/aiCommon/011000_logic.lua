REGISTER_LOGIC_FUNC(LOGIC_ID_Nanimosinai11000, "Nanimosinai11000_Logic", "Nanimosinai11000_Interupt")
function Nanimosinai11000_Logic(ai)
    ai:AddTopGoal(GOAL_COMMON_Wait, 5, TARGET_NONE, 0, 0, 0)
    return 
end

function Nanimosinai11000_Interupt(ai, goal)
    return 
end

return 
