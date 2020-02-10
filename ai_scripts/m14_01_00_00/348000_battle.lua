REGISTER_GOAL(GOAL_Taiyoutyuu347000_Battle, "Taiyoutyuu347000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 30
REGISTER_GOAL_NO_UPDATE(GOAL_Taiyoutyuu347000_Battle, 1)
function Taiyoutyuu347000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    local fate = ai:GetRandam_Int(1, 4)
    if 10 <= targetDist then
        if ai:IsFinishTimer(0) == true then
            ai:SetTimer(0, fate)
            actPerArr[1] = 0
            actPerArr[2] = 100
        else
            actPerArr[1] = 100
            actPerArr[2] = 0
        end
    elseif ai:IsFinishTimer(0) == true then
        ai:SetTimer(0, fate)
        actPerArr[1] = 0
        actPerArr[2] = 100
    else
        actPerArr[1] = 100
        actPerArr[2] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Taiyoutyuu347000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Taiyoutyuu347000_Act02)
    local local0 = {0, 100, 0, 0, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function Taiyoutyuu347000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 1, TARGET_ENE_0, 100, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Taiyoutyuu347000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3000, TARGET_ENE_0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Taiyoutyuu347000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Taiyoutyuu347000Battle_Terminate(ai, goal)
    return 
end

function Taiyoutyuu347000Battle_Interupt(ai, goal)
    return false
end

return 
