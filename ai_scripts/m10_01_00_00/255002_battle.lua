REGISTER_GOAL(GOAL_HusiHeavy_Bow255002_Battle, "HusiHeavy_Bow255002Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.4
local Att3004_Dist_min = 0
local Att3004_Dist_max = 2.3
local Att3005_Dist_min = 2.5
local Att3005_Dist_max = 4.5
REGISTER_GOAL_NO_UPDATE(GOAL_HusiHeavy_Bow255002_Battle, 1)
function OnIf_255002(ai, goal, codeNo)
    if ai:HasSpecialEffectId(TARGET_SELF, 3151) then
        ai:SetTimer(0, 120)
    else
        ai:SetTimer(0, 30)
    end
    return 
end

function HusiHeavy_Bow255002Battle_Activate(ai, goal)
    ai:AddObserveArea(0, TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_F, 180, 3)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local chan_to_bow1 = 10
    local chan_to_bow2 = 8
    local hprate = ai:GetHpRate(TARGET_SELF)
    if ai:HasSpecialEffectId(TARGET_SELF, 5401) then
        if hprate <= 0.4 and ai:IsFinishTimer(0) == true then
            if chan_to_bow1 <= targetDist then
                actPerArr[4] = 25
                actPerArr[6] = 0
                actPerArr[7] = 0
                actPerArr[8] = 0
                actPerArr[9] = 0
                actPerArr[10] = 75
            elseif 4.5 <= targetDist then
                actPerArr[4] = 5
                actPerArr[6] = 5
                actPerArr[7] = 5
                actPerArr[8] = 5
                actPerArr[9] = 5
                actPerArr[10] = 75
            elseif 3 <= targetDist then
                actPerArr[6] = 15
                actPerArr[7] = 15
                actPerArr[8] = 10
                actPerArr[9] = 10
                actPerArr[10] = 50
            else
                actPerArr[6] = 25
                actPerArr[7] = 20
                actPerArr[8] = 20
                actPerArr[9] = 0
                actPerArr[10] = 35
            end
        elseif chan_to_bow1 <= targetDist then
            actPerArr[4] = 100
        elseif chan_to_bow2 <= targetDist then
            actPerArr[4] = 70
            actPerArr[6] = 5
            actPerArr[7] = 5
            actPerArr[8] = 5
            actPerArr[9] = 15
        else
            actPerArr[6] = 40
            actPerArr[7] = 30
            actPerArr[8] = 30
            actPerArr[9] = 0
        end
    elseif hprate <= 0.4 and ai:IsFinishTimer(0) == true then
        if 12 <= targetDist then
            actPerArr[1] = 25
            actPerArr[2] = 0
            actPerArr[10] = 75
        elseif 4.5 <= targetDist then
            actPerArr[1] = 15
            actPerArr[2] = 10
            actPerArr[10] = 75
        elseif 3 <= targetDist then
            actPerArr[1] = 20
            actPerArr[2] = 10
            actPerArr[5] = 20
            actPerArr[10] = 50
        else
            actPerArr[5] = 65
            actPerArr[10] = 35
        end
    elseif 12 <= targetDist then
        actPerArr[1] = 100
    elseif 5 <= targetDist then
        actPerArr[1] = 70
        actPerArr[2] = 30
    elseif 3 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 40
        actPerArr[5] = 30
    else
        actPerArr[5] = 100
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, HusiHeavy_Bow255002_Act10)
    local local0 = {0, 60, 0, 0, 0, 20, 20}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function HusiHeavy_Bow255002_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    else
        local FirstAttID = 3002
        local ComAttID = 3003
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 2), 0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    else
        local FirstAttID = 3002
        local ComAttID = 3003
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 2), 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    else
        local FirstAttID = 3002
        local ComAttID = 3003
        local ShootNum = ai:GetRandam_Int(1, 3)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 2), 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3010, TARGET_SELF, DIST_Middle, 0)
    if fate <= 50 then
        local FirstAttID = 3000
        local ComAttID = 3001
        local ShootNum = ai:GetRandam_Int(2, 5)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    else
        local FirstAttID = 3002
        local ComAttID = 3003
        local ShootNum = ai:GetRandam_Int(2, 5)
        Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002_Act05(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3011, TARGET_SELF, DIST_None)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function HusiHeavy_Bow255002_Act06(ai, goal, paramTbl)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 85 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function HusiHeavy_Bow255002_Act07(ai, goal, paramTbl)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function HusiHeavy_Bow255002_Act08(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function HusiHeavy_Bow255002_Act09(ai, goal, paramTbl)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002_Act10(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 4.5, TARGET_ENE_0, true, -1)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3200, TARGET_ENE_0, DIST_None)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 3.6)
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3200, TARGET_ENE_0, DIST_None)
    end
    goal:AddSubGoal(GOAL_COMMON_If, 15, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiHeavy_Bow255002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiHeavy_Bow255002Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function HusiHeavy_Bow255002Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local fate3 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and ai:HasSpecialEffectId(TARGET_SELF, 5401) == false and ai:IsFinishTimer(0) == true and ai:HasSpecialEffectId(TARGET_SELF, 5401) == false then
            ai:SetTimer(0, 5)
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3011, TARGET_SELF, DIST_None)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            if fate <= 75 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            end
            return true
        else
            local superStepDist = 3
            local superStepPer = 10
            local bkStepPer = 50
            local leftStepPer = 25
            local rightStepPer = 25
            if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
                return true
            else
                local distDamagedStep = 3
                local oddsDamagedStep = 10
                local bkStepPer = 50
                local leftStepPer = 25
                local rightStepPer = 25
                local safetyDist = 4
                if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
                    return true
                else
                    return false
                end
            end
        end
    end
end

return 
