

REGISTER_GOAL(GOAL_COMMON_ComboAttack_SuccessAngle180, "ComboAttack180")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttack_SuccessAngle180, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttack_SuccessAngle180, 1, "çUåÇëŒè€", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttack_SuccessAngle180, 2, "ê¨å˜ãóó£", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttack_SuccessAngle180, 3, "è„çUåÇäpìx", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttack_SuccessAngle180, 4, "â∫çUåÇäpìx", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_ComboAttack_SuccessAngle180, 1)
function ComboAttack180_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = 1.5
    local turnFaceAngle = 20
    local isComboAttack = true
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(3)
    local angleDownAtt = goal:GetParam(4)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function ComboAttack180_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ComboAttack180_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ComboAttack_SuccessAngle180, true)
function ComboAttack180_Interupt(ai, goal)
    return false
end

return 
