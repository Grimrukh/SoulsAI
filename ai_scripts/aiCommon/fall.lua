REGISTER_GOAL(GOAL_COMMON_Fall, "Fall")
REGISTER_GOAL_UPDATE_TIME(GOAL_COMMON_Fall, 0.1, 0.2)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_Fall, true)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Fall, 0, "ターゲット【Type】", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Fall, 1, "落下開始EzState番号", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Fall, 2, "落下停止EzState番号", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Fall, 3, "落下停止マージン[m]", 0)
function Fall_Activate(ai, goal)
    local target = goal:GetParam(0)
    local ezFallID = goal:GetParam(1)
    local height_dist = ai:GetDistYSigned(target)
    if height_dist <= 0 then
        ai:SetAttackRequest(ezFallID)
    end
    return 
end

function Fall_Update(ai, goal)
    local target = goal:GetParam(0)
    local ezFallID = goal:GetParam(1)
    local margin = goal:GetParam(3)
    local height_dist = ai:GetDistYSigned(target)
    if margin < height_dist then
        return GOAL_RESULT_Success
    end
    ai:SetAttackRequest(ezFallID)
end

function Fall_Terminate(ai, goal)
    local ezStopID = goal:GetParam(2)
    ai:SetAttackRequest(ezStopID)
    return 
end

function Fall_Interupt(ai, goal)
    return false
end

return 
