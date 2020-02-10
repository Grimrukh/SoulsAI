REGISTER_GOAL(GOAL_HusiCongestion_Torch284000_Battle, "HusiCongestion_Torch284000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.9
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2.3
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.4
local Att3005_Dist_min = 2.9
local Att3005_Dist_max = 3.9
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1.7
REGISTER_GOAL_NO_UPDATE(GOAL_HusiCongestion_Torch284000_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function HusiCongestion_Torch284000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        actPerArr[2] = 100
    elseif 4.4 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 15
        actPerArr[3] = 50
        actPerArr[4] = 10
        actPerArr[9] = 15
    elseif 2 <= targetDist then
        actPerArr[1] = 35
        actPerArr[2] = 15
        actPerArr[3] = 0
        actPerArr[4] = 15
        actPerArr[9] = 35
    else
        actPerArr[1] = 15
        actPerArr[2] = 35
        actPerArr[3] = 0
        actPerArr[4] = 35
        actPerArr[9] = 15
    end
    local local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 30
    local0[4] = 100
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3005_Dist_max, 0, 3005, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiCongestion_Torch284000_Act04)
    local0 = {}
    local3, local4 = nil
    local0[1] = Att3003_Dist_max
    local0[2] = 0
    local0[3] = 30
    local0[4] = 100
    local0[5] = 3003
    local0[6] = 3004
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[9] = local0
    local0 = {0, 50, 10, 15, 15, 10}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
function HusiCongestion_Torch284000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiCongestion_Torch284000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiCongestion_Torch284000Battle_Terminate(ai, goal)
    return 
end

function HusiCongestion_Torch284000Battle_Interupt(ai, goal)
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
