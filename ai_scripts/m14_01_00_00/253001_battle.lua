REGISTER_GOAL(GOAL_HusiMino_Poison253001_Battle, "HusiMino_Poison253001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.5
local Att3003_Dist_min = 2.5
local Att3003_Dist_max = 3.5
local Att3004_Dist_min = 3.5
local Att3004_Dist_max = 6
local Att3005_Dist_min = 0
local Att3005_Dist_max = 1.5
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1
local Att3007_Dist_min = 4
local Att3007_Dist_max = 6
REGISTER_GOAL_NO_UPDATE(GOAL_HusiMino_Poison253001_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function HusiMino_Poison253001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[7] = 60
        actPerArr[2] = 10
        actPerArr[3] = 0
        actPerArr[4] = 30
    elseif 5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[7] = 30
            actPerArr[2] = 10
            actPerArr[3] = 10
            actPerArr[4] = 50
        else
            actPerArr[7] = 50
            actPerArr[2] = 20
            actPerArr[3] = 20
            actPerArr[4] = 10
        end
    elseif 2.5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[7] = 10
            actPerArr[2] = 20
            actPerArr[3] = 20
            actPerArr[4] = 50
        else
            actPerArr[7] = 30
            actPerArr[2] = 40
            actPerArr[3] = 20
            actPerArr[4] = 10
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[7] = 0
        actPerArr[2] = 25
        actPerArr[3] = 25
        actPerArr[4] = 50
    else
        actPerArr[7] = 0
        actPerArr[2] = 60
        actPerArr[3] = 30
        actPerArr[4] = 10
    end
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 10
    local0[4] = 40
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3005_Dist_max, 0, 3005, DIST_Middle, nil}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiMino_Poison253001_Act04)
    actFuncArr[7] = REGIST_FUNC(ai, goal, HusiMino_Poison253001_Act07)
    local0 = {0, 50, 0, 10, 10, 15, 15}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3007_Dist_min
Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3006_Dist_max
function HusiMino_Poison253001_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if Att3007_Dist_min <= targetDist then
        local approachDist = Att3007_Dist_max
        local dashDist = Att3007_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3007
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    else
        local approachDist = Att3006_Dist_max
        local dashDist = Att3006_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3006
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_min
Att3000_Dist_min = Att3004_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function HusiMino_Poison253001_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if Att3004_Dist_min <= targetDist and fate <= 40 then
        local approachDist = Att3004_Dist_max
        local dashDist = Att3004_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3004
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    else
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3003
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiMino_Poison253001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiMino_Poison253001Battle_Terminate(ai, goal)
    return 
end

function HusiMino_Poison253001Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distDamagedStep = 3
    local oddsDamagedStep = 15
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 4
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
