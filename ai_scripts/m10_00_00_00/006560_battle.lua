REGISTER_GOAL(GOAL_StingKnight6560_Battle, "StingKnight6560Battle")
local NormalR_min = 0
local NormalR_max = 1.5
local LargeR_min = 0
local LargeR_max = 2.5
local Whand_jyaku_min = 0
local Whand_jyaku_max = 1.7
local Whand_kyou_min = 0
local Whand_kyou_max = 2.3
local PushR_min = 0
local PushR_max = 0.9
local Magic_min = 5
local Magic_max = 10
local Backstep_Atk_min = 0
local Backstep_Atk_max = 1.5
local Rolling_Atk_min = 3.5
local Rolling_Atk_max = 4.5
REGISTER_GOAL_NO_UPDATE(GOAL_StingKnight6560_Battle, 1)
function StingKnight6560Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local BothHandOff = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local MagicValue = 1
    local Magic1Limit = ai:GetNumber(0)
    if 5 <= Magic1Limit then
        MagicValue = 0
    end
    if ai:IsTargetGuard(TARGET_ENE_0) == false and ai:IsBothHandMode(TARGET_SELF) and BothHandOff <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    if 8 <= targetDist then
        actPerArr[1] = 15
        actPerArr[3] = 15
        actPerArr[7] = 65
        actPerArr[10] = 5
    elseif 3.5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 25
            actPerArr[3] = 25
            actPerArr[4] = 50
        else
            actPerArr[1] = 45
            actPerArr[3] = 50
            actPerArr[10] = 5
        end
    elseif 1.5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 13
            actPerArr[3] = 17
            actPerArr[4] = 30
            actPerArr[6] = 20
            actPerArr[9] = 10
        else
            actPerArr[1] = 30
            actPerArr[3] = 30
            actPerArr[6] = 25
            actPerArr[9] = 10
            actPerArr[10] = 5
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[1] = 15
        actPerArr[3] = 20
        actPerArr[4] = 35
        actPerArr[6] = 20
        actPerArr[9] = 10
    else
        actPerArr[1] = 30
        actPerArr[3] = 30
        actPerArr[6] = 25
        actPerArr[9] = 10
        actPerArr[10] = 5
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, StingKnight6560_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, StingKnight6560_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, StingKnight6560_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, StingKnight6560_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, StingKnight6560_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, StingKnight6560_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, StingKnight6560_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, StingKnight6560_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, StingKnight6560_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, StingKnight6560_Act10)
    local atkAfterFunc = REGIST_FUNC(ai, goal, StingKnight6560_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

NormalR_min = NormalR_max
function StingKnight6560_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    if ai:IsTargetGuard(TARGET_ENE_0) == true and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 5
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

function StingKnight6560_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    if ai:IsTargetGuard(TARGET_ENE_0) == true and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    local approachDist = Guard_NormalR_max
    local dashDist = Guard_NormalR_max + 5
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

NormalR_min = LargeR_max
function StingKnight6560_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    if ai:IsTargetGuard(TARGET_ENE_0) == true and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
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
function StingKnight6560_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if ai:IsBothHandMode(TARGET_SELF) == true then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    local approachDist = PushR_max
    local dashDist = PushR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Magic_max
NormalR_min = Magic_min
function StingKnight6560_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local R_Wep = ai:GetWepCateRight(TARGET_SELF)
    local Magic1Limit = ai:GetNumber(0)
    CommonNPC_UseSecondaryRightHand(ai, goal)
    if Magic_max <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2.5, TARGET_ENE_0, Magic_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    elseif targetDist <= Magic_min then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, Magic_min, TARGET_ENE_0, false, -1)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_MagicR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    ai:SetNumber(0, Magic1Limit + 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

NormalR_min = Backstep_Atk_max
function StingKnight6560_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    if ai:IsTargetGuard(TARGET_ENE_0) == true and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    local approachDist = Backstep_Atk_max
    local dashDist = Backstep_Atk_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_Atk_max
function StingKnight6560_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    if ai:IsTargetGuard(TARGET_ENE_0) == true and not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    end
    local approachDist = Rolling_Atk_max
    local dashDist = Rolling_Atk_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function StingKnight6560_Act08(ai, goal, paramTbl)
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

function StingKnight6560_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function StingKnight6560_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_SwitchWep, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function StingKnight6560_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local MoveDist = 3
    if fate <= 5 then
        if fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 2)
        elseif fate2 <= 75 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
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

function StingKnight6560Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function StingKnight6560Battle_Terminate(ai, goal)
    return 
end

NormalR_min = LargeR_max
function StingKnight6560Battle_Interupt(ai, goal)
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
            if fate2 <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            elseif fate2 <= 75 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            end
        end
    end
    if ai:IsInterupt(INTERUPT_SuccessGuard) then
        local Suc_GuardDist = 3
        local Suc_GuardPer = 80
        if targetDist <= Suc_GuardDist and fate <= Suc_GuardPer then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_None, 0, -1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        local combRunDist = 3
        local combRunPer = 10
        if targetDist < combRunDist and fate <= combRunPer then
            goal:ClearSubGoal()
            if fate2 <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            elseif fate2 <= 75 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            end
        end
    end
    if ai:IsInterupt(INTERUPT_GuardBreak) then
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
        local ResPer = 10
        if targetDist < ResDist then
            if fate <= ResPer then
                goal:ClearSubGoal()
                if fate2 <= ResPer then
                    if fate2 <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
                    elseif fate2 <= 75 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
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
                if fate2 <= 50 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepB, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
                elseif fate2 <= 75 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepL, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, NPC_ATK_StepR, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                end
            else
                local approachDist = LargeR_max
                local dashDist = LargeR_max + 5
                local Odds_Guard = 100
                NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
                goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
            end
            return true
        end
    end
    return false
end

return 
