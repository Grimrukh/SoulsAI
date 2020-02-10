REGISTER_GOAL(GOAL_HusiBan281000_Battle, "HusiBan281000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.8
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2.1
local Att3003_Dist_min = 2.75
local Att3003_Dist_max = 6.45
local Att3004_Dist_min = 0
local Att3004_Dist_max = 4.5
local Att3006_Dist_min = 0
local Att3006_Dist_max = 9.5
REGISTER_GOAL_NO_UPDATE(GOAL_HusiBan281000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function HusiBan281000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[2] = 10
        actPerArr[3] = 5
        actPerArr[1] = 50
        actPerArr[9] = 10
        actPerArr[6] = 25
    elseif 4 <= targetDist then
        actPerArr[2] = 15
        actPerArr[3] = 10
        actPerArr[1] = 40
        actPerArr[9] = 10
        actPerArr[6] = 25
    elseif 2.5 <= targetDist then
        actPerArr[2] = 30
        actPerArr[3] = 20
        actPerArr[1] = 10
        actPerArr[9] = 30
        actPerArr[6] = 10
    else
        actPerArr[2] = 35
        actPerArr[3] = 20
        actPerArr[1] = 0
        actPerArr[9] = 35
        actPerArr[6] = 10
    end
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 50
    local0[4] = 100
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[3] = local0
    local0 = {Att3003_Dist_max, 0, 3003, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local3, local4 = nil
    local0[1] = Att3004_Dist_max
    local0[2] = 0
    local0[3] = 50
    local0[4] = 100
    local0[5] = 3004
    local0[6] = 3005
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[9] = local0
    local0 = {3006, DIST_None, nil}
    defFuncParamTbl[6] = local0
    local0 = {0, 10, 40, 30, 20, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function HusiBan281000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiBan281000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HusiBan281000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local guardBreakConutDist = 1.7
    local guardBreakConutPer = 25
    if FindGuardBreak_Act(ai, goal, guardBreakConutDist, guardBreakConutPer) then
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3003
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
        return true
    else
        local distMissSwing_Attack = 4.5
        local oddsMissSwing_Attack = 25
        local AttID = 3004
        if MissSwing_Attack(ai, goal, distMissSwing_Attack, oddsMissSwing_Attack, AttID) then
            return true
        else
            return false
        end
    end
end

return 
