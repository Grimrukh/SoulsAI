REGISTER_GOAL(GOAL_HusibitoKojiki251000_Battle, "HusibitoKojiki251000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.3
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.3
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2.6
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.2
local Att3004_Dist_min = 0
local Att3004_Dist_max = 3.8
local Att3005_Dist_min = 0
local Att3005_Dist_max = 0
local Att3006_Dist_min = 0
local Att3006_Dist_max = 0
REGISTER_GOAL_NO_UPDATE(GOAL_HusibitoKojiki251000_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function HusibitoKojiki251000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if 3.8 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[3] = 10
        actPerArr[7] = 80
    else
        actPerArr[1] = 30
        actPerArr[2] = 40
        actPerArr[3] = 30
        actPerArr[7] = 0
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
    local0 = {Att3003_Dist_max, 0, 3003, DIST_Middle}
    defFuncParamTbl[3] = local0
    local0 = {Att3004_Dist_max, 0, 3004, DIST_Middle}
    defFuncParamTbl[7] = local0
    local0 = {0, 45, 20, 20, 0, 8, 7}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

function HusibitoKojiki251000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusibitoKojiki251000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function HusibitoKojiki251000Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 15
        local bkStepPer = 30
        local leftStepPer = 35
        local rightStepPer = 35
        local safetyDist = 4
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distMissSwing_Int = 5.8
            local oddsMissSwing_Int = 30
            local targetDist = ai:GetDist(TARGET_ENE_0)
            if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                if 2.4 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local oddsResponse = 20
                local bkStepPer = 30
                local leftStepPer = 35
                local rightStepPer = 35
                local safetyDist = 4
                if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
                    return true
                else
                    return false
                end
            end
        end
    end
end

return 
