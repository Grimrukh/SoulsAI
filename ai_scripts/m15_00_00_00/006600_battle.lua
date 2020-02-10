REGISTER_GOAL(GOAL_Licarl6600_Battle, "Licarl6600Battle")
local NormalR_min = 0
local NormalR_max = 1.1
local Bow_min = 8
local Bow_max = 20
local LargeR_min = 0
local LargeR_max = 2
local PushR_min = 0
local PushR_max = 1
local NPC_ATK_Parry_min = 0
local NPC_ATK_Parry_max = 0.8
local Backstep_Atk_min = 0
local Backstep_Atk_max = 1.5
local Rolling_Atk_min = 3.5
local Rolling_Atk_max = 4.5
REGISTER_GOAL_NO_UPDATE(GOAL_Licarl6600_Battle, 1)
function Licarl6600Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local targetDistY = ai:GetDistYSigned(TARGET_ENE_0)
    local Jyaku = 1
    if targetDistY <= -0.4 then
        Jyaku = 0
    end
    if R_Wep == WEP_CATE_Bow then
        if 10 <= targetDist then
            actPerArr[2] = 100
        elseif 2.8 <= targetDist then
            actPerArr[2] = 10
            actPerArr[9] = 90
        else
            actPerArr[1] = 20 * Jyaku
            actPerArr[3] = 35
            actPerArr[4] = 0
            actPerArr[5] = 20 * Jyaku
            actPerArr[6] = 15
            actPerArr[7] = 0
            actPerArr[8] = 0
            actPerArr[9] = 10
        end
    elseif 7.5 <= targetDist then
        actPerArr[2] = 100
    elseif 5.2 <= targetDist then
        actPerArr[1] = 15 * Jyaku
        actPerArr[3] = 25
        actPerArr[4] = 15
        actPerArr[5] = 0
        actPerArr[6] = 15
        actPerArr[7] = 0
        actPerArr[8] = 0
        actPerArr[9] = 20
    elseif 2.8 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 0 * Jyaku
            actPerArr[3] = 0
            actPerArr[4] = 10
            actPerArr[5] = 0
            actPerArr[7] = 10
            actPerArr[11] = 80
        else
            actPerArr[1] = 20 * Jyaku
            actPerArr[3] = 20
            actPerArr[4] = 20
            actPerArr[5] = 20 * Jyaku
            actPerArr[7] = 20
            actPerArr[9] = 0
            actPerArr[11] = 0
        end
    elseif 1 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 0 * Jyaku
            actPerArr[3] = 25
            actPerArr[4] = 25
            actPerArr[5] = 0
            actPerArr[7] = 10
            actPerArr[9] = 0
            actPerArr[11] = 40
        else
            actPerArr[1] = 30 * Jyaku
            actPerArr[3] = 30
            actPerArr[4] = 10
            actPerArr[5] = 20 * Jyaku
            actPerArr[7] = 10
            actPerArr[9] = 0
            actPerArr[11] = 0
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[1] = 0 * Jyaku
        actPerArr[3] = 25
        actPerArr[4] = 25
        actPerArr[5] = 0
        actPerArr[7] = 10
        actPerArr[8] = 10
        actPerArr[9] = 0
        actPerArr[11] = 30
    else
        actPerArr[1] = 30 * Jyaku
        actPerArr[3] = 30
        actPerArr[4] = 10
        actPerArr[5] = 10 * Jyaku
        actPerArr[7] = 20
        actPerArr[8] = 10
        actPerArr[9] = 0
        actPerArr[11] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Licarl6600_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Licarl6600_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Licarl6600_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Licarl6600_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Licarl6600_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Licarl6600_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, Licarl6600_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, Licarl6600_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, Licarl6600_Act09)
    actFuncArr[11] = REGIST_FUNC(ai, goal, Licarl6600_Act11)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Licarl6600_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

NormalR_min = NormalR_max
function Licarl6600_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Licarl6600_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Far, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = LargeR_max
function Licarl6600_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = LargeR_max
    local dashDist = LargeR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        GetWellSpace_Odds = 100
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 0, -1)
        GetWellSpace_Odds = 100
    end
    return GetWellSpace_Odds
end

NormalR_min = PushR_max
function Licarl6600_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local approachDist = PushR_max
    local dashDist = PushR_max + 5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
function Licarl6600_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_Atk_max
function Licarl6600_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = Rolling_Atk_max
    local dashDist = Rolling_Atk_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Licarl6600_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    if 3 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(2, 2.5), TARGET_SELF, true, 4)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(1.5, 2), TARGET_ENE_0, true, 4)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Licarl6600_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Licarl6600_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local FirstAttID = NPC_ATK_NormalR
    local ComAttID = NPC_ATK_NormalR
    local ShootNum = ai:GetRandam_Int(1, 3)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, 10, TARGET_ENE_0, false, 4)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Far, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = LargeR_max
function Licarl6600_Act11(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, LargeR_max, TARGET_SELF, false, 4)
    goal:AddSubGoal(GOAL_COMMON_TurnAround, 3, TARGET_ENE_0, AI_DIR_TYPE_B, 10, false, true, 4)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = Backstep_Atk_max
function Licarl6600_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local MoveDist = 3
    if fate <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Backstep_Atk_max, TARGET_SELF, false, -1)
    elseif fate <= 55 then
        if fate2 <= 70 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, ai:GetRandam_Float(2.5, 3.5), TARGET_ENE_0, true, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 6, TARGET_ENE_0, ai:GetRandam_Float(1.5, 3), TARGET_ENE_0, true, 4)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 4)
        end
    end
    return 
end

function Licarl6600Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Licarl6600Battle_Terminate(ai, goal)
    return 
end

function Licarl6600Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local ParryDist = 2
    local ParryAng = 60
    local ParryThrowDist = 4
    local ParryThrowAng = 60
    if ai:IsInterupt(INTERUPT_SuccessGuard) then
        local Suc_GuardDist = 3
        local Suc_GuardPer = 40
        if targetDist <= Suc_GuardDist and fate <= Suc_GuardPer then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_None, 0, -1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        local combRunDist = 3
        local combRunPer = 40
        if targetDist < combRunDist then
            if fate <= combRunPer then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) then
        local ResDist = 3
        local ResPer = 30
        if targetDist < ResDist then
            if fate <= ResPer then
                goal:ClearSubGoal()
                if fate2 <= ResPer then
                    if fate3 <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
                    end
                else
                    ai:Replaning()
                    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
                    return true
                end
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
                ai:Replaning()
                return true
            end
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
            ai:Replaning()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Shoot) then
        local shootIntPer = 50
        if fate <= shootIntPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Shoot) then
        local shootIntPer = 50
        if fate <= shootIntPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        if targetDist <= ParryDist and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, ParryAng) and ai:IsTargetGuard(TARGET_SELF) == true then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Parry, TARGET_ENE_0, DIST_Middle, 1.5, 90)
            return true
        end
    elseif ai:IsInterupt(INTERUPT_SuccessParry) and targetDist <= ParryThrowDist and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, ParryThrowAng) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 1, TARGET_SELF, false, -1)
        local life = ai:GetRandam_Float(0.3, 0.6)
        goal:AddSubGoal(GOAL_COMMON_Wait, life, TARGET_ENE_0)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 0.6, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        return true
    end
    return false
end

return 
