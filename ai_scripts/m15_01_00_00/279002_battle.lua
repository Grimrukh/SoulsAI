REGISTER_GOAL(GOAL_BlackKnight_Ax279002_Battle, "BlackKnight_Ax279002Battle")
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
local Att3009_Dist_max = 6
local Att3010_Dist_min = 4.2
local Att3010_Dist_max = 6
local Att3011_Dist_min = 5.3
local Att3011_Dist_max = 2.3
REGISTER_GOAL_NO_UPDATE(GOAL_BlackKnight_Ax279002_Battle, 1)
Att3000_Dist_min = Att3009_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function BlackKnight_Ax279002Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    local MoveAttackOdds = 1
    if not not ai:IsRideEdgeFlag(TARGET_SELF) or ai:IsRideEdgeFlag(TARGET_ENE_0) then
        MoveAttackOdds = 0
    end
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        if 7 <= targetDist then
            actPerArr[4] = 20
        elseif 3 <= targetDist then
            actPerArr[4] = 80
        else
            actPerArr[4] = 150
        end
    end
    if 5.3 <= targetDist then
        actPerArr[1] = 15 * MoveAttackOdds
        actPerArr[2] = 5
        actPerArr[3] = 50 * MoveAttackOdds
        actPerArr[5] = 5
        actPerArr[6] = 25 * MoveAttackOdds
        actPerArr[7] = 0
        actPerArr[9] = 5
    elseif 4.2 <= targetDist then
        actPerArr[1] = 20 * MoveAttackOdds
        actPerArr[2] = 5
        actPerArr[3] = 25 * MoveAttackOdds
        actPerArr[5] = 5
        actPerArr[6] = 30 * MoveAttackOdds
        actPerArr[7] = 5
        actPerArr[9] = 5
    elseif 3.6 <= targetDist then
        actPerArr[1] = 40 * MoveAttackOdds
        actPerArr[2] = 15
        actPerArr[3] = 0 * MoveAttackOdds
        actPerArr[5] = 15
        actPerArr[6] = 0 * MoveAttackOdds
        actPerArr[7] = 5
        actPerArr[9] = 15
    else
        actPerArr[1] = 0
        actPerArr[2] = 25
        actPerArr[3] = 0
        actPerArr[5] = 15
        actPerArr[6] = 0
        actPerArr[7] = 20
        actPerArr[9] = 25
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act02)
    local local0 = {Att3009_Dist_max, 75, 3009, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act05)
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
    actFuncArr[6] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_Act07)
    local atkAfterFunc = REGIST_FUNC(ai, goal, BlackKnight_Ax279002_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3008_Dist_max
function BlackKnight_Ax279002_Act01(ai, goal, paramTbl)
    local approachDist = Att3008_Dist_max
    local dashDist = Att3008_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_Middle, -1, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function BlackKnight_Ax279002_Act02(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 60)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate2 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 60)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 60)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function BlackKnight_Ax279002_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_GuardBreakTunable, 10, 3006, TARGET_ENE_0, DIST_Middle, -1, 25)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function BlackKnight_Ax279002_Act05(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3004, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3010_Dist_max
function BlackKnight_Ax279002_Act06(ai, goal, paramTbl)
    local approachDist = Att3010_Dist_max
    local dashDist = Att3010_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_ENE_0, DIST_Middle, -1, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3011_Dist_max
function BlackKnight_Ax279002_Act07(ai, goal, paramTbl)
    local approachDist = Att3011_Dist_max
    local dashDist = Att3011_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3011, TARGET_ENE_0, DIST_Middle, -1, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function BlackKnight_Ax279002_ActAfter_AdjustSpace(ai, goal, paramTbl)
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

function BlackKnight_Ax279002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BlackKnight_Ax279002Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function BlackKnight_Ax279002Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distResponse = 3
    local oddsResponse = 25
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
                elseif not ai:IsRideEdgeFlag(TARGET_SELF) and not ai:IsRideEdgeFlag(TARGET_ENE_0) then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distResNear = 6
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
                    elseif fate <= 75 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
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

return 
