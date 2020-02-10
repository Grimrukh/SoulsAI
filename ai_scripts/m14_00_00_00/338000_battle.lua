REGISTER_GOAL(GOAL_Leech338000_Battle, "Leech338000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0.8
local Att3001_Dist_min = 0
local Att3001_Dist_max = 0.8
local Att3002_Dist_min = 0
local Att3002_Dist_max = 4.4
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.7
REGISTER_GOAL_NO_UPDATE(GOAL_Leech338000_Battle, 1)
function Leech338000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[3] = 60
        actPerArr[5] = 30
    elseif 4 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 60
        actPerArr[5] = 20
    elseif 2.5 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 15
        actPerArr[3] = 30
        actPerArr[5] = 40
    else
        actPerArr[1] = 40
        actPerArr[2] = 40
        actPerArr[3] = 5
        actPerArr[5] = 15
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Leech338000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Leech338000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Leech338000_Act03)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Leech338000_Act05)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Leech338000_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Leech338000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3000, TARGET_ENE_0, DIST_Near, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3001_Dist_max
function Leech338000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3001, TARGET_ENE_0, DIST_Near, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function Leech338000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3002, TARGET_ENE_0, DIST_Near, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function Leech338000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3003, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Leech338000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if fate > 30 then
        goal:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_NONE, 0, 0, 0)
        return true
    else
        return false
    end
end

function Leech338000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Leech338000Battle_Terminate(ai, goal)
    return 
end

function Leech338000Battle_Interupt(ai, goal)
    return false
end

return 
