REGISTER_GOAL(GOAL_CrystalLizard330000_Battle, "CrystalLizard330000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_CrystalLizard330000_Battle, 1)
function CrystalLizard330000Battle_Activate(ai, goal)
    local RUNAWAY_LIFETIME = 6
    if 0 == ai:GetNumber(0) then
        goal:AddSubGoal(GOAL_CrystalLizard330000_Runaway, RUNAWAY_LIFETIME)
    end
    goal:AddSubGoal(GOAL_CrystalLizard330000_Hide, 10)
    return 
end

function CrystalLizard330000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function CrystalLizard330000Battle_Terminate(ai, goal)
    return 
end

function CrystalLizard330000Battle_Interupt(ai, goal)
    if not not ai:IsInterupt(INTERUPT_Damaged) or ai:IsInterupt(INTERUPT_Damaged_Stranger) then
        ai:Replaning()
        ai:SetNumber(0, 0)
    end
    return false
end

REGISTER_GOAL(GOAL_CrystalLizard330000_Runaway, "CrystalLizard330000Runaway")
REGISTER_GOAL_NO_INTERUPT(GOAL_CrystalLizard330000_Runaway, true)
function CrystalLizard330000Runaway_Activate(ai, goal)
    local life_time = goal:GetLife()
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life_time, TARGET_ENE_0, 100, TARGET_SELF, false, -1)
    return 
end

function CrystalLizard330000Runaway_Update(ai, goal)
    if goal:GetLastSubGoalResult() == GOAL_RESULT_Failed then
        return GOAL_RESULT_Success
    else
        return GOAL_RESULT_Continue
    end
end

function CrystalLizard330000Runaway_Terminate(ai, goal)
    return 
end

function CrystalLizard330000Runaway_Interupt(ai, goal)
    return false
end

REGISTER_GOAL(GOAL_CrystalLizard330000_Hide, "CrystalLizard330000Hide")
REGISTER_GOAL_NO_UPDATE(GOAL_CrystalLizard330000_Hide, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_CrystalLizard330000_Hide, true)
function CrystalLizard330000Hide_Activate(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    local life_time = goal:GetLife()
    goal:AddSubGoal(GOAL_COMMON_Wait, life_time, TARGET_ENE_0)
    ai:SetNumber(0, 1)
    return 
end

function CrystalLizard330000Hide_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function CrystalLizard330000Hide_Terminate(ai, goal)
    return 
end

function CrystalLizard330000Hide_Interupt(ai, goal)
    return false
end

return 
