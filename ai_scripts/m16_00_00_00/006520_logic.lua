REGISTER_LOGIC_FUNC(LOGIC_ID_Witch6520, "Witch6520_Logic", "Witch6520_Interupt")
function Witch6520_Logic(ai)
    ai:AddTopGoal(GOAL_Witch6520_Battle, -1, 0, 0, 0, 0)
    return 
end

function Witch6520_Interupt(ai, goal)
    return 
end

return 
