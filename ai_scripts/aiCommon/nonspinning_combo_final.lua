REGISTER_GOAL(GOAL_COMMON_NonspinningComboFinal, "NonspinningComboFinal")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningComboFinal, 0, "EzState�ԍ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningComboFinal, 1, "�U���ΏہyType�z", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningComboFinal, 2, "���������yType�z", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningComboFinal, 3, "��U���p�x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_NonspinningComboFinal, 4, "���U���p�x", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_NonspinningComboFinal, 1)
ENABLE_COMBO_ATK_CANCEL(GOAL_COMMON_NonspinningComboFinal)
function NonspinningComboFinal_Activate(ai, goal)
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

function NonspinningComboFinal_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function NonspinningComboFinal_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_NonspinningComboFinal, true)
function NonspinningComboFinal_Interupt(ai, goal)
    return false
end

return 
