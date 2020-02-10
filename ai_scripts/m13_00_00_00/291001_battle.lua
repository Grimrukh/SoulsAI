REGISTER_GOAL(GOAL_BigSk_Bow291001_Battle, "BigSk_Bow291001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0
local Att3006_Dist_min = 0
local Att3006_Dist_max = 2.5
REGISTER_GOAL_NO_UPDATE(GOAL_BigSk_Bow291001_Battle, 1)
Att3000_Dist_min = Att3006_Dist_max
function BigSk_Bow291001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 12 <= targetDist then
        actPerArr[1] = 100
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 0
    elseif 3 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 100
        actPerArr[3] = 0
        actPerArr[4] = 0
    else
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 70
        actPerArr[4] = 30
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, BigSk_Bow291001_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, BigSk_Bow291001_Act02)
    local local0 = {Att3006_Dist_max, 0, 3006, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, BigSk_Bow291001_Act04)
    local0 = {0, 100, 0, 0, 0, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function BigSk_Bow291001_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function BigSk_Bow291001_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function BigSk_Bow291001_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 10, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function BigSk_Bow291001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BigSk_Bow291001Battle_Terminate(ai, goal)
    return 
end

function BigSk_Bow291001Battle_Interupt(ai, goal)
    local distDamagedStep = 3
    local oddsDamagedStep = 25
    local bkStepPer = 40
    local leftStepPer = 30
    local rightStepPer = 30
    local safetyDist = 4
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
