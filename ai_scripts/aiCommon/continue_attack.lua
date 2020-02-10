REGISTER_GOAL(GOAL_COMMON_ContinueAttack, "ContinueAttack")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ContinueAttack, 0, "EzStateî‘çÜ", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ContinueAttack, 1, "çUåÇëŒè€ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ContinueAttack, 2, "ê¨å˜ãóó£ÅyÇçÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ContinueAttack, 3, "ñΩíÜÇµÇΩÇÁê¨å˜ÅH", 0)
function ContinueAttack_Activate(ai, goal)
    local behaviorNo = goal:GetParam(0)
    local target = goal:GetParam(1)
    ai:TurnTo(target)
    ai:SetAttackRequest(behaviorNo)
    goal:AddGoalScopedTeamRecord(COORDINATE_TYPE_Attack, target, 0)
    return 
end

function ContinueAttack_Update(ai, goal)
    local behaviorNo = goal:GetParam(0)
    local target = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successType = goal:GetParam(3)
    local targetDist = ai:GetDist(target)
    if distType <= targetDist then
        return GOAL_RESULT_Failed
    elseif goal:GetLife() <= 0 then
        return GOAL_RESULT_Success
    elseif successType == true and ai:IsHitAttack() == true then
        return GOAL_RESULT_Success
    else
        ai:TurnTo(target)
        ai:SetAttackRequest(behaviorNo)
        return GOAL_RESULT_Continue
    end
end

function ContinueAttack_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ContinueAttack, true)
function ContinueAttack_Interupt(ai, goal)
    return false
end

return 
