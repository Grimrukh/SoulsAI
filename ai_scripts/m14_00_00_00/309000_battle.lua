REGISTER_GOAL(GOAL_Ooka309000_Battle, "Ooka309000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0.75
local Att3001_Dist_min = 0
local Att3001_Dist_max = 0.9
local Att3002_Dist_min = 0
local Att3002_Dist_max = 3
REGISTER_GOAL_NO_UPDATE(GOAL_Ooka309000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3001_Dist_max
Att3000_Dist_min = Att3002_Dist_min
Att3000_Dist_min = Att3002_Dist_max
function Ooka309000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[1] = 5
        actPerArr[3] = 40
        actPerArr[5] = 55
    elseif 3 <= targetDist then
        actPerArr[1] = 10
        actPerArr[3] = 40
        actPerArr[5] = 50
    else
        actPerArr[1] = 40
        actPerArr[3] = 30
        actPerArr[5] = 30
    end
    local local0 = {Att3000_Dist_max, 0, 3000, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {Att3001_Dist_max, 0, 3001, DIST_Middle}
    defFuncParamTbl[3] = local0
    local0 = {Att3002_Dist_min, Att3002_Dist_max, 0, 3002, DIST_Far}
    defFuncParamTbl[5] = local0
    local0 = {0, 60, 10, 10, 20, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function Ooka309000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Ooka309000Battle_Terminate(ai, goal)
    return 
end

function Ooka309000Battle_Interupt(ai, goal)
    return false
end

return 
