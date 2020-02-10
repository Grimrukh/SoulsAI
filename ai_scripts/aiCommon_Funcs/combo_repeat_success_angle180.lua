REGISTER_GOAL(GOAL_COMMON_ComboRepeat_SuccessAngle180, "ComboRepeat_SuccessAngle180")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboRepeat_SuccessAngle180, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboRepeat_SuccessAngle180, 1, "�U���Ώ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboRepeat_SuccessAngle180, 2, "��������", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboRepeat_SuccessAngle180, 3, "��U���p�x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboRepeat_SuccessAngle180, 4, "���U���p�x", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_ComboRepeat_SuccessAngle180, 1)
ENABLE_COMBO_ATK_CANCEL(GOAL_COMMON_ComboRepeat_SuccessAngle180)
function ComboRepeat_SuccessAngle180_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = 0
    local turnFaceAngle = 90
    local isComboAttack = true
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(3)
    local angleDownAtt = goal:GetParam(4)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function ComboRepeat_SuccessAngle180_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ComboRepeat_SuccessAngle180_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ComboRepeat_SuccessAngle180, true)
function ComboRepeat_SuccessAngle180_Interupt(ai, goal)
    return false
end

return 
