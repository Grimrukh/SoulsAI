REGISTER_GOAL(GOAL_WhiteKnight_Ax241002_Battle, "WhiteKnight_Ax241002Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.2
local Att3004_Dist_min = 0
local Att3004_Dist_max = 2.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.5
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1.6
local Att3008_Dist_min = 3.6
local Att3008_Dist_max = 4.2
local Att3009_Dist_min = 5.3
local Att3009_Dist_max = 6.9
REGISTER_GOAL_NO_UPDATE(GOAL_WhiteKnight_Ax241002_Battle, 1)
Att3000_Dist_min = Att3008_Dist_max
Att3000_Dist_min = Att3009_Dist_max
Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function WhiteKnight_Ax241002Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if 5.3 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 5
        actPerArr[3] = 70
        actPerArr[4] = 0
        actPerArr[5] = 5
        actPerArr[9] = 5
    elseif 3.6 <= targetDist then
        actPerArr[1] = 45
        actPerArr[2] = 15
        actPerArr[3] = 0
        actPerArr[4] = 10
        actPerArr[5] = 15
        actPerArr[9] = 15
    else
        actPerArr[1] = 0
        actPerArr[2] = 35
        actPerArr[3] = 0
        actPerArr[4] = 15
        actPerArr[5] = 15
        actPerArr[9] = 35
    end
    local local0 = {Att3008_Dist_max, 75, 3008, DIST_Middle}
    defFuncParamTbl[1] = local0
    actFuncArr[2] = REGIST_FUNC(ai, goal, WhiteKnight_Ax241002_Act02)
    local0 = {Att3009_Dist_max, 75, 3009, DIST_Middle}
    defFuncParamTbl[3] = local0
    local0 = {Att3006_Dist_max, 75, 3006, DIST_Middle, 3004, DIST_Middle, nil}
    defFuncParamTbl[4] = local0
    actFuncArr[5] = REGIST_FUNC(ai, goal, WhiteKnight_Ax241002_Act05)
    local0 = {}
    local local1, local2 = nil
    local0[1] = Att3005_Dist_max
    local0[2] = 75
    local0[3] = 20
    local0[4] = 80
    local0[5] = 3005
    local0[6] = 3007
    local0[7] = local1
    local0[8] = local2
    defFuncParamTbl[9] = local0
    local atkAfterFunc = REGIST_FUNC(ai, goal, WhiteKnight_Ax241002_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function WhiteKnight_Ax241002_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 75
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate2 <= 50 then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function WhiteKnight_Ax241002_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 75
    local AttID = 3004
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function WhiteKnight_Ax241002_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local GW_fate = ai:GetRandam_Int(0, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local friendNum = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + bRight, TARGET_ENE_0, 2)
    if GW_fate <= 30 and friendNum < 2 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, 9910)
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, bRight, ai:GetRandam_Int(30, 45), true, true, 9910)
    elseif GW_fate <= 60 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, 9910)
    elseif GW_fate <= 80 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    else
        local fate = ai:GetRandam_Int(1, 100)
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
    end
    return 
end

function WhiteKnight_Ax241002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function WhiteKnight_Ax241002Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3004_Dist_max
Att3000_Dist_min = Att3009_Dist_max
function WhiteKnight_Ax241002Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distResponse = 3
    local oddsResponse = 10
    local oddsStep = 30
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
        local distGuardBreak_Act = 2.5
        local oddsGuardBreak_Act = 70
        if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distMissSwing_Int = 2.5
            local oddsMissSwing_Int = 35
            if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                if fate <= 50 then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distUseItem_Act = 6.9
                local oddsUseItem_Act = 55
                if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                    if targetDist <= 5.2 then
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, 9910)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                    end
                    return true
                else
                    local distResNear = 5.2
                    local distResFar = 18
                    local oddsResNear = 40
                    local oddsResFar = 50
                    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
                    if ResBehavID == 1 then
                        if fate <= 80 then
                            if fate2 <= 50 then
                                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, 9910)
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                            else
                                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3004_Dist_max, TARGET_SELF, false, 9910)
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
                            end
                        elseif fate2 <= 50 then
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                        else
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                        end
                        return true
                    elseif ResBehavID == 2 then
                        if fate <= 50 then
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, 9910)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                            return true
                        elseif fate2 <= 50 then
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, 9910)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                        else
                            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, 9910)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                        end
                        return true
                    else
                        local oddsResponse = 35
                        local bkStepPer = 60
                        local leftStepPer = 20
                        local rightStepPer = 20
                        local safetyDist = 3.5
                        if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
                            return true
                        else
                            local distSuccessGuard_Act = 2.5
                            local oddsSuccessGuard_Act = 70
                            if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
                                if fate <= 50 then
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

return 
