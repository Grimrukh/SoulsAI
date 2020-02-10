REGISTER_GOAL(GOAL_SpearDemon226000_Battle, "SpearDemon226000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 4.5
local Att3003_Dist_min = 4
local Att3003_Dist_max = 6.5
local Att3004_Dist_min = 6.5
local Att3004_Dist_max = 10
local Att3005_Dist_min = 0
local Att3005_Dist_max = 4.5
local Att3006_Dist_min = 12
local Att3006_Dist_max = 25
local Att3007_Dist_min = 0
local Att3007_Dist_max = 4
local Att3008_Dist_min = 0
local Att3008_Dist_max = 4.5
REGISTER_GOAL_NO_UPDATE(GOAL_SpearDemon226000_Battle, 1)
Att3000_Dist_min = Att3008_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3007_Dist_max
function SpearDemon226000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 12 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[9] = 5
        actPerArr[5] = 75
        actPerArr[6] = 0
        actPerArr[7] = 10
    elseif 6.5 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[9] = 10
        actPerArr[5] = 0
        actPerArr[6] = 0
        actPerArr[7] = 70
    elseif 4 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 35
        actPerArr[9] = 25
        actPerArr[5] = 0
        actPerArr[6] = 0
        actPerArr[7] = 15
    else
        actPerArr[1] = 15
        actPerArr[2] = 20
        actPerArr[9] = 15
        actPerArr[5] = 0
        actPerArr[6] = 50
        actPerArr[7] = 0
    end
    local local0 = {Att3008_Dist_max, 0, 3008, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {Att3000_Dist_max, 0, 10, 40}
    defFuncParamTbl[2] = local0
    local0 = {Att3007_Dist_max, 0, 10, 20, 3007, 3009, 3010}
    defFuncParamTbl[9] = local0
    actFuncArr[5] = REGIST_FUNC(ai, goal, SpearDemon226000_Act05)
    local0 = {3005, DIST_Far}
    defFuncParamTbl[6] = local0
    actFuncArr[7] = REGIST_FUNC(ai, goal, SpearDemon226000_Act07)
    local atkAfterFunc = REGIST_FUNC(ai, goal, SpearDemon226000_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
function SpearDemon226000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3006
    local AttDist = DIST_None
    local TurnTime = 1.5
    local TurnFaceAngle = 20
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist, TurnTime, TurnFaceAngle)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function SpearDemon226000_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if targetDist <= 6.5 then
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 30 then
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    else
        local approachDist = Att3004_Dist_max
        local dashDist = Att3004_Dist_max + 2
        local Odds_Guard = 0
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function SpearDemon226000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 45 then
        if fate <= 65 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            return true
        elseif fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
        return true
    else
        return false
    end
end

function SpearDemon226000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function SpearDemon226000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function SpearDemon226000Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local superStepDist = 3
    local superStepPer = 25
    local bkStepPer = 60
    local leftStepPer = 20
    local rightStepPer = 20
    local safetyDist = 3.5
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distDamagedStep = 3
        local oddsDamagedStep = 25
        local bkStepPer = 60
        local leftStepPer = 20
        local rightStepPer = 20
        local safetyDist = 3.5
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distGuardBreak_Act = 6.5
            local oddsGuardBreak_Act = 30
            if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
                if targetDist <= 4 then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distMissSwing_Int = 6.5
                local oddsMissSwing_Int = 50
                if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                    if targetDist <= 4 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                    end
                    return true
                else
                    local distUseItem_Act = 8
                    local oddsUseItem_Act = 60
                    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                        if targetDist <= 4 then
                            if fate <= 50 then
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                            else
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
                            end
                        else
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, false, -1)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                        end
                        return true
                    else
                        local distResNear = 8
                        local distResFar = 18
                        local oddsResNear = 0
                        local oddsResFar = 60
                        local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                        if ResBehavID == 1 then
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                            return true
                        elseif ResBehavID == 2 then
                            if fate <= 25 then
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                                local local0 = true
                                return true
                            elseif fate2 <= 50 then
                                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                            else
                                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                            end
                            return true
                        else
                            local oddsResponse = 50
                            local bkStepPer = 60
                            local leftStepPer = 20
                            local rightStepPer = 20
                            local safetyDist = 3.5
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
    end
end

return 
