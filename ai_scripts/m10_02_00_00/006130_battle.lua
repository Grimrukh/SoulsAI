REGISTER_GOAL(GOAL_Magician_of_Pot6130_Battle, "Magician_of_Pot6130Battle")
local PushR_min = 0
local PushR_max = 1
local NormalR2_min = 0
local NormalR2_max = 1.7
local LargeR2_min = 0
local LargeR2_max = 1.8
local Backstep_Atk2_min = 0
local Backstep_Atk2_max = 1
local Magic_min = 7
local Magic_max = 7
local Magic2_min = 7.4
local Magic2_max = 7.4
local Magic3_min = 1.5
local Magic3_max = 1.5
REGISTER_GOAL_NO_UPDATE(GOAL_Magician_of_Pot6130_Battle, 1)
function Magician_of_Pot6130Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local BothHandOff = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local RYOUTE_odds = 1
    local KATATE_odds = 1
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        RYOUTE_odds = 10
    end
    local MagicValue1 = 1
    local Magic1Limit = ai:GetNumber(0)
    if 6 <= Magic1Limit then
        MagicValue1 = 0
    end
    local MagicValue2 = 1
    local Magic2Limit = ai:GetNumber(1)
    if 6 <= Magic2Limit then
        MagicValue2 = 0
    end
    local MagicValue3 = 1
    local Magic3Limit = ai:GetNumber(2)
    if 8 <= Magic3Limit then
        MagicValue3 = 0
    end
    local GuardTaiou = 0
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        GuardTaiou = 1
    end
    if 4 <= targetDist then
        actPerArr[3] = 5
        actPerArr[4] = 5
        actPerArr[18] = 45 * MagicValue1
        actPerArr[19] = 45 * MagicValue2
        actPerArr[20] = 0 * MagicValue3
    elseif 1 <= targetDist then
        actPerArr[3] = 19
        actPerArr[4] = 19
        actPerArr[16] = 5
        actPerArr[17] = 0 * GuardTaiou
        actPerArr[18] = 19 * MagicValue1
        actPerArr[19] = 19 * MagicValue2
        actPerArr[20] = 19 * MagicValue3
    else
        actPerArr[3] = 20
        actPerArr[4] = 20
        actPerArr[6] = 10
        actPerArr[16] = 5
        actPerArr[17] = 10 * GuardTaiou
        actPerArr[18] = 15 * MagicValue1
        actPerArr[19] = 15 * MagicValue2
        actPerArr[20] = 15 * MagicValue3
    end
    actFuncArr[3] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act04)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act06)
    actFuncArr[16] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act16)
    actFuncArr[17] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act17)
    actFuncArr[18] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act18)
    actFuncArr[19] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act19)
    actFuncArr[20] = REGIST_FUNC(ai, goal, Magician_of_Pot6130_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Magician_of_Pot6130_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

PushR_min = NormalR2_max
function Magician_of_Pot6130_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    local approachDist = NormalR2_max
    local dashDist = NormalR2_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

PushR_min = LargeR2_max
function Magician_of_Pot6130_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    local approachDist = LargeR2_max
    local dashDist = LargeR2_max + 5
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
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

PushR_min = Backstep_Atk2_max
function Magician_of_Pot6130_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    local approachDist = Backstep_Atk2_max
    local dashDist = Backstep_Atk2_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Magician_of_Pot6130_Act16(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
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

PushR_min = PushR_max
function Magician_of_Pot6130_Act17(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = PushR_max
    local dashDist = PushR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

PushR_min = Magic_max
PushR_min = Magic_min
function Magician_of_Pot6130_Act18(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic1Limit = ai:GetNumber(0)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(0)
    if Magic_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic_max, TARGET_SELF, false, 4)
    elseif targetDist <= Magic_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic_min, TARGET_ENE_0, false, 4)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(0, Magic1Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

PushR_min = Magic_max
PushR_min = Magic2_max
PushR_min = Magic_min
PushR_min = Magic2_min
function Magician_of_Pot6130_Act19(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic2Limit = ai:GetNumber(1)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(1)
    if Magic_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic2_max, TARGET_SELF, false, 4)
    elseif targetDist <= Magic_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic2_min, TARGET_ENE_0, false, 4)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(1, Magic2Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

PushR_min = Magic3_max
function Magician_of_Pot6130_Act20(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic3Limit = ai:GetNumber(2)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    ai:ChangeEquipMagic(2)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Magic3_max, TARGET_SELF, false, 4)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(2, Magic3Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Magician_of_Pot6130_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local MoveDist = 3
    if fate <= 5 then
        if fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        elseif fate2 <= 75 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 2)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 2)
        end
    elseif fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
    elseif fate <= 15 then
        if fate2 <= 70 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, ai:GetRandam_Float(2.5, 3.5), TARGET_ENE_0, true, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 6, TARGET_ENE_0, ai:GetRandam_Float(1.5, 3), TARGET_ENE_0, true, 4)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 4)
        end
    end
    return 
end

function Magician_of_Pot6130Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Magician_of_Pot6130Battle_Terminate(ai, goal)
    return 
end

function Magician_of_Pot6130Battle_Interupt(ai, goal)
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
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
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
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
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
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            return true
        end
    end
    return false
end

return 
