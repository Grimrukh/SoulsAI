REGISTER_LOGIC_FUNC(LOGIC_ID_BlackIronTarkus6510, "BlackIronTarkus6510_Logic", "BlackIronTarkus6510_Interupt")
function BlackIronTarkus6510_Logic(ai)
    ai:AddTopGoal(GOAL_BlackIronTarkus6510_Battle, -1, 0, 0, 0, 0)
    return 
end

function BlackIronTarkus6510_Interupt(ai, goal)
    return 
end

return 
