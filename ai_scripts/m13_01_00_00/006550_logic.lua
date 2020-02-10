REGISTER_LOGIC_FUNC(LOGIC_ID_TempleKnight6550, "TempleKnight6550_Logic", "TempleKnight6550_Interupt")
function TempleKnight6550_Logic(ai)
    ai:AddTopGoal(GOAL_TempleKnight6550_Battle, -1, 0, 0, 0, 0)
    return 
end

function TempleKnight6550_Interupt(ai, goal)
    return 
end

return 
