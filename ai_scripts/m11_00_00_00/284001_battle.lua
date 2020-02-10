REGISTER_GOAL(GOAL_HusiCongestion_Hand284001_Battle, "HusiCongestion_Hand284001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.7
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 15
local Att3004_Dist_min = 0
local Att3004_Dist_max = 15
REGISTER_GOAL_NO_UPDATE(GOAL_HusiCongestion_Hand284001_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function HusiCongestion_Hand284001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        actPerArr[1] = 100
    elseif 15 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 50
        actPerArr[4] = 50
        actPerArr[5] = 0
        actPerArr[6] = 0
    elseif 10 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 40
        actPerArr[4] = 40
        actPerArr[5] = 20
        actPerArr[6] = 0
    elseif 5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 30
        actPerArr[4] = 30
        actPerArr[5] = 20
        actPerArr[6] = 20
    elseif 1.7 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 20
        actPerArr[4] = 20
        actPerArr[5] = 20
        actPerArr[6] = 40
    else
        actPerArr[1] = 25
        actPerArr[2] = 25
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 10
        actPerArr[6] = 40
    end
    local local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 30
    local0[4] = 70
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    actFuncArr[3] = REGIST_FUNC(ai, goal, HusiCongestion_Hand284001_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiCongestion_Hand284001_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, HusiCongestion_Hand284001_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, HusiCongestion_Hand284001_Act06)
    local0 = {0, 100, 0, 0, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HusiCongestion_Hand284001_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    if fate <= 65 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 15, TARGET_ENE_0, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_None, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function HusiCongestion_Hand284001_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    if fate <= 65 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 15, TARGET_ENE_0, true, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_None, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiCongestion_Hand284001_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 15, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiCongestion_Hand284001_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 15, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiCongestion_Hand284001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiCongestion_Hand284001Battle_Terminate(ai, goal)
    return 
end

function HusiCongestion_Hand284001Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local fate3 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local distDamagedStep = 3
        local oddsDamagedStep = 5
        local bkStepPer = 100
        local leftStepPer = 0
        local rightStepPer = 0
        local safetyDist = 4
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            return false
        end
    end
end

return 
