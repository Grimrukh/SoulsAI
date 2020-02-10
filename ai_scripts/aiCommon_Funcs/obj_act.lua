REGISTER_GOAL(GOAL_COMMON_ObjActTest, "ObjActTest")
REGISTER_GOAL_UPDATE_TIME(GOAL_COMMON_ObjActTest, 0.5, 0.6)
function ObjActTest_Activate(ai, goal)
    local priority = goal:GetParam(0)
    local objActType = goal:GetParam(1)
    ai:KickEvent(0)
    return 
end

function ObjActTest_Update(ai, goal)
    if ai:IsFinishObjAct() then
        return GOAL_RESULT_Success
    elseif goal:GetLife() <= 0 then
        return GOAL_RESULT_Failed
    elseif not ai:IsExistReqObjAct() then
        goal:SetNumber(0, 1)
        return GOAL_RESULT_Failed
    else
        return GOAL_RESULT_Continue
    end
end

function ObjActTest_Terminate(ai, goal)
    ai:ClearFinishObjAct()
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ObjActTest, true)
function ObjActTest_Interupt(ai, goal)
    return false
end

return 
