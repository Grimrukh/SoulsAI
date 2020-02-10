REGISTER_GOAL(GOAL_DriftItemGood349000_Battle, "DriftItemGood349000Battle")
REGISTER_GOAL_NO_UPDATE(GOAL_DriftItemGood349000_Battle, 1)
function DriftItemGood349000Battle_Activate(ai, goal)
    local RUNAWAY_LIFETIME = 6
    if 0 == ai:GetNumber(0) then
        goal:AddSubGoal(GOAL_DriftItemGood349000_Runaway, RUNAWAY_LIFETIME)
    end
    goal:AddSubGoal(GOAL_DriftItemGood349000_Hide, 10)
    return 
end

function DriftItemGood349000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function DriftItemGood349000Battle_Terminate(ai, goal)
    return 
end

function DriftItemGood349000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local jumptimer = ai:GetRandam_Int(4, 8)
    if not not ai:IsInterupt(INTERUPT_Damaged) or ai:IsInterupt(INTERUPT_Damaged_Stranger) then
        ai:Replaning()
        ai:SetNumber(0, 0)
    end
    if ai:IsFinishTimer(2) == true and fate <= 30 then
        goal:ClearSubGoal()
        ai:SetTimer(2, jumptimer)
        goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3000, TARGET_SELF, DIST_NONE, 0)
        return true
    else
        return false
    end
end

REGISTER_GOAL(GOAL_DriftItemGood349000_Runaway, "DriftItemGood349000Runaway")
REGISTER_GOAL_NO_INTERUPT(GOAL_DriftItemGood349000_Runaway, true)
function DriftItemGood349000Runaway_Activate(ai, goal)
    local life_time = goal:GetLife()
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life_time, TARGET_ENE_0, 100, TARGET_SELF, false, -1)
    return 
end

function DriftItemGood349000Runaway_Update(ai, goal)
    if goal:GetLastSubGoalResult() == GOAL_RESULT_Failed then
        return GOAL_RESULT_Success
    else
        return GOAL_RESULT_Continue
    end
end

function DriftItemGood349000Runaway_Terminate(ai, goal)
    return 
end

function DriftItemGood349000Runaway_Interupt(ai, goal)
    return false
end

REGISTER_GOAL(GOAL_DriftItemGood349000_Hide, "DriftItemGood349000Hide")
REGISTER_GOAL_NO_UPDATE(GOAL_DriftItemGood349000_Hide, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_DriftItemGood349000_Hide, true)
function DriftItemGood349000Hide_Activate(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3001, TARGET_ENE_0, DIST_None, 0)
    local life_time = goal:GetLife()
    goal:AddSubGoal(GOAL_COMMON_Wait, life_time, TARGET_ENE_0)
    ai:SetNumber(0, 1)
    return 
end

function DriftItemGood349000Hide_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function DriftItemGood349000Hide_Terminate(ai, goal)
    return 
end

function DriftItemGood349000Hide_Interupt(ai, goal)
    return false
end

return 
