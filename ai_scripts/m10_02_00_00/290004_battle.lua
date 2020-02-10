REGISTER_GOAL(GOAL_Sk_LarFal_non_scr290004_Battle, "Sk_LarFal_non_scr290004Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.7
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3
local Att3004_Dist_min = 0
local Att3004_Dist_max = 2.5
local Att3008_Dist_min = 3.9
local Att3008_Dist_max = 6.9
REGISTER_GOAL_NO_UPDATE(GOAL_Sk_LarFal_non_scr290004_Battle, 1)
Att3000_Dist_min = Att3008_Dist_max
function Sk_LarFal_non_scr290004Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        actPerArr[3] = 100
    elseif 12 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 5
        actPerArr[7] = 75
    elseif 8 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 15
        actPerArr[3] = 5
        actPerArr[7] = 65
    elseif 5 <= targetDist then
        actPerArr[1] = 25
        actPerArr[2] = 25
        actPerArr[3] = 10
        actPerArr[7] = 40
    elseif 1 <= targetDist then
        actPerArr[1] = 35
        actPerArr[2] = 35
        actPerArr[3] = 30
    else
        actPerArr[1] = 25
        actPerArr[2] = 25
        actPerArr[3] = 50
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Sk_LarFal_non_scr290004_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Sk_LarFal_non_scr290004_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Sk_LarFal_non_scr290004_Act03)
    local local0 = {Att3008_Dist_max, 75, 3008, DIST_Middle}
    defFuncParamTbl[7] = local0
    local atkAfterFunc = REGIST_FUNC(ai, goal, Sk_LarFal_non_scr290004_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function Sk_LarFal_non_scr290004_Act01(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_ApproachStep, 5, 700, TARGET_ENE_0, Att3004_Dist_max, 0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function Sk_LarFal_non_scr290004_Act02(ai, goal, paramTbl)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function Sk_LarFal_non_scr290004_Act03(ai, goal, paramTbl)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Sk_LarFal_non_scr290004_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local KN_fate = ai:GetRandam_Int(1, 100)
    if KN_fate > 25 then
        if KN_fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0)
            return true
        elseif KN_fate <= 75 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0)
            return true
        elseif KN_fate <= 0 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 700, TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 700, TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 700, TARGET_SELF, 0, AI_DIR_TYPE_F, 4)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
            return true
        end
    else
        return false
    end
end

function Sk_LarFal_non_scr290004Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Sk_LarFal_non_scr290004Battle_Terminate(ai, goal)
    return 
end

function Sk_LarFal_non_scr290004Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local superStepDist = 3
        local superStepPer = 25
        local bkStepPer = 40
        local leftStepPer = 30
        local rightStepPer = 30
        local safetyDist = 3.5
        if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            local distDamagedStep = 3
            local oddsDamagedStep = 25
            local bkStepPer = 40
            local leftStepPer = 30
            local rightStepPer = 30
            local safetyDist = 3.5
            if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
                return true
            else
                local distMissSwing_Int = 3.1
                local oddsMissSwing_Int = 50
                if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                    if targetDist <= 2.2 then
                        if fate <= 50 then
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                        else
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                        end
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                    end
                    return true
                else
                    local distUseItem_Act = 6
                    local oddsUseItem_Act = 5
                    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                        if targetDist <= 3 then
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                        else
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
                        end
                        return true
                    else
                        local distResNear = 6
                        local distResFar = 18
                        local oddsResNear = 20
                        local oddsResFar = 30
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
                            local oddsResponse = 20
                            local bkStepPer = 40
                            local leftStepPer = 30
                            local rightStepPer = 30
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
