REGISTER_GOAL(GOAL_COMMON_ComboAttackTunableSpin, "ComboAttackTunableSpin")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 1, "�U���Ώ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 2, "��������", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 3, "�U���O���񎞊ԁy�b�z", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 4, "���ʔ���p�x�y�x�z", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 5, "��U���p�x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_ComboAttackTunableSpin, 6, "���U���p�x", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_ComboAttackTunableSpin, 1)
function ComboAttackTunableSpin_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 90
    local turnTime = goal:GetParam(3)
    local turnFaceAngle = goal:GetParam(4)
    if turnTime < 0 then
        turnTime = 1.5
    end
    if turnFaceAngle < 0 then
        turnFaceAngle = 20
    end
    local isComboAttack = true
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(5)
    local angleDownAtt = goal:GetParam(6)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function ComboAttackTunableSpin_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ComboAttackTunableSpin_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_ComboAttackTunableSpin, true)
function ComboAttackTunableSpin_Interupt(ai, goal)
    return false
end

return 
