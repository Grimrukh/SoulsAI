REGISTER_GOAL(GOAL_Husi_Haka265000_Battle, "Husi_Haka265000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 6
local Att3001_Dist_min = 0
local Att3001_Dist_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_Husi_Haka265000_Battle, 1)
function Husi_Haka265000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if eventNo == 10 and targetDist <= 11 and 2 <= targetDist then
        actPerArr[4] = 100
    elseif 11 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 0
        actPerArr[5] = 70
    elseif 6 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 20
        actPerArr[5] = 50
    else
        actPerArr[1] = 20
        actPerArr[2] = 80
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Husi_Haka265000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Husi_Haka265000_Act02)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Husi_Haka265000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Husi_Haka265000_Act05)
    local local0 = {0, 70, 0, 0, 30, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function Husi_Haka265000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi_Haka265000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi_Haka265000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, POINT_INITIAL, 0.5, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi_Haka265000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1.5, 3), TARGET_ENE_0, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Husi_Haka265000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Husi_Haka265000Battle_Terminate(ai, goal)
    return 
end

function Husi_Haka265000Battle_Interupt(ai, goal)
    return false
end

return 
