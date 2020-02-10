REGISTER_GOAL(GOAL_COMMON_SpecialTurn, "SpecialTurn")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_SpecialTurn, 0, "EzStateî‘çÜ", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_SpecialTurn, 1, "çUåÇëŒè€ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_SpecialTurn, 2, "ê˘âÒäpìx", 0)
REGISTER_GOAL_UPDATE_TIME(GOAL_COMMON_SpecialTurn, 0, 0)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_SpecialTurn, true)
function SpecialTurn_Activate(ai, goal)
    local behaviorNo = goal:GetParam(0)
    local target = goal:GetParam(1)
    local turnAng = goal:GetParam(2)
    if ai:IsLookToTarget(target, turnAng) then
        goal:SetNumber(0, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, goal:GetLife(), behaviorNo, target, DIST_None, 0, -1)
    end
    return 
end

function SpecialTurn_Update(ai, goal)
    if goal:GetNumber(0) == 1 then
        return GOAL_RESULT_Success
    else
        return GOAL_RESULT_Continue
    end
end

function SpecialTurn_Terminate(ai, goal)
    return 
end

function SpecialTurn_Interupt(ai, goal)
    return false
end

return 
