REGISTER_GOAL(GOAL_WalkingTree335000_Battle, "WalkingTree335000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_WalkingTree335000_Battle, 1)
function WalkingTree335000Battle_Activate(ai, goal)
    local hprate = ai:GetHpRate(TARGET_SELF)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF, 0, 0, 0)
    return 
end

function WalkingTree335000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function WalkingTree335000Battle_Terminate(ai, goal)
    return 
end

function WalkingTree335000Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    return false
end

return 
