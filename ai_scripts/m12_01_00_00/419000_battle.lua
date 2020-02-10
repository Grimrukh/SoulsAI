REGISTER_GOAL(GOAL_BlackDragonsDog419000_Battle, "BlackDragonsDog419000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.1
local Att3001_Dist_min = 1
local Att3001_Dist_max = 3.5
local Att3002_Dist_min = 1.5
local Att3002_Dist_max = 3.6
local Att3006_Dist_min = 1
local Att3006_Dist_max = 2.3
REGISTER_GOAL_NO_UPDATE(GOAL_BlackDragonsDog419000_Battle, 1)
function BlackDragonsDog419000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    if 6 <= targetDist then
        actPerArr[1] = 40
        actPerArr[2] = 60
        actPerArr[3] = 0
        actPerArr[4] = 0
    elseif 1.5 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 35
        actPerArr[3] = 40
        actPerArr[4] = 0
    else
        actPerArr[1] = 20
        actPerArr[2] = 30
        actPerArr[3] = 40
        actPerArr[4] = 10
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, BlackDragonsDog419000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, BlackDragonsDog419000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, BlackDragonsDog419000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, BlackDragonsDog419000_Act04)
    local atkAfterFunc = REGIST_FUNC(ai, goal, BlackDragonsDog419000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function BlackDragonsDog419000_Act01(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local RTime = ai:GetRandam_Int(0.7, 1.7)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if Att3006_Dist_max + 0.5 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, false, -1)
        if fate <= 25 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, 3006, TARGET_ENE_0, DIST_Middle, -1, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3006, TARGET_ENE_0, DIST_Middle, -1, 30)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3004, TARGET_ENE_0, DIST_Middle, 0)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1.5, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
        if fate <= 25 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, 3000, TARGET_ENE_0, DIST_Middle, -1, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3000, TARGET_ENE_0, DIST_Middle, -1, 30)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3004, TARGET_ENE_0, DIST_Middle, 0)
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3001_Dist_max
function BlackDragonsDog419000_Act02(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local RTime = ai:GetRandam_Int(0.7, 1.7)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if Att3002_Dist_max + 0.5 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
        if fate <= 25 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, 3002, TARGET_ENE_0, DIST_Middle, -1, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3002, TARGET_ENE_0, DIST_Middle, -1, 30)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3005, TARGET_ENE_0, DIST_Middle, 0)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1.5, TARGET_ENE_0, Att3001_Dist_max, TARGET_SELF, true, -1)
        if fate <= 25 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, 3001, TARGET_ENE_0, DIST_Middle, -1, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 5, 3001, TARGET_ENE_0, DIST_Middle, -1, 30)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 5, 3005, TARGET_ENE_0, DIST_Middle, 0)
        end
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function BlackDragonsDog419000_Act03(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 2)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 2)
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, 3002, TARGET_ENE_0, DIST_Middle, -1, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function BlackDragonsDog419000_Act04(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 3)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 3)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function BlackDragonsDog419000_ActAfter_AdjustSpace(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1.8, 3), TARGET_ENE_0, 0, 0, 0)
    elseif fate <= 70 then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(2.4, 3.4), TARGET_ENE_0, 0, 0, 0)
    elseif fate <= 85 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1.8, 3), TARGET_ENE_0, 0, 0, 0)
    else
        if fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 3)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 3)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(1.8, 3), TARGET_ENE_0, 0, 0, 0)
    end
    return 
end

function BlackDragonsDog419000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BlackDragonsDog419000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function BlackDragonsDog419000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local superStepDist = 4
    local superStepPer = 35
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 3.5
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        local distDamagedStep = 4
        local oddsDamagedStep = 35
        local bkStepPer = 30
        local leftStepPer = 35
        local rightStepPer = 35
        local safetyDist = 3.5
        if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distMissSwing_Int = 8
            local oddsMissSwing_Int = 50
            if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                if targetDist <= 3 then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3006_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distResNear = 4
                local distResFar = 15
                local oddsResNear = 20
                local oddsResFar = 30
                local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                if ResBehavID == 1 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                    return true
                elseif ResBehavID == 2 then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                    end
                    return true
                else
                    local oddsResponse = 20
                    local bkStepPer = 30
                    local leftStepPer = 35
                    local rightStepPer = 35
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

return 
