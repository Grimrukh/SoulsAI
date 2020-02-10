REGISTER_GOAL(GOAL_Sk_Fal_non_screw290003_Battle, "Sk_Fal_non_screw290003Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.2
local Att3004_Dist_min = 0
local Att3004_Dist_max = 3.1
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.5
local Att3008_Dist_min = 3.5
local Att3008_Dist_max = 6.5
REGISTER_GOAL_NO_UPDATE(GOAL_Sk_Fal_non_screw290003_Battle, 1)
Att3000_Dist_min = Att3008_Dist_max
function Sk_Fal_non_screw290003Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        actPerArr[3] = 100
    elseif 8 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 15
        actPerArr[3] = 5
        actPerArr[4] = 0
        actPerArr[7] = 70
        actPerArr[8] = 0
    elseif 3.5 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 20
        actPerArr[3] = 15
        actPerArr[4] = 0
        actPerArr[7] = 30
        actPerArr[8] = 20
    elseif 2.5 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 35
        actPerArr[3] = 20
        actPerArr[4] = 0
        actPerArr[7] = 0
        actPerArr[8] = 25
    else
        actPerArr[1] = 10
        actPerArr[2] = 30
        actPerArr[3] = 20
        actPerArr[4] = 40
        actPerArr[7] = 0
        actPerArr[8] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Sk_Fal_non_screw290003_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Sk_Fal_non_screw290003_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Sk_Fal_non_screw290003_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Sk_Fal_non_screw290003_Act04)
    local local0 = {Att3008_Dist_max, 75, 3008, DIST_Middle}
    defFuncParamTbl[7] = local0
    local atkAfterFunc = REGIST_FUNC(ai, goal, Sk_Fal_non_screw290003_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function Sk_Fal_non_screw290003_Act01(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 80
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function Sk_Fal_non_screw290003_Act02(ai, goal, paramTbl)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 80
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
function Sk_Fal_non_screw290003_Act03(ai, goal, paramTbl)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 80
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function Sk_Fal_non_screw290003_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 80
    local AttID = 3005
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Sk_Fal_non_screw290003_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local KN_fate = ai:GetRandam_Int(1, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local friendNum = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + bRight, TARGET_ENE_0, 2)
    if KN_fate > 10 then
        if KN_fate <= 30 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0)
            return true
        elseif KN_fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0)
            return true
        elseif KN_fate <= 80 and friendNum < 2 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, 9910)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, bRight, ai:GetRandam_Int(30, 45), true, true, 9910)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
            return true
        end
    else
        return false
    end
end

function Sk_Fal_non_screw290003Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Sk_Fal_non_screw290003Battle_Terminate(ai, goal)
    return 
end

function Sk_Fal_non_screw290003Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local ParryDist = 3
        local ParryAng = 60
        local ParryThrowDist = 4
        local ParryThrowAng = 60
        if Parry_Act(ai, goal, ParryDist, ParryAng, ParryThrowDist, ParryThrowAng) then
            return true
        else
            local distResponse = 3
            local oddsResponse = 25
            local oddsStep = 50
            local bkStepPer = 40
            local leftStepPer = 30
            local rightStepPer = 30
            local safetyDist = 3.5
            local oddsLeaveAndSide = 50
            local timeSide = 4.5
            local distLeave = 2.5
            if FindAttack_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
                return true
            else
                local distResponse = 3
                local oddsResponse = 25
                local oddsStep = 50
                local bkStepPer = 40
                local leftStepPer = 30
                local rightStepPer = 30
                local safetyDist = 3.5
                local oddsLeaveAndSide = 50
                local timeSide = 4.5
                local distLeave = 2.5
                if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
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
                        local distUseItem_Act = 6.5
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
end

return 
