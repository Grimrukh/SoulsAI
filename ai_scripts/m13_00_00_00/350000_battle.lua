REGISTER_GOAL(GOAL_Bigjelly350000_Battle, "Bigjelly350000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 4.5
local Att3002_Dist_min = 0
local Att3002_Dist_max = 12
local Att3003_Dist_min = 0
local Att3003_Dist_max = 5
local Att3004_Dist_min = 4
local Att3004_Dist_max = 8
local Att3005_Dist_min = 0
local Att3005_Dist_max = 100
REGISTER_GOAL_NO_UPDATE(GOAL_Bigjelly350000_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function Bigjelly350000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local activeBreathChr = ai:GetEventRequest(0)
    local Wisp_Odds = 1
    if ai:IsFinishTimer(0) == false then
        Wisp_Odds = 0
    elseif activeBreathChr == 0 then
        Wisp_Odds = 5
    elseif activeBreathChr == 1 then
        Wisp_Odds = 1.5
    elseif activeBreathChr == 2 then
        Wisp_Odds = 0.8
    elseif activeBreathChr == 3 then
        Wisp_Odds = 0.4
    elseif activeBreathChr == 4 then
        Wisp_Odds = 0.2
    elseif activeBreathChr == 5 then
        Wisp_Odds = 0.1
    elseif activeBreathChr == 6 then
        Wisp_Odds = 0
    else
        Wisp_Odds = 5
    end
    if 12 <= targetDist then
        actPerArr[1] = 50
        actPerArr[2] = 0
        actPerArr[4] = 0
        actPerArr[5] = 30
        actPerArr[6] = 20 * Wisp_Odds
    elseif 8 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 0
        actPerArr[4] = 5
        actPerArr[5] = 50
        actPerArr[6] = 20 * Wisp_Odds
    elseif 4 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[4] = 40
        actPerArr[5] = 0
        actPerArr[6] = 20 * Wisp_Odds
    else
        actPerArr[1] = 5
        actPerArr[2] = 45
        actPerArr[4] = 30
        actPerArr[5] = 0
        actPerArr[6] = 20 * Wisp_Odds
    end
    local local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 10
    local0[4] = 90
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, Bigjelly350000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Bigjelly350000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Bigjelly350000_Act06)
    local0 = {0, 90, 0, 5, 5, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function Bigjelly350000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3003
    local AttDist = DIST_None
    local TurnTime = 1.5
    local TurnFaceAngle = 20
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist, TurnTime, TurnFaceAngle)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function Bigjelly350000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3004
    local AttDist = DIST_None
    local TurnTime = 1.5
    local TurnFaceAngle = 20
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist, TurnTime, TurnFaceAngle)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Bigjelly350000_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_SELF, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Bigjelly350000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Bigjelly350000Battle_Terminate(ai, goal)
    return 
end

function Bigjelly350000Battle_Interupt(ai, goal)
    return false
end

return 
