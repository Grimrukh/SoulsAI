REGISTER_GOAL(GOAL_Nanimosinai11000_Battle, "Nanimosinai11000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Nanimosinai11000_Battle, 1)
function Nanimosinai11000Battle_Activate(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, 5, TARGET_NONE, 0, 0, 0)
    return 
end

function Nanimosinai11000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Nanimosinai11000Battle_Terminate(ai, goal)
    return 
end

function Nanimosinai11000Battle_Interupt(ai, goal)
    return false
end

return 
