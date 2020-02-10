REGISTER_GOAL(GOAL_COMMON_ApproachTarget, "ApproachTarget")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachTarget, 0, "à⁄ìÆëŒè€", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachTarget, 1, "ìûíBîªíËãóó£", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachTarget, 2, "ê˘âÒëŒè€", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachTarget, 3, "ï‡Ç≠?", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachTarget, 4, "ÉKÅ[ÉhEzStateî‘çÜ", 0)
REGISTER_GOAL_UPDATE_TIME(GOAL_COMMON_ApproachTarget, 0, 0)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ApproachTarget, true)
function ApproachTarget_Activate(ai, goal)
    local life_time = goal:GetLife()
    local targetType = goal:GetParam(0)
    local range = goal:GetParam(1)
    local turnTarget = goal:GetParam(2)
    local bWalk = goal:GetParam(3)
    local guardActionId = goal:GetParam(4)
    local moveTargetType = AI_DIR_TYPE_CENTER
    local distDir = 0
    local resultTypeIfGuardSuccess = goal:GetParam(5)
    local isLifeSuccessGuard = goal:GetParam(6)
    goal:AddSubGoal(GOAL_COMMON_MoveToSomewhere, life_time, targetType, moveTargetType, range, turnTarget, bWalk, moveTargetType, distDir)
    if 0 < guardActionId then
        local targetDist = ai:GetDist(targetType)
        if range < targetDist then
            ai:DoEzAction(life_time, guardActionId)
        end
    end
    return 
end

function ApproachTarget_Update(ai, goal, dT)
    local guardActionId = goal:GetParam(4)
    if 0 < guardActionId then
        if ai:IsInterupt(INTERUPT_Damaged) then
            return GOAL_RESULT_Failed
        elseif ai:IsInterupt(INTERUPT_SuccessGuard) then
            local resultTypeIfGuardSuccess = goal:GetParam(5)
            if resultTypeIfGuardSuccess ~= GOAL_RESULT_Continue then
                return resultTypeIfGuardSuccess
            end
        end
    end
    if goal:GetLife() <= 0 then
        local isLifeSuccessGuard = goal:GetParam(6)
        if isLifeSuccessGuard then
            return GOAL_RESULT_Success
        else
            return GOAL_RESULT_Failed
        end
    else
        return GOAL_RESULT_Continue
    end
end

function ApproachTarget_Terminate(ai, goal)
    return 
end

function ApproachTarget_Interupt(ai, goal)
    return false
end

return 
