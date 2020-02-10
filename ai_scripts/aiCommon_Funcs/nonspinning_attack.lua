REGISTER_GOAL(GOAL_COMMON_NonspinningAttack, "NonspinningAttack")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningAttack, 0, "EzStateî‘çÜ", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningAttack, 1, "çUåÇëŒè€ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningAttack, 2, "ê¨å˜ãóó£ÅyTypeÅz", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningAttack, 3, "è„çUåÇäpìx", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningAttack, 4, "â∫çUåÇäpìx", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_NonspinningAttack, 1)
function NonspinningAttack_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = 0
    local turnFaceAngle = 180
    local isComboAttack = false
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = true
    local angleUpAtt = goal:GetParam(3)
    local angleDownAtt = goal:GetParam(4)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function NonspinningAttack_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function NonspinningAttack_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_NonspinningAttack, true)
function NonspinningAttack_Interupt(ai, goal)
    return false
end

return 
