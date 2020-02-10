REGISTER_GOAL(GOAL_ClayDoll238000_Battle, "ClayDoll238000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.4
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3.3
local Att3005_Dist_min = 5.5
local Att3005_Dist_max = 8.3
local Att3006_Dist_min = 5.6
local Att3006_Dist_max = 8
local Att3007_Dist_min = 0
local Att3007_Dist_max = 10
REGISTER_GOAL_NO_UPDATE(GOAL_ClayDoll238000_Battle, 1)
function ClayDoll238000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local Act05_Odds = 0
    if ai:IsFinishTimer(0) == true then
        Act05_Odds = 1
    end
    if 8 <= targetDist then
        actPerArr[1] = 40
        actPerArr[2] = 10
        actPerArr[3] = 45
        actPerArr[5] = 0 * Act05_Odds
        actPerArr[9] = 5
    elseif 4 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 20
        actPerArr[3] = 25
        actPerArr[5] = 10 * Act05_Odds
        actPerArr[9] = 20
    elseif 2.5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 30
        actPerArr[3] = 0
        actPerArr[5] = 40 * Act05_Odds
        actPerArr[9] = 30
    else
        actPerArr[1] = 0
        actPerArr[2] = 30
        actPerArr[3] = 0
        actPerArr[5] = 50 * Act05_Odds
        actPerArr[9] = 20
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, ClayDoll238000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, ClayDoll238000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, ClayDoll238000_Act03)
    actFuncArr[5] = REGIST_FUNC(ai, goal, ClayDoll238000_Act05)
    actFuncArr[9] = REGIST_FUNC(ai, goal, ClayDoll238000_Act09)
    local local0 = {100, 10, 30, 25, 20, 8, 7}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function ClayDoll238000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 30
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function ClayDoll238000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 30
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function ClayDoll238000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 30
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ClayDoll238000_Act05(ai, goal, paramTbl)
    ai:SetTimer(0, 75)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3007, TARGET_ENE_0, DIST_Middle)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function ClayDoll238000_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 30
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ClayDoll238000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ClayDoll238000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function ClayDoll238000Battle_Interupt(ai, goal)
    local distGuardBreak_Act = 8
    local oddsGuardBreak_Act = 35
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if 5.5 <= targetDist then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
            end
        elseif fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distResNear = 8.3
    local distResFar = 20
    local oddsResNear = 0
    local oddsResFar = 100
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
    if ResBehavID == 1 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
    elseif ResBehavID == 2 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
    end
    local distSuccessGuard_Act = 3.4
    local oddsSuccessGuard_Act = 40
    if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        return true
    else
        return false
    end
end

return 
