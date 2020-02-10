REGISTER_GOAL(GOAL_Skeleton_Bow290001_Battle, "Skeleton_Bow290001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0
REGISTER_GOAL_NO_UPDATE(GOAL_Skeleton_Bow290001_Battle, 1)
function Skeleton_Bow290001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 12 <= targetDist then
        actPerArr[1] = 100
        actPerArr[2] = 0
        actPerArr[3] = 0
    elseif 3 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 100
        actPerArr[3] = 0
    else
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 100
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Skeleton_Bow290001_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Skeleton_Bow290001_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Skeleton_Bow290001_Act03)
    local local0 = {0, 100, 0, 0, 0, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function Skeleton_Bow290001_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Skeleton_Bow290001_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Skeleton_Bow290001_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_None, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Skeleton_Bow290001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Skeleton_Bow290001Battle_Terminate(ai, goal)
    return 
end

function Skeleton_Bow290001Battle_Interupt(ai, goal)
    local distDamagedStep = 3
    local oddsDamagedStep = 25
    local bkStepPer = 20
    local leftStepPer = 40
    local rightStepPer = 40
    local safetyDist = 3.5
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distResNear = 6
        local distResFar = 18
        local oddsResNear = 0
        local oddsResFar = 15
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
        if ResBehavID == 1 then
            goal:AddSubGoal(GOAL_COMMON_Guard, 2, 9910, TARGET_ENE_0, false, 0)
            return true
        elseif ResBehavID == 2 then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            end
            return true
        else
            return false
        end
    end
end

return 
