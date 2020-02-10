REGISTER_GOAL(GOAL_DriftItemEvil349100_Battle, "DriftItemEvil349100Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0.9
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1
local Att3003_Dist_min = 6
local Att3003_Dist_max = 14
REGISTER_GOAL_NO_UPDATE(GOAL_DriftItemEvil349100_Battle, 1)
function DriftItemEvil349100Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 10 <= targetDist then
        actPerArr[2] = 5
        actPerArr[3] = 5
        actPerArr[4] = 90
    elseif 6 <= targetDist then
        actPerArr[2] = 20
        actPerArr[3] = 20
        actPerArr[4] = 60
    else
        actPerArr[2] = 55
        actPerArr[3] = 45
        actPerArr[4] = 0
    end
    actFuncArr[2] = REGIST_FUNC(ai, goal, DriftItemEvil349100_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, DriftItemEvil349100_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, DriftItemEvil349100_Act04)
    local local0 = {0, 70, 10, 10, 10, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function DriftItemEvil349100_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local jumptimer = ai:GetRandam_Int(20, 30)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    if ai:IsFinishTimer(0) == true then
        if 10 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 10, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        elseif 7 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 7, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        elseif 3.8 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 3.8, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        end
    end
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function DriftItemEvil349100_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local jumptimer = ai:GetRandam_Int(20, 30)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    if ai:IsFinishTimer(0) == true then
        if 10 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 10, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        elseif 7 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 7, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        elseif 3.8 <= targetDist then
            ai:SetTimer(0, jumptimer)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, 3.8, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_SELF, DIST_NONE, 0)
        end
    end
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3002, TARGET_ENE_0, DIST_Middle)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function DriftItemEvil349100_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, -1, 40)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function DriftItemEvil349100Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function DriftItemEvil349100Battle_Terminate(ai, goal)
    return 
end

function DriftItemEvil349100Battle_Interupt(ai, goal)
    return false
end

return 
