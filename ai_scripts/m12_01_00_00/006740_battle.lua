REGISTER_GOAL(GOAL_Kiaran6740_Battle, "Kiaran6740Battle")
local NormalR_min = 0
local NormalR_max = 1.2
local LargeR_min = 0
local LargeR_max = 1.8
local NormalL_min = 0
local NormalL_max = 2
local LargeL_min = 0
local LargeL_max = 1.6
local PushR_min = 0
local PushR_max = 1
local Backstep_Atk_min = 0
local Backstep_Atk_max = 1.5
local Rolling_Atk_min = 3
local Rolling_Atk_max = 5
local UseItem_min = 3
local UseItem_max = 10
REGISTER_GOAL_NO_UPDATE(GOAL_Kiaran6740_Battle, 1)
function OnIf_6740(ai, goal, codeNo)
    if codeNo == 0 then
        Kiaran6740_ActAfter(ai, goal)
    end
    return 
end

function Kiaran6740Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    CommonNPC_UsePrimaryRightHand(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[2] = 10
            actPerArr[3] = 5
            actPerArr[8] = 0
            actPerArr[9] = 5
            actPerArr[10] = 10
            actPerArr[11] = 10
            actPerArr[13] = 10
            actPerArr[14] = 0
            actPerArr[15] = 0
            actPerArr[16] = 30
            actPerArr[17] = 0
            actPerArr[20] = 20
        else
            actPerArr[1] = 10
            actPerArr[2] = 10
            actPerArr[3] = 10
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 30
            actPerArr[7] = 0
            actPerArr[8] = 0
            actPerArr[9] = 10
            actPerArr[10] = 10
            actPerArr[20] = 20
        end
    elseif 5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[2] = 5
            actPerArr[3] = 5
            actPerArr[8] = 0
            actPerArr[9] = 10
            actPerArr[10] = 10
            actPerArr[11] = 10
            actPerArr[13] = 5
            actPerArr[14] = 0
            actPerArr[15] = 0
            actPerArr[16] = 25
            actPerArr[17] = 0
            actPerArr[20] = 30
        else
            actPerArr[1] = 10
            actPerArr[2] = 10
            actPerArr[3] = 10
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 20
            actPerArr[7] = 0
            actPerArr[8] = 0
            actPerArr[9] = 10
            actPerArr[10] = 10
            actPerArr[20] = 30
        end
    elseif 2.8 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[2] = 10
            actPerArr[3] = 10
            actPerArr[8] = 5
            actPerArr[9] = 0
            actPerArr[10] = 10
            actPerArr[11] = 10
            actPerArr[13] = 10
            actPerArr[14] = 0
            actPerArr[15] = 10
            actPerArr[16] = 10
            actPerArr[17] = 5
            actPerArr[20] = 20
        else
            actPerArr[1] = 10
            actPerArr[2] = 15
            actPerArr[3] = 10
            actPerArr[4] = 0
            actPerArr[5] = 10
            actPerArr[6] = 10
            actPerArr[7] = 5
            actPerArr[8] = 5
            actPerArr[9] = 5
            actPerArr[10] = 10
            actPerArr[11] = 5
            actPerArr[13] = 5
            actPerArr[20] = 10
        end
    elseif 1 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[2] = 10
            actPerArr[3] = 10
            actPerArr[8] = 5
            actPerArr[9] = 0
            actPerArr[10] = 5
            actPerArr[11] = 15
            actPerArr[13] = 15
            actPerArr[14] = 15
            actPerArr[15] = 5
            actPerArr[16] = 5
            actPerArr[17] = 10
            actPerArr[20] = 0
        else
            actPerArr[1] = 5
            actPerArr[2] = 15
            actPerArr[3] = 10
            actPerArr[4] = 10
            actPerArr[5] = 10
            actPerArr[6] = 10
            actPerArr[7] = 10
            actPerArr[8] = 10
            actPerArr[9] = 0
            actPerArr[10] = 10
            actPerArr[20] = 0
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[8] = 5
        actPerArr[9] = 0
        actPerArr[10] = 10
        actPerArr[11] = 10
        actPerArr[13] = 15
        actPerArr[14] = 15
        actPerArr[15] = 20
        actPerArr[16] = 0
        actPerArr[17] = 5
        actPerArr[20] = 0
    else
        actPerArr[1] = 10
        actPerArr[2] = 15
        actPerArr[3] = 15
        actPerArr[4] = 15
        actPerArr[5] = 10
        actPerArr[6] = 5
        actPerArr[7] = 10
        actPerArr[8] = 10
        actPerArr[9] = 0
        actPerArr[10] = 10
        actPerArr[20] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Kiaran6740_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Kiaran6740_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Kiaran6740_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Kiaran6740_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Kiaran6740_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Kiaran6740_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, Kiaran6740_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, Kiaran6740_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, Kiaran6740_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, Kiaran6740_Act10)
    actFuncArr[11] = REGIST_FUNC(ai, goal, Kiaran6740_Act11)
    actFuncArr[13] = REGIST_FUNC(ai, goal, Kiaran6740_Act13)
    actFuncArr[14] = REGIST_FUNC(ai, goal, Kiaran6740_Act14)
    actFuncArr[15] = REGIST_FUNC(ai, goal, Kiaran6740_Act15)
    actFuncArr[16] = REGIST_FUNC(ai, goal, Kiaran6740_Act16)
    actFuncArr[17] = REGIST_FUNC(ai, goal, Kiaran6740_Act17)
    actFuncArr[20] = REGIST_FUNC(ai, goal, Kiaran6740_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Kiaran6740_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

NormalR_min = NormalR_max
function Kiaran6740_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.4, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 55 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NomalL, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalL_max
function Kiaran6740_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = NormalL_max
    local dashDist = NormalL_max + 2
    local AttDist = NormalL_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 1.5, 90)
    elseif fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = LargeL_max
function Kiaran6740_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = LargeL_max
    local dashDist = LargeL_max + 2
    local AttDist = LargeL_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 1.5, 90)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = PushR_max
function Kiaran6740_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = PushR_max
    local dashDist = PushR_max + 2
    local AttDist = PushR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 65 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
NormalR_min = UseItem_min
function Kiaran6740_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        if UseItem_min <= targetDist then
            if not ai:HasSpecialEffectId(TARGET_ENE_0, 3151) and ai:GetNumber(1) <= 99 then
                ai:ChangeEquipItem(1)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(1) + 1)
            elseif ai:GetNumber(0) <= 99 then
                ai:ChangeEquipItem(0)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(0) + 1)
            end
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_Atk_max
function Kiaran6740_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = Rolling_Atk_max
    local dashDist = Rolling_Atk_max + 2
    local AttDist = Rolling_Atk_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 35 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 65 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
NormalR_min = UseItem_min
function Kiaran6740_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalL, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_Parry, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        if ai:GetNumber(0) <= 99 and UseItem_min <= targetDist then
            ai:ChangeEquipItem(0)
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 90, 90)
            ai:SetNumber(0, ai:GetNumber(0) + 1)
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Kiaran6740_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kiaran6740_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if 6 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 6, TARGET_ENE_0, ai:GetRandam_Float(5, 6), TARGET_SELF, false, -1)
    elseif targetDist <= 4 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 6, TARGET_ENE_0, ai:GetRandam_Float(5, 6), TARGET_ENE_0, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(2.5, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = LargeR_max
function Kiaran6740_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateOneHandedMode(ai, goal)
    local approachDist = LargeR_max
    local dashDist = LargeR_max + 2
    local AttDist = LargeR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 1.5, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
function Kiaran6740_Act11(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 25 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = LargeL_max
function Kiaran6740_Act13(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = LargeL_max
    local dashDist = LargeL_max + 2
    local AttDist = LargeL_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = PushR_max
function Kiaran6740_Act14(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = PushR_max
    local dashDist = PushR_max + 2
    local AttDist = PushR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_PushR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
NormalR_min = UseItem_min
function Kiaran6740_Act15(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        if UseItem_min <= targetDist then
            if not ai:HasSpecialEffectId(TARGET_ENE_0, 3151) and ai:GetNumber(1) <= 99 then
                ai:ChangeEquipItem(1)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(1) + 1)
            elseif ai:GetNumber(0) <= 99 then
                ai:ChangeEquipItem(0)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(0) + 1)
            end
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_Atk_max
function Kiaran6740_Act16(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = Rolling_Atk_max
    local dashDist = Rolling_Atk_max + 2
    local AttDist = Rolling_Atk_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = NormalR_max
NormalR_min = UseItem_min
function Kiaran6740_Act17(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if targetDist <= 2 and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    end
    CommonNPC_ActivateTwoHandedMode(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 2
    local AttDist = NormalR_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate2 > 50 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(60, 60), true, true, -1)
    end
    if fate <= 20 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
    elseif fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, NPC_ATK_NormalR, TARGET_ENE_0, AttDist, 90, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 90, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
        if UseItem_min <= targetDist then
            if not ai:HasSpecialEffectId(TARGET_ENE_0, 3151) and ai:GetNumber(1) <= 99 then
                ai:ChangeEquipItem(1)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(1) + 1)
            elseif ai:GetNumber(0) <= 99 then
                ai:ChangeEquipItem(0)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(0) + 1)
            end
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = UseItem_max
function Kiaran6740_Act20(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = UseItem_max
    local dashDist = UseItem_max + 2
    local AttDist = UseItem_max + 0.5
    local Odds_Guard = 0
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if targetDist <= 5 then
        if fate <= 35 then
            if ai:GetNumber(0) <= 99 then
                ai:ChangeEquipItem(0)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(0) + 1)
            end
        elseif ai:GetNumber(1) <= 99 then
            ai:ChangeEquipItem(1)
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
            ai:SetNumber(1, ai:GetNumber(1) + 1)
        end
    elseif 10 > targetDist then
        if fate <= 20 then
            if ai:GetNumber(0) <= 99 then
                ai:ChangeEquipItem(0)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(0, ai:GetNumber(0) + 1)
            end
        elseif ai:GetNumber(1) <= 99 then
            ai:ChangeEquipItem(1)
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
            ai:SetNumber(1, ai:GetNumber(1) + 1)
        end
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kiaran6740_ActAfter(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if targetDist <= 1.5 then
        if fate <= 65 then
            if fate2 <= 70 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
            elseif fate2 <= 85 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 2)
                if fate3 <= 30 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
                end
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 2)
                if fate3 <= 30 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
                end
            end
        elseif fate <= 100 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        end
    elseif targetDist <= 2.5 then
        if fate <= 70 then
            if fate2 <= 20 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
            elseif fate2 <= 60 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 2)
                if fate3 <= 30 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
                end
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 2)
                if fate3 <= 30 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
                end
            end
        elseif fate <= 100 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        end
    elseif targetDist <= 4 then
        if fate <= 40 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        elseif fate <= 70 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Float(1.5, 2.5), TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
        elseif fate <= 90 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
        end
    elseif fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Float(1, 2), TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(1.5, 2.5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    end
    return 
end

function Kiaran6740_ActAfter_AdjustSpace(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_If, 10, 2)
    return 
end

function Kiaran6740Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Kiaran6740Battle_Terminate(ai, goal)
    return 
end

NormalR_min = UseItem_max
NormalR_min = LargeR_max
function Kiaran6740Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_FindAttack) then
        local FindATKDist = 3
        local FindATKPer = 65
        if targetDist <= FindATKDist and fate <= FindATKPer then
            goal:ClearSubGoal()
            if fate2 <= 15 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        local combRunDist = 3
        local combRunPer = 65
        if targetDist < combRunDist then
            if fate <= combRunPer then
                goal:ClearSubGoal()
                if fate2 <= 40 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_F, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
                end
            end
            return true
        end
    end
    local distUseItem_Act = 10
    local oddsUseItem_Act = 100
    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
        local approachDist = UseItem_max
        local dashDist = UseItem_max + 2
        local AttDist = UseItem_max + 0.5
        local Odds_Guard = 0
        goal:ClearSubGoal()
        if targetDist <= 4.5 then
            CommonNPC_ActivateTwoHandedMode(ai, goal)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 1.5, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 1.5, 90)
        elseif targetDist <= 10 then
            if ai:HasSpecialEffectId(TARGET_ENE_0, 3151) then
                if ai:GetNumber(0) <= 99 then
                    ai:ChangeEquipItem(0)
                    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                    ai:SetNumber(0, ai:GetNumber(0) + 1)
                end
            elseif ai:GetNumber(1) <= 99 then
                ai:ChangeEquipItem(1)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_Item, TARGET_ENE_0, DIST_None, 1.5, 90)
                ai:SetNumber(1, ai:GetNumber(1) + 1)
            end
        end
        return true
    elseif ai:IsInterupt(INTERUPT_GuardBreak) then
        local distGuardBreak_Act = 2
        local oddsGuardBreak_Act = 100
        if targetDist <= distGuardBreak_Act and fate <= oddsGuardBreak_Act then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) then
        local ResDist = 3
        local ResPer = 50
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
        local AttDist = LargeR_max + 0.5
        local distResNear = 2.8
        local distResFar = 8
        local oddsResNear = 50
        local oddsResFar = 90
        local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
        if ResBehavID == 1 then
            goal:ClearSubGoal()
            if fate <= 20 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpinComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, AttDist, 1.5, 90)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            end
            return true
        elseif ResBehavID == 2 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, ai:GetRandam_Int(11, 12), TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            return true
        end
    end
    return false
end

return 
