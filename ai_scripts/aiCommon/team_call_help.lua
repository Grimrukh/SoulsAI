REGISTER_GOAL(GOAL_COMMON_TeamCallHelp, "TeamCallHelp")
function TeamCallHelp_Activate(ai, goal)
    local callActionId = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__callHelp_CallActionId)
    local target = goal:GetParam(0)
    ai:TeamHelp_ReserveCall()
    ai:TurnTo(target)
    if ai:IsLookToTarget() == true then
        ai:SetAttackRequest(callActionId)
    end
    return 
end

function TeamCallHelp_Update(ai, goal)
    local callActionId = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__callHelp_CallActionId)
    local target = goal:GetParam(0)
    if goal:GetLife() <= 0 then
        return GOAL_RESULT_Success
    elseif ai:IsFinishAttack() then
        return GOAL_RESULT_Success
    elseif ai:IsLookToTarget() == true then
        if ai:IsStartAttack() == false then
            ai:SetAttackRequest(callActionId)
        end
    else
        ai:TurnTo(target)
    end
    return GOAL_RESULT_Continue
end

function TeamCallHelp_Terminate(ai, goal)
    ai:TeamHelp_Call()
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_TeamCallHelp, true)
function TeamCallHelp_Interupt(ai, goal)
    return false
end

return 
