REGISTER_GOAL(GOAL_Darkwraith239000_Battle, "Darkwraith239000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2
local Att3004_Dist_min = 4
local Att3004_Dist_max = 5.6
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.1
local Att3007_Dist_min = 0
local Att3007_Dist_max = 1.6
local Att3008_Dist_min = 0
local Att3008_Dist_max = 1.2
REGISTER_GOAL_NO_UPDATE(GOAL_Darkwraith239000_Battle, 1)
Att3000_Dist_min = Att3008_Dist_max
Att3000_Dist_min = Att3004_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function Darkwraith239000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 8 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 10
        actPerArr[4] = 0
        actPerArr[7] = 85
        actPerArr[9] = 5
    elseif 5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 10
            actPerArr[2] = 15
            actPerArr[4] = 35
            actPerArr[7] = 20
            actPerArr[9] = 20
        else
            actPerArr[1] = 5
            actPerArr[2] = 30
            actPerArr[4] = 0
            actPerArr[7] = 35
            actPerArr[9] = 25
        end
    elseif 3.5 <= targetDist then
        if ai:IsTargetGuard(TARGET_ENE_0) == true then
            actPerArr[1] = 15
            actPerArr[2] = 10
            actPerArr[4] = 40
            actPerArr[7] = 5
            actPerArr[9] = 30
        else
            actPerArr[1] = 15
            actPerArr[2] = 35
            actPerArr[4] = 0
            actPerArr[7] = 15
            actPerArr[9] = 35
        end
    elseif ai:IsTargetGuard(TARGET_ENE_0) == true then
        actPerArr[1] = 20
        actPerArr[2] = 10
        actPerArr[4] = 50
        actPerArr[7] = 0
        actPerArr[9] = 20
    else
        actPerArr[1] = 20
        actPerArr[2] = 35
        actPerArr[4] = 10
        actPerArr[7] = 0
        actPerArr[9] = 35
    end
    local local0 = {Att3008_Dist_max, 100, 3008, DIST_Middle}
    defFuncParamTbl[1] = local0
    actFuncArr[2] = REGIST_FUNC(ai, goal, Darkwraith239000_Act02)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Darkwraith239000_Act04)
    local0 = {Att3004_Dist_max, 30, 3004, DIST_Middle}
    defFuncParamTbl[7] = local0
    local0 = {Att3005_Dist_max, 30, 30, 70, 3005, 3006, nil}
    defFuncParamTbl[9] = local0
    local0 = {100, 60, 5, 5, 0, 15, 15}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Darkwraith239000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 5 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 15 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function Darkwraith239000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 2
    local Odds_Guard = 30
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Darkwraith239000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Darkwraith239000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function Darkwraith239000Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local fate3 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local distResponse = 3
        local oddsResponse = 15
        local oddsStep = 20
        local bkStepPer = 60
        local leftStepPer = 20
        local rightStepPer = 20
        local safetyDist = 3.5
        local oddsLeaveAndSide = 50
        local oddsSideAndLeave = 25
        local timeSide = 4.5
        local distLeave = 2.5
        if FindAttack_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, oddsSide, oddsSideAndLeave, timeSide, distLeave) then
            return true
        else
            local distResponse = 3
            local oddsResponse = 25
            local oddsStep = 20
            local bkStepPer = 60
            local leftStepPer = 20
            local rightStepPer = 20
            local safetyDist = 3.5
            local oddsLeaveAndSide = 50
            local oddsSideAndLeave = 25
            local timeSide = 4.5
            local distLeave = 2.5
            if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, oddsSide, oddsSideAndLeave, timeSide, distLeave) then
                return true
            else
                local distGuardBreak_Act = 5.6
                local oddsGuardBreak_Act = 30
                if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
                    if targetDist <= 1 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
                    elseif targetDist <= 2 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                    end
                    return true
                else
                    local distMissSwing_Int = 5.6
                    local oddsMissSwing_Int = 30
                    if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                        if targetDist <= 2 then
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                        else
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                        end
                        return true
                    else
                        local distUseItem_Act = 5.6
                        local oddsUseItem_Act = 60
                        if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                            if targetDist <= 1 then
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
                            elseif targetDist <= 2 then
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                            else
                                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, 9910)
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                            end
                            return true
                        else
                            local distResNear = 5.6
                            local distResFar = 18
                            local oddsResNear = 0
                            local oddsResFar = 50
                            local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                            if ResBehavID == 1 then
                                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
                                return true
                            elseif ResBehavID == 2 then
                                if fate <= 50 then
                                    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
                                    return true
                                elseif fate <= 75 then
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
                                    local distSuccessGuard_Act = 5.6
                                    local oddsSuccessGuard_Act = 60
                                    if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
                                        if targetDist <= 2 then
                                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                                        else
                                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                                        end
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
    end
end

return 
