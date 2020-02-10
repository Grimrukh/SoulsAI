REGISTER_GOAL(GOAL_HusiBanIwa281100_Battle, "HusiBanIwa281100Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.4
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.4
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1.5
local Att3003_Dist_min = 0
local Att3003_Dist_max = 7.4
local Att3004_Dist_min = 0
local Att3004_Dist_max = 3
local Att3005_Dist_min = 0
local Att3005_Dist_max = 20.1
local Att3006_Dist_min = 0
local Att3006_Dist_max = 20
local Att3007_Dist_min = 0
local Att3007_Dist_max = 10
REGISTER_GOAL_NO_UPDATE(GOAL_HusiBanIwa281100_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function HusiBanIwa281100Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if 8.1 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 40
        actPerArr[6] = 60
        actPerArr[9] = 0
    elseif 6.1 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[6] = 20
        actPerArr[9] = 80
    elseif 4.1 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[4] = 0
        actPerArr[6] = 0
        actPerArr[9] = 70
    elseif 2.1 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[3] = 10
        actPerArr[4] = 0
        actPerArr[6] = 0
        actPerArr[9] = 50
    else
        actPerArr[1] = 25
        actPerArr[2] = 20
        actPerArr[3] = 5
        actPerArr[4] = 0
        actPerArr[6] = 0
        actPerArr[9] = 50
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
    local0 = {Att3004_Dist_max, 0, 3004, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, HusiBanIwa281100_Act04)
    local0 = {3007, DIST_Far, nil}
    defFuncParamTbl[6] = local0
    actFuncArr[9] = REGIST_FUNC(ai, goal, HusiBanIwa281100_Act09)
    local0 = {0, 90, 5, 5, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HusiBanIwa281100_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiBanIwa281100_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiBanIwa281100_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 6.1 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    elseif 4.1 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    elseif 2.1 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3006, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiBanIwa281100Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiBanIwa281100Battle_Terminate(ai, goal)
    return 
end

function HusiBanIwa281100Battle_Interupt(ai, goal)
    local distGuardBreak_Act = 7.4
    local oddsGuardBreak_Act = 30
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if 2.3 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    else
        return false
    end
end

return 
