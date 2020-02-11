REGISTER_LOGIC_FUNC(LOGIC_ID_PaladinLeeroySummon6550, "PaladinLeeroySummon6550_Logic", "PaladinLeeroySummon6550_Interupt")
function PaladinLeeroySummon6550_Logic(ai)
    ai:AddTopGoal(GOAL_PaladinLeeroySummon6550_Battle, -1, 0, 0, 0, 0)
    return 
end

function PaladinLeeroySummon6550_Interupt(ai, goal)
    return 
end

return 
