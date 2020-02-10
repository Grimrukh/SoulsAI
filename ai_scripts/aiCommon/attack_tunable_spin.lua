REGISTER_GOAL(GOAL_COMMON_AttackTunableSpin, "AttackTunableSpin")
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 0, "EzStateID", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 1, "�U���Ώ�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 2, "��������", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 3, "�U���O���񎞊�", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 4, "���ʔ���p�x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 5, "��U���p�x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_AttackTunableSpin, 6, "���U���p�x", 0)
REGISTER_GOAL_NO_UPDATE(GOAL_COMMON_AttackTunableSpin, 1)
function AttackTunableSpin_Activate(ai, goal)
    local life = goal:GetLife()
    local behaviorNo = goal:GetParam(0)
    local attackTarget = goal:GetParam(1)
    local distType = goal:GetParam(2)
    local successAngle = 180
    local turnTime = goal:GetParam(3)
    local turnFaceAngle = goal:GetParam(4)
    if turnTime < 0 then
        turnTime = 1.5
    end
    if turnFaceAngle < 0 then
        turnFaceAngle = 20
    end
    local isComboAttack = false
    local isMoveCancel = true
    local isGaurdBreakAtk = false
    local isTurn = false
    local angleUpAtt = goal:GetParam(5)
    local angleDownAtt = goal:GetParam(6)
    goal:AddSubGoal(GOAL_COMMON_CommonAttack, life, behaviorNo, attackTarget, distType, successAngle, turnTime, turnFaceAngle, isComboAttack, isMoveCancel, isGaurdBreakAtk, isTurn, angleUpAtt, angleDownAtt)
    return 
end

function AttackTunableSpin_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function AttackTunableSpin_Terminate(ai, goal)
    return 
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_AttackTunableSpin, true)
function AttackTunableSpin_Interupt(ai, goal)
    return false
end

return 
