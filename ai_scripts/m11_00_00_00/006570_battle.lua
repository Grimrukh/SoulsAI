REGISTER_GOAL(GOAL_YellowMantle6570_Battle, "YellowMantle6570Battle")
local NormalR_min = 0
local NormalR_max = 2.6
local LargeR_min = 0
local LargeR_max = 2.5
local Backstep_Atk_min = 0
local Backstep_Atk_max = 1.8
local PushR_min = 0
local PushR_max = 1
local Magic_min = 7
local Magic_max = 7
local Magic2_min = 4
local Magic2_max = 4
local Magic3_min = 5
local Magic3_max = 5
REGISTER_GOAL_NO_UPDATE(GOAL_YellowMantle6570_Battle, 1)
function YellowMantle6570Battle_Activate(ai, goal)
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
    if 5 <= Magic2Limit then
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
    if 2.5 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[18] = 30 * MagicValue1
        actPerArr[19] = 30 * MagicValue2
        actPerArr[20] = 30 * MagicValue3
    elseif 1 <= targetDist then
        actPerArr[1] = 9
        actPerArr[2] = 9
        actPerArr[18] = 29 * MagicValue1
        actPerArr[19] = 27 * MagicValue2
        actPerArr[20] = 26 * MagicValue3
    else
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[5] = 10
        actPerArr[17] = 10 * GuardTaiou
        actPerArr[18] = 25 * MagicValue1
        actPerArr[19] = 25 * MagicValue2
        actPerArr[20] = 20 * MagicValue3
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, YellowMantle6570_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, YellowMantle6570_Act02)
    actFuncArr[5] = REGIST_FUNC(ai, goal, YellowMantle6570_Act05)
    actFuncArr[17] = REGIST_FUNC(ai, goal, YellowMantle6570_Act17)
    actFuncArr[18] = REGIST_FUNC(ai, goal, YellowMantle6570_Act18)
    actFuncArr[19] = REGIST_FUNC(ai, goal, YellowMantle6570_Act19)
    actFuncArr[20] = REGIST_FUNC(ai, goal, YellowMantle6570_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, YellowMantle6570_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

NormalR_min = NormalR_max
function YellowMantle6570_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 5
    local Odds_Guard = 0
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

NormalR_min = LargeR_max
function YellowMantle6570_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
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
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Backstep_Atk_max
function YellowMantle6570_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = Backstep_Atk_max
    local dashDist = Backstep_Atk_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function YellowMantle6570_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
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

function YellowMantle6570_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Whand_jyaku_max
    local dashDist = Whand_jyaku_max + 5
    local Odds_Guard = 50
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

function YellowMantle6570_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Whand_kyou_max
    local dashDist = Whand_kyou_max + 5
    local Odds_Guard = 50
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

function YellowMantle6570_Act13(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Backstep_AtkW_max
    local dashDist = Backstep_AtkW_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function YellowMantle6570_Act15(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Rolling_AtkW_max
    local dashDist = Rolling_AtkW_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = PushR_max
function YellowMantle6570_Act17(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = PushR_max
    local dashDist = PushR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = Magic_max
NormalR_min = Magic_min
function YellowMantle6570_Act18(ai, goal, paramTbl)
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
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicL, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(0, Magic1Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = Magic2_max
NormalR_min = Magic2_min
function YellowMantle6570_Act19(ai, goal, paramTbl)
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
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicL, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(1, Magic2Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = Magic3_max
NormalR_min = Magic3_min
function YellowMantle6570_Act20(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
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
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicL, TARGET_ENE_0, DIST_None, 1.5, 90)
    ai:SetNumber(2, Magic3Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function YellowMantle6570_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local MoveDist = 3
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
    end
    return 
end

function YellowMantle6570Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function YellowMantle6570Battle_Terminate(ai, goal)
    return 
end

function YellowMantle6570Battle_Interupt(ai, goal)
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
