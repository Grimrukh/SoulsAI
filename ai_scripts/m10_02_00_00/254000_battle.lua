REGISTER_GOAL(GOAL_HusiFight_Sword254000_Battle, "HusiFight_Sword254000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.6
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.2
local Att3005_Dist_min = 2.9
local Att3005_Dist_max = 4.2
local Att3006_Dist_min = 5.7
local Att3006_Dist_max = 6.8
local Att3007_Dist_min = 8.4
local Att3007_Dist_max = 10
local Att3008_Dist_min = 2
local Att3008_Dist_max = 5.7
local Att3010_Dist_min = 1.1
local Att3010_Dist_max = 2
REGISTER_GOAL_NO_UPDATE(GOAL_HusiFight_Sword254000_Battle, 1)
Att3000_Dist_min = Att3010_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function HusiFight_Sword254000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest(3)
    if eventNo == 1 then
        actPerArr[8] = 100
    elseif 8 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 35
        actPerArr[3] = 20
        actPerArr[5] = 0
        actPerArr[7] = 40
    elseif 4 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 50
        actPerArr[3] = 25
        actPerArr[5] = 0
        actPerArr[7] = 15
    elseif 2.5 <= targetDist then
        actPerArr[1] = 30
        actPerArr[2] = 50
        actPerArr[3] = 15
        actPerArr[5] = 0
        actPerArr[7] = 5
    else
        actPerArr[1] = 20
        actPerArr[2] = 50
        actPerArr[3] = 30
        actPerArr[5] = 0
        actPerArr[7] = 0
    end
    local local0 = {Att3010_Dist_max, 0, 3010, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 50
    local0[3] = 5
    local0[4] = 15
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = 80
    defFuncParamTbl[2] = local0
    actFuncArr[3] = REGIST_FUNC(ai, goal, HusiFight_Sword254000_Act03)
    actFuncArr[5] = REGIST_FUNC(ai, goal, HusiFight_Sword254000_Act05)
    actFuncArr[7] = REGIST_FUNC(ai, goal, HusiFight_Sword254000_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, HusiFight_Sword254000_Act08)
    local0 = {100, 75, 9, 8, 0, 4, 4}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HusiFight_Sword254000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 50
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 20 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 55 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3009, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3008_Dist_min
Att3000_Dist_min = Att3008_Dist_max
function HusiFight_Sword254000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local LeaveDist = Att3008_Dist_min
    local approachDist = Att3008_Dist_max
    local dashDist = Att3008_Dist_max + 2
    local Odds_Guard = 100
    Approach_or_Leave_Act(ai, goal, LeaveDist, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3008, TARGET_ENE_0, DIST_None)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_min
Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3006_Dist_min
Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function HusiFight_Sword254000_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if Att3007_Dist_min <= targetDist and fate <= 20 then
        local approachDist = Att3007_Dist_max
        local dashDist = Att3007_Dist_max + 2
        local Odds_Guard = 40
        local AttID = 3007
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    elseif Att3006_Dist_min <= targetDist and fate2 <= 50 then
        local approachDist = Att3006_Dist_max
        local dashDist = Att3006_Dist_max + 2
        local Odds_Guard = 40
        local AttID = 3006
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    else
        local approachDist = Att3005_Dist_max
        local dashDist = Att3005_Dist_max + 2
        local Odds_Guard = 40
        local AttID = 3005
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function HusiFight_Sword254000_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HusiFight_Sword254000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiFight_Sword254000Battle_Terminate(ai, goal)
    return 
end

function HusiFight_Sword254000Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    else
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local fate3 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local distResponse = 3
        local oddsResponse = 15
        local oddsStep = 30
        local bkStepPer = 40
        local leftStepPer = 30
        local rightStepPer = 30
        local safetyDist = 3.5
        local oddsLeaveAndSide = 50
        local timeSide = 3.5
        local distLeave = 2.5
        if FindAttack_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
            return true
        else
            local distResponse = 3
            local oddsResponse = 15
            local oddsStep = 30
            local bkStepPer = 40
            local leftStepPer = 30
            local rightStepPer = 30
            local safetyDist = 3.5
            local oddsLeaveAndSide = 50
            local timeSide = 3.5
            local distLeave = 2.5
            if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
                return true
            else
                local distMissSwing_Int = 4.2
                local oddsMissSwing_Int = 50
                if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
                    if targetDist <= 2.2 then
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                    else
                        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
                    end
                    return true
                else
                    local distResNear = 5.7
                    local distResFar = 15
                    local oddsResNear = 0
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
                            local distSuccessGuard_Act = 4.2
                            local oddsSuccessGuard_Act = 30
                            if SuccessGuard_Act(ai, goal, distSuccessGuard_Act, oddsSuccessGuard_Act) then
                                if targetDist <= 2.2 then
                                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                                else
                                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
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
