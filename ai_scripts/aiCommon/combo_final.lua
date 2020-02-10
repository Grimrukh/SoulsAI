REGISTER_GOAL(GOAL_COMMON_ComboFinal, "ComboFinal")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboFinal, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboFinal, 1, "çUåÇëŒè€", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboFinal, 2, "ê¨å˜ãóó£", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboFinal, 3, "è„çUåÇäpìx", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboFinal, 4, "â∫çUåÇäpìx", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_ComboFinal, 1)
ENABLE_COMBO_ATK_CANCEL(GOAL_COMMON_ComboFinal)
function ComboFinal_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = 0
    local turnFaceAngle = 90
    local isComboAttack = false
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(3)
    local angleDownAtt = goal:GetParam(4)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function ComboFinal_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ComboFinal_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ComboFinal, true)
function ComboFinal_Interupt(ai, goal)
    return false
end

return 
