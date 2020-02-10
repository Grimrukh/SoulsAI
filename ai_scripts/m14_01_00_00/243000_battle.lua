REGISTER_GOAL(GOAL_MovingStatue243000_Battle, "MovingStatue243000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.5
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.2
REGISTER_GOAL_NO_UPDATE(GOAL_MovingStatue243000_Battle, 1)
function MovingStatue243000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if 8 <= targetDist then
        actPerArr[1] = 100
        actPerArr[2] = 0
    elseif 2.5 <= targetDist then
        actPerArr[1] = 60
        actPerArr[2] = 40
    else
        actPerArr[1] = 30
        actPerArr[2] = 70
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, MovingStatue243000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, MovingStatue243000_Act02)
    local local0 = {0, 70, 0, 0, 30, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function MovingStatue243000_Act01(ai, goal, paramTbl)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3000
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3001_Dist_max
function MovingStatue243000_Act02(ai, goal, paramTbl)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3001
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function MovingStatue243000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function MovingStatue243000Battle_Terminate(ai, goal)
    return 
end

function MovingStatue243000Battle_Interupt(ai, goal)
    return false
end

return 
