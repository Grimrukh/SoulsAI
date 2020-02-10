REGISTER_GOAL(GOAL_Blacksmith_Rickelt6220_Battle, "Blacksmith_Rickelt6220Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_Blacksmith_Rickelt6220_Battle, 1)
function Blacksmith_Rickelt6220Battle_Activate(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
    goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    return 
end

function Blacksmith_Rickelt6220Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Blacksmith_Rickelt6220Battle_Terminate(ai, goal)
    return 
end

function Blacksmith_Rickelt6220Battle_Interupt(ai, goal)
    return false
end

return 
