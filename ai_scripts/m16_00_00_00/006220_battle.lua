REGISTER_GOAL(GOAL_BlacksmithRickert6220_Battle, "BlacksmithRickert6220Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_BlacksmithRickert6220_Battle, 1)
function BlacksmithRickert6220Battle_Activate(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
    goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    return 
end

function BlacksmithRickert6220Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BlacksmithRickert6220Battle_Terminate(ai, goal)
    return 
end

function BlacksmithRickert6220Battle_Interupt(ai, goal)
    return false
end

return 
