REGISTER_GOAL(GOAL_WhiteKnight_Sword241000_Battle, "WhiteKnight_Sword241000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.1
local Att3004_Dist_min = 3.5
local Att3004_Dist_max = 5.6
local Att3005_Dist_min = 0
local Att3005_Dist_max = 2.2
local Att3006_Dist_min = 0
local Att3006_Dist_max = 3.1
local Att3007_Dist_min = 0
local Att3007_Dist_max = 2.6
local Att3008_Dist_min = 0
local Att3008_Dist_max = 3.1
local Att3009_Dist_min = 5
local Att3009_Dist_max = 6.5
REGISTER_GOAL_NO_UPDATE(GOAL_WhiteKnight_Sword241000_Battle, 1)
Att3000_Dist_min = Att3005_Dist_max
function WhiteKnight_Sword241000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    ai:AddObserveArea(0, TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_B, 80, 8)
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        if 5.5 <= targetDist then
            actPerArr[4] = 20
        elseif 3.2 <= targetDist then
            actPerArr[4] = 80
        else
            actPerArr[4] = 150
        end
    end
    if 8 <= targetDist then
        actPerArr[1] = 70
        actPerArr[2] = 15
        actPerArr[3] = 0
        actPerArr[5] = 15
    elseif 5.5 <= targetDist then
        actPerArr[1] = 55
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[5] = 25
    elseif 3.2 <= targetDist then
        actPerArr[1] = 15
        actPerArr[2] = 35
        actPerArr[3] = 20
        actPerArr[5] = 20
    else
        actPerArr[1] = 0
        actPerArr[2] = 50
        actPerArr[3] = 25
        actPerArr[5] = 25
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act02)
    local local0 = {Att3005_Dist_max, 0, 3005, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_Act07)
    local atkAfterFunc = REGIST_FUNC(ai, goal, WhiteKnight_Sword241000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function WhiteKnight_Sword241000_Act01(ai, goal, paramTbl)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 75
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Middle, -1, 25)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3000_Dist_max
function WhiteKnight_Sword241000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 75
    local fate = ai:GetRandam_Int(1, 100)
    if fate <= 20 then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 60 then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
    else
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 25)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function WhiteKnight_Sword241000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 2
    local Odds_Guard = 75
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_GuardBreakTunable, 10, 3007, TARGET_ENE_0, DIST_Middle, -1, 25)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function WhiteKnight_Sword241000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 75
    local AttID = 3006
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3008_Dist_max
function WhiteKnight_Sword241000_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3008_Dist_max
    local dashDist = Att3008_Dist_max + 2
    local Odds_Guard = 75
    local AttID = 3008
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3009_Dist_max
function WhiteKnight_Sword241000_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3009_Dist_max
    local dashDist = Att3009_Dist_max + 2
    local Odds_Guard = 75
    local AttID = 3009
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function WhiteKnight_Sword241000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local GW_fate = ai:GetRandam_Int(0, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local friendNum = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + bRight, TARGET_ENE_0, 2)
    if GW_fate <= 20 and friendNum < 2 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, 9910)
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, bRight, ai:GetRandam_Int(30, 45), true, true, 9910)
    elseif GW_fate <= 30 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, 9910)
    elseif GW_fate <= 37 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    elseif GW_fate <= 45 then
        local fate = ai:GetRandam_Int(1, 100)
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
    end
    return 
end

function WhiteKnight_Sword241000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function WhiteKnight_Sword241000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3009_Dist_max
Att3000_Dist_min = Att3008_Dist_max
function WhiteKnight_Sword241000Battle_Interupt(ai, goal)
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
        local distMissSwing_Int = 2.7
        local oddsMissSwing_Int = 30
        if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distUseItem_Act = 6.2
            local oddsUseItem_Act = 60
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if targetDist <= 4 then
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, false, 9910)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distResNear = 4
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
                            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3005_Dist_max, TARGET_SELF, false, 9910)
                            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
                        end
                    elseif fate2 <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                    end
                    return true
                elseif ResBehavID == 2 then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, 9910)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                        return true
                    elseif fate2 <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, 9910)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, 9910)
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
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
                        local distSuccessGuard_Act = 2.7
                        local oddsSuccessGuard_Act = 70
                        if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
                            if fate <= 50 then
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                            else
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
                            end
                            return true
                        elseif ai:IsInsideObserve(0) and ai:IsFinishTimer(0) == true and targetDist <= 6.5 then
                            goal:ClearSubGoal()
                            ai:SetTimer(0, 18)
                            if 3.1 <= targetDist then
                                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, 9910)
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
                            else
                                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3008_Dist_max, TARGET_SELF, false, 9910)
                                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3008, TARGET_ENE_0, DIST_Middle, 0)
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
