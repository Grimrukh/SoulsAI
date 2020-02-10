REGISTER_GOAL(GOAL_COMMON_Attack, "Attack")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Attack, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Attack, 1, "çUåÇëŒè€", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Attack, 2, "ê¨å˜ãóó£", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Attack, 3, "è„çUåÇäpìx", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_Attack, 4, "â∫çUåÇäpìx", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_Attack, 1)
function Attack_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = 1.5
    local turnFaceAngle = 20
    local isComboAttack = false
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(3)
    local angleDownAtt = goal:GetParam(4)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function Attack_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Attack_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_Attack, true)
function Attack_Interupt(ai, goal)
    return false
end

return 
