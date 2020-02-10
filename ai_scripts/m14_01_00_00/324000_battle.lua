REGISTER_GOAL(GOAL_Izalis324000_Battle, "Izalis324000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3
local Att3001_Dist_min = 0
local Att3001_Dist_max = 3
local Att3002_Dist_min = 0
local Att3002_Dist_max = 5.6
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.6
local Att3004_Dist_min = 4
local Att3004_Dist_max = 6
REGISTER_GOAL_NO_UPDATE(GOAL_Izalis324000_Battle, 1)
function Izalis324000Battle_Activate(ai, goal)
    local myThinkId = ai:GetNpcThinkParamID()
    local BattleArea = 1412820
    if myThinkId == 324001 then
        BattleArea = 1412820
    elseif myThinkId == 324002 then
        BattleArea = 1412830
    elseif myThinkId == 324000 then
        BattleArea = 1412840
    end
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if not ai:IsInsideTargetRegion(TARGET_ENE_0, BattleArea) then
        if targetDist <= 6 then
            actPerArr[4] = 20
            actPerArr[5] = 20
            actPerArr[6] = 60
        else
            actPerArr[6] = 100
        end
    elseif 8 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 15
        actPerArr[3] = 0
        actPerArr[4] = 10
        actPerArr[5] = 60
    elseif 3 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[3] = 0
        actPerArr[4] = 30
        actPerArr[5] = 30
    elseif 1.2 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[3] = 30
        actPerArr[4] = 30
        actPerArr[5] = 0
    else
        actPerArr[1] = 15
        actPerArr[2] = 15
        actPerArr[3] = 50
        actPerArr[4] = 20
        actPerArr[5] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, HusiFight_Izalis324000_Act06)
    local atkAfterFunc = REGIST_FUNC(ai, goal, Izalis324000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function HusiFight_Izalis324000_Act01(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 20, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function HusiFight_Izalis324000_Act02(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 20, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function HusiFight_Izalis324000_Act03(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, 20, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function HusiFight_Izalis324000_Act04(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 20, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function HusiFight_Izalis324000_Act05(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Middle, 20, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiFight_Izalis324000_Act06(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, POINT_INITIAL, 1, TARGET_ENE_0, True, -1)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
    goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Izalis324000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Izalis324000Battle_Terminate(ai, goal)
    ai:ChangeMoveAnimParam(0)
    return 
end

function Izalis324000Battle_Interupt(ai, goal)
    return false
end

return 
