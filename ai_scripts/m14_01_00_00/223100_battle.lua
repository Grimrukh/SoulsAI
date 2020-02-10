REGISTER_GOAL(GOAL_SnowDemon223100_Battle, "SnowDemon223100Battle")
local Att3000_Dist_min = 6
local Att3000_Dist_max = 12
local Att3002_Dist_min = 4
local Att3002_Dist_max = 12
local Att3004_Dist_min = 14
local Att3004_Dist_max = 19
local Att3005_Dist_min = -3
local Att3005_Dist_max = 2
local Att3006_Dist_min = 3
local Att3006_Dist_max = 10
local Att3007_Dist_min = -3
local Att3007_Dist_max = 5
REGISTER_GOAL_NO_UPDATE(GOAL_SnowDemon223100_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
function SnowDemon223100Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 14 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 5
        actPerArr[4] = 0
        actPerArr[5] = 20
        actPerArr[6] = 0
        actPerArr[7] = 65
        actPerArr[8] = 0
    elseif 10 <= targetDist then
        actPerArr[1] = 50
        actPerArr[2] = 40
        actPerArr[4] = 0
        actPerArr[5] = 10
        actPerArr[6] = 0
        actPerArr[7] = 0
        actPerArr[8] = 0
    elseif 6 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 25
        actPerArr[4] = 0
        actPerArr[5] = 40
        actPerArr[6] = 0
        actPerArr[7] = 0
        actPerArr[8] = 10
    elseif 2 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 0
        actPerArr[5] = 50
        actPerArr[6] = 10
        actPerArr[7] = 0
        actPerArr[8] = 40
    elseif 0.5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 45
        actPerArr[5] = 0
        actPerArr[6] = 15
        actPerArr[7] = 0
        actPerArr[8] = 40
    else
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[4] = 55
        actPerArr[5] = 0
        actPerArr[6] = 15
        actPerArr[7] = 0
        actPerArr[8] = 30
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, SnowDemon223100_Act01)
    local local0 = {Att3000_Dist_max, 0, 20, 80}
    defFuncParamTbl[2] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, SnowDemon223100_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, SnowDemon223100_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, SnowDemon223100_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, SnowDemon223100_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, SnowDemon223100_Act08)
    local atkAfterFunc = REGIST_FUNC(ai, goal, SnowDemon223100_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function SnowDemon223100_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function SnowDemon223100_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3005
    local AttDist = DIST_Middle
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function SnowDemon223100_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3006
    local AttDist = DIST_Far
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function SnowDemon223100_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3007
    local AttDist = DIST_Middle
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function SnowDemon223100_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 6
    local Odds_Guard = 0
    local AttID = 3004
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function SnowDemon223100_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 2)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function SnowDemon223100_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 75 then
        if fate <= 90 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2.5, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(15, 30), true, true, -1)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, -1, AI_DIR_TYPE_B, 6)
            return true
        end
    else
        return false
    end
end

function SnowDemon223100Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function SnowDemon223100Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3006_Dist_max
function SnowDemon223100Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local superStepDist = 3
    local superStepPer = 5
    local bkStepPer = 100
    local leftStepPer = 0
    local rightStepPer = 0
    local safetyDist = 6
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 5
        local bkStepPer = 100
        local leftStepPer = 0
        local rightStepPer = 0
        local safetyDist = 6
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distUseItem_Act = 15
            local oddsUseItem_Act = 15
            local targetDist = ai:GetDist(TARGET_ENE_0)
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if 10.5 <= targetDist then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                elseif 5.2 <= targetDist then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, -1)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
                    end
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                return false
            end
        end
    end
end

return 
