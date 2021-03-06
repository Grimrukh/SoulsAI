REGISTER_GOAL(GOAL_Ingward6180_Battle, "Ingward6180Battle")
local PushR_min = 0
local PushR_max = 1
local NormalR2_min = 0
local NormalR2_max = 1
local LargeR2_min = 0
local LargeR2_max = 1.1
local Backstep_Atk2_min = 0
local Backstep_Atk2_max = 1
local Magic_min = 7
local Magic_max = 7
local Magic2_min = 7
local Magic2_max = 7
local Magic3_min = 8
local Magic3_max = 8
REGISTER_GOAL_NO_UPDATE(GOAL_Ingward6180_Battle, 1)
function Ingward6180Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local RYOUTE_odds = 1
    local KATATE_odds = 1
    local MagicValue1 = 1
    local Magic1Limit = ai:GetNumber(0)
    if 20 <= Magic1Limit then
        MagicValue1 = 0
    end
    local MagicValue2 = 1
    local Magic2Limit = ai:GetNumber(1)
    if 20 <= Magic2Limit then
        MagicValue2 = 0
    end
    local MagicValue3 = 1
    local Magic3Limit = ai:GetNumber(2)
    if 5 <= Magic3Limit then
        MagicValue3 = 0
    end
    local GuardTaiou = 0
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        GuardTaiou = 1
    end
    local hprate = ai:GetHpRate(TARGET_SELF)
    local Kaifuku = 0
    if (not not ai:HasSpecialEffectAttribute(TARGET_SELF, SP_EFFECT_TYPE_POIZON) or not not ai:HasSpecialEffectAttribute(TARGET_SELF, SP_EFFECT_TYPE_ILLNESS) or ai:HasSpecialEffectAttribute(TARGET_SELF, SP_EFFECT_TYPE_BLOOD)) and ai:IsFinishTimer(3) == true then
        Kaifuku = 1
    end
    if 7 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[18] = 45 * MagicValue1
        actPerArr[19] = 45 * MagicValue2
        actPerArr[20] = 10000 * MagicValue3 * Kaifuku
    elseif 1.1 <= targetDist then
        actPerArr[1] = 7
        actPerArr[2] = 8
        actPerArr[17] = 15
        actPerArr[18] = 35 * MagicValue1
        actPerArr[19] = 35 * MagicValue2
        actPerArr[20] = 10000 * MagicValue3 * Kaifuku
    else
        actPerArr[1] = 35
        actPerArr[2] = 35
        actPerArr[17] = 20
        actPerArr[18] = 5 * MagicValue1
        actPerArr[19] = 5 * MagicValue2
        actPerArr[20] = 10000 * MagicValue3 * Kaifuku
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Ingward6180_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Ingward6180_Act02)
    actFuncArr[17] = REGIST_FUNC(ai, goal, Ingward6180_Act17)
    actFuncArr[18] = REGIST_FUNC(ai, goal, Ingward6180_Act18)
    actFuncArr[19] = REGIST_FUNC(ai, goal, Ingward6180_Act19)
    actFuncArr[20] = REGIST_FUNC(ai, goal, Ingward6180_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Ingward6180_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

PushR_min = NormalR2_max
function Ingward6180_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = NormalR2_max
    local dashDist = NormalR2_max + 5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalL, TARGET_ENE_0, DIST_Middle, 0, -1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

PushR_min = LargeR2_max
function Ingward6180_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = LargeR2_max
    local dashDist = LargeR2_max + 5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 0, -1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ingward6180_Act17(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if 7 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(2, 2.5), TARGET_SELF, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(1.5, 2), TARGET_ENE_0, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, -1)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

PushR_min = Magic_max
PushR_min = Magic_min
function Ingward6180_Act18(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic1Limit = ai:GetNumber(0)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(0)
    if Magic_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic_max, TARGET_SELF, false, -1)
    elseif targetDist <= Magic_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic_min, TARGET_ENE_0, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(0, Magic1Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

PushR_min = Magic2_max
PushR_min = Magic2_min
function Ingward6180_Act19(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic2Limit = ai:GetNumber(1)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(1)
    if Magic2_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic2_max, TARGET_SELF, false, -1)
    elseif targetDist <= Magic2_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic2_min, TARGET_ENE_0, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(1, Magic2Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

PushR_min = Magic3_max
PushR_min = Magic3_min
function Ingward6180_Act20(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic3Limit = ai:GetNumber(2)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(2)
    if Magic3_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic3_max, TARGET_SELF, false, -1)
    elseif targetDist <= Magic3_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic3_min, TARGET_ENE_0, false, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(2, Magic3Limit + 1)
    ai:SetTimer(3, 5)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Ingward6180_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate <= 80 then
        if fate2 <= 70 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, -1)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
        end
    end
    return 
end

function Ingward6180Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Ingward6180Battle_Terminate(ai, goal)
    return 
end

function Ingward6180Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_FindAttack) then
        local FindATKDist = 3
        local FindATKPer = 10
        local MoveDist = 3
        if targetDist <= FindATKDist and fate <= FindATKPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        local combRunDist = 3
        local combRunPer = 10
        if targetDist < combRunDist and fate <= combRunPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
        end
    end
    if ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) then
        local ResDist = 3
        local ResPer = 10
        if targetDist < ResDist then
            if fate <= ResPer then
                goal:ClearSubGoal()
                if fate2 <= ResPer then
                    if fate3 <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 4)
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
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            return true
        end
    end
    return false
end

return 
