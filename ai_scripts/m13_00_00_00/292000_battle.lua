REGISTER_GOAL(GOAL_HonebutoSk_Kouhu292000_Battle, "HonebutoSk_Kouhu292000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.2
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.1
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2.1
local Att3003_Dist_min = 0
local Att3003_Dist_max = 1.4
local Att3004_Dist_min = 0
local Att3004_Dist_max = 5.6
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.5
REGISTER_GOAL_NO_UPDATE(GOAL_HonebutoSk_Kouhu292000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3004_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function HonebutoSk_Kouhu292000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if not ai:HasSpecialEffectId(TARGET_SELF, 5401) then
        actPerArr[4] = 100
    elseif 6.6 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 0
        actPerArr[3] = 80
        actPerArr[9] = 10
    elseif 3.2 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 40
        actPerArr[3] = 0
        actPerArr[9] = 30
    else
        actPerArr[1] = 50
        actPerArr[2] = 25
        actPerArr[3] = 0
        actPerArr[9] = 25
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, HonebutoSk_Kouhu292000_Act01)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 50
    local0[4] = 50
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3004_Dist_max, 0, 3004, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, HonebutoSk_Kouhu292000_Act04)
    local0 = {Att3002_Dist_max, 0, 50, 50, 3002, 3003, nil, 100}
    defFuncParamTbl[9] = local0
    local0 = {0, 35, 5, 30, 0, 15, 15}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function HonebutoSk_Kouhu292000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3005
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, 0, 180)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HonebutoSk_Kouhu292000_Act04(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_SELF, DIST_None)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HonebutoSk_Kouhu292000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HonebutoSk_Kouhu292000Battle_Terminate(ai, goal)
    return 
end

function HonebutoSk_Kouhu292000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distDamagedStep = 3
    local oddsDamagedStep = 25
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 4
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distGuardBreak_Act = 3.2
        local oddsGuardBreak_Act = 50
        if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
            if 1.5 <= targetDist then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distMissSwing_Int = 5.6
            local oddsMissSwing_Int = 30
            if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                if 3.2 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
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
