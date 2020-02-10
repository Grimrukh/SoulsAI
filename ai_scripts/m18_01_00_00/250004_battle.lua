REGISTER_GOAL(GOAL_Husi250004_Battle, "Husi250004Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.7
local Att3003_Dist_min = 0
local Att3003_Dist_max = 1.8
local Att3004_Dist_min = 2.5
local Att3004_Dist_max = 4
local Att3005_Dist_min = 4
local Att3005_Dist_max = 6
local Att3006_Dist_min = 6
local Att3006_Dist_max = 7.5
local Att3008_Dist_min = 0
local Att3008_Dist_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_Husi250004_Battle, 1)
function Husi250004Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[1] = 100
    elseif 4 <= targetDist then
        actPerArr[1] = 80
        actPerArr[2] = 20
    elseif 2.5 <= targetDist then
        actPerArr[1] = 60
        actPerArr[2] = 30
        actPerArr[3] = 10
    else
        actPerArr[1] = 20
        actPerArr[2] = 10
        actPerArr[3] = 70
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Husi250004_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Husi250004_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Husi250004_Act03)
    local local0 = {0, 60, 10, 10, 20, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function Husi250004_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1, 3), TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi250004_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(1, 3), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi250004_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Float(1, 3), TARGET_ENE_0, 5, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi250004Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Husi250004Battle_Terminate(ai, goal)
    return 
end

function Husi250004Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    return false
end

return 
