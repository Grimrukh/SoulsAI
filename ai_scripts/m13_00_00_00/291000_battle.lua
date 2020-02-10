REGISTER_GOAL(GOAL_BigSk_Sword291000_Battle, "BigSk_Sword291000Battle")
local Att3000_Dist_min = 2.7
local Att3000_Dist_max = 5.2
local Att3002_Dist_min = 4.1
local Att3002_Dist_max = 6
local Att3003_Dist_min = 3.2
local Att3003_Dist_max = 5.1
local Att3005_Dist_min = 0
local Att3005_Dist_max = 1.5
local Att3006_Dist_min = 0
local Att3006_Dist_max = 2.2
REGISTER_GOAL_NO_UPDATE(GOAL_BigSk_Sword291000_Battle, 1)
Att3000_Dist_min = Att3002_Dist_max
function BigSk_Sword291000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 6 <= targetDist then
        actPerArr[2] = 25
        actPerArr[3] = 35
        actPerArr[4] = 25
        actPerArr[5] = 10
        actPerArr[6] = 5
    elseif 4.1 <= targetDist then
        actPerArr[2] = 25
        actPerArr[3] = 25
        actPerArr[4] = 25
        actPerArr[5] = 15
        actPerArr[6] = 10
    elseif 3.1 <= targetDist then
        actPerArr[2] = 20
        actPerArr[3] = 30
        actPerArr[4] = 20
        actPerArr[5] = 10
        actPerArr[6] = 20
    elseif 2.7 <= targetDist then
        actPerArr[2] = 15
        actPerArr[3] = 25
        actPerArr[4] = 15
        actPerArr[5] = 20
        actPerArr[6] = 25
    else
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 50
        actPerArr[6] = 50
    end
    actFuncArr[2] = REGIST_FUNC(ai, goal, BigSk_Sword291000_Act02)
    local local0 = {Att3002_Dist_max, 75, 3002, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, BigSk_Sword291000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, BigSk_Sword291000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, BigSk_Sword291000_Act06)
    local atkAfterFunc = REGIST_FUNC(ai, goal, BigSkSword291000_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function BigSk_Sword291000_Act02(ai, goal, paramTbl)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 70
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 75 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function BigSk_Sword291000_Act04(ai, goal, paramTbl)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 70
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 10 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 70 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    elseif fate <= 85 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function BigSk_Sword291000_Act05(ai, goal, paramTbl)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 70
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function BigSk_Sword291000_Act06(ai, goal, paramTbl)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 70
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function BigSkSword291000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local KN_fate = ai:GetRandam_Int(1, 100)
    if KN_fate > 40 then
        if KN_fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 0)
            return true
        elseif KN_fate <= 60 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 0)
            return true
        elseif KN_fate <= 70 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
            return true
        elseif KN_fate <= 80 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 10, TARGET_ENE_0, 4, TARGET_ENE_0, true, 9910)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 0)
            return true
        end
    else
        return false
    end
end

function BigSk_Sword291000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BigSk_Sword291000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function BigSk_Sword291000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distResponse = 3
    local oddsResponse = 25
    local oddsStep = 20
    local bkStepPer = 40
    local leftStepPer = 30
    local rightStepPer = 30
    local safetyDist = 5
    local oddsLeaveAndSide = 50
    local timeSide = 4.5
    local distLeave = 2.5
    if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
        return true
    else
        local distGuardBreak_Act = 8
        local oddsGuardBreak_Act = 50
        if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
            if targetDist <= 3.5 then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3005_Dist_max, TARGET_SELF, false, 9910)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
            elseif targetDist <= 5.4 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, 9910)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            local distUseItem_Act = 8
            local oddsUseItem_Act = 15
            if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
                if targetDist <= 1.8 then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
                elseif targetDist <= 5.4 then
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                else
                    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, 9910)
                    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
                end
                return true
            else
                local distResNear = 8
                local distResFar = 20
                local oddsResNear = 0
                local oddsResFar = 15
                local fate = ai:GetRandam_Int(1, 100)
                local fate2 = ai:GetRandam_Int(1, 100)
                local targetDist = ai:GetDist(TARGET_ENE_0)
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
                    return false
                end
            end
        end
    end
end

return 
