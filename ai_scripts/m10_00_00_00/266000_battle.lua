REGISTER_GOAL(GOAL_Husi_Chef266000_Battle, "Husi_Chef266000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.2
local Att3002_Dist_min = 5.5
local Att3002_Dist_max = 7.5
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3.3
local Att3005_Dist_min = 0
local Att3005_Dist_max = 0.8
local Att3007_Dist_min = 0
local Att3007_Dist_max = 0.8
REGISTER_GOAL_NO_UPDATE(GOAL_Husi_Chef266000_Battle, 1)
Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function Husi_Chef266000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 5
        actPerArr[3] = 5
        actPerArr[4] = 5
        actPerArr[7] = 75
    elseif 4 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[3] = 15
        actPerArr[4] = 15
        actPerArr[7] = 30
    else
        actPerArr[1] = 30
        actPerArr[2] = 20
        actPerArr[3] = 20
        actPerArr[4] = 30
        actPerArr[7] = 0
    end
    local local0 = {Att3007_Dist_max, 0, 3007, DIST_Middle}
    defFuncParamTbl[1] = local0
    actFuncArr[2] = REGIST_FUNC(ai, goal, Husi_Chef266000_Act02)
    local0 = {Att3003_Dist_max, 0, 3003, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, Husi_Chef266000_Act04)
    local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[7] = local0
    local0 = {0, 70, 5, 5, 5, 15}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Husi_Chef266000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function Husi_Chef266000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3005
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Husi_Chef266000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Husi_Chef266000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function Husi_Chef266000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distDamagedStep = 3
    local oddsDamagedStep = 15
    local bkStepPer = 100
    local leftStepPer = 0
    local rightStepPer = 0
    local safetyDist = 3
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distGuardBreak_Act = 2.6
        local oddsGuardBreak_Act = 50
        local fate = ai:GetRandam_Int(1, 100)
        if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distUseItem_Act = 9.5
            local oddsUseItem_Act = 15
            local targetDist = ai:GetDist(TARGET_ENE_0)
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if 5.5 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distResNear = 5.5
                local distResFar = 18
                local oddsResNear = 20
                local oddsResFar = 30
                local fate = ai:GetRandam_Int(1, 100)
                local fate2 = ai:GetRandam_Int(1, 100)
                local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                if ResBehavID == 1 then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    return true
                elseif ResBehavID == 2 then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
                    return true
                else
                    local oddsResponse = 20
                    local bkStepPer = 100
                    local leftStepPer = 0
                    local rightStepPer = 0
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
end

return 
