REGISTER_GOAL(GOAL_COMMON_ApproachSettingDirection, "ApproachSettingDirection")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 0, "�ړ��Ώ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 1, "���B���苗��", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 2, "����Ώ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 3, "����?", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 4, "�K�[�hEzState�ԍ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 5, "�ړ�����", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ApproachSettingDirection, 6, "�w������ւ̋���", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_ApproachSettingDirection, true)
REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ApproachSettingDirection, true)
function ApproachSettingDirection_Activate(ai, goal)
    local life_time = goal:GetLife()
    local targetType = goal:GetParam(0)
    local range = goal:GetParam(1)
    local turnTarget = goal:GetParam(2)
    local bWalk = goal:GetParam(3)
    local guardActionId = goal:GetParam(4)
    local moveTargetType = goal:GetParam(5)
    local distDir = goal:GetParam(6)
    goal:AddSubGoal(GOAL_COMMON_MoveToSomewhere, life_time, targetType, moveTargetType, range, turnTarget, bWalk, moveTargetType, distDir)
    if 0 < guardActionId then
        local targetDist = ai:GetDist(targetType)
        if range < targetDist then
            ai:DoEzAction(life_time, guardActionId)
        end
    end
    return 
end

function ApproachSettingDirection_Update(ai, goal, dT)
    return 
end

function ApproachSettingDirection_Terminate(ai, goal)
    return 
end

function ApproachSettingDirection_Interupt(ai, goal)
    return false
end

return 
