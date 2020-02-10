REGISTER_GOAL(GOAL_Kyu_DoguKishi412000_Battle, "Kyu_DoguKishi412000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.6
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3.5
local Att3005_Dist_min = 4
local Att3005_Dist_max = 5.5
local Att3006_Dist_min = 4
local Att3006_Dist_max = 6.2
local Att3007_Dist_min = 0
local Att3007_Dist_max = 2
REGISTER_GOAL_NO_UPDATE(GOAL_Kyu_DoguKishi412000_Battle, 1)
function Kyu_DoguKishi412000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distY = ai:GetDistY(TARGET_ENE_0)
    if 20 <= distY then
        actPerArr[6] = 100
    elseif 8 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 50
        actPerArr[4] = 50
        actPerArr[5] = 0
    elseif 4 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 50
        actPerArr[4] = 50
        actPerArr[5] = 0
    elseif 2.5 <= targetDist then
        actPerArr[1] = 35
        actPerArr[2] = 35
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 30
    else
        actPerArr[1] = 40
        actPerArr[2] = 40
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 20
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act03)
    actFuncArr[4] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Kyu_DoguKishi412000_Act06)
    local local0 = {0, 20, 30, 35, 15, 0, 0}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Kyu_DoguKishi412000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 30
    local AttDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate <= 20 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, AttDist, 1, 90)
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, AttDist, 1, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, AttDist, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, AttDist, 1, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, AttDist, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, AttDist, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function Kyu_DoguKishi412000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 30
    local AttDist = Att3003_Dist_max - 0.2
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3003, TARGET_ENE_0, AttDist, 1, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, AttDist, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function Kyu_DoguKishi412000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 30
    local AttDist = Att3005_Dist_max - 2.2
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, AttDist, 1, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, AttDist, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function Kyu_DoguKishi412000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 30
    local AttDist = Att3006_Dist_max + 1
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if ai:IsFinishTimer(0) == false then
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.35, TARGET_ENE_0, 0, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, AttDist, 1, 90)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
function Kyu_DoguKishi412000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3007_Dist_max
    local dashDist = Att3007_Dist_max + 30
    local AttDist = Att3007_Dist_max + 0.5
    local Odds_Guard = 0
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, AttDist, 1, 90)
    ai:SetTimer(0, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kyu_DoguKishi412000_Act06(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, POINT_INITIAL, 2, TARGET_ENE_0, false, -1)
    return 
end

function Kyu_DoguKishi412000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Kyu_DoguKishi412000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3005_Dist_max
Att3000_Dist_min = Att3006_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function Kyu_DoguKishi412000Battle_Interupt(ai, goal)
    local distGuardBreak_Act = 6.5
    local oddsGuardBreak_Act = 35
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local Odds_Guard = 0
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if 4 <= targetDist then
            if fate <= 50 then
                local AttDist = Att3005_Dist_max + 0.8
                local dashDist = Att3005_Dist_max + 30
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3005, TARGET_ENE_0, AttDist, 1, 90)
            else
                local AttDist = Att3006_Dist_max + 1
                local dashDist = Att3006_Dist_max + 30
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3006, TARGET_ENE_0, AttDist, 1, 90)
            end
        elseif fate <= 50 then
            local AttDist = Att3000_Dist_max + 0.5
            local dashDist = Att3000_Dist_max + 30
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3000, TARGET_ENE_0, AttDist, 1, 90)
        else
            local AttDist = Att3003_Dist_max + 0.8
            local dashDist = Att3003_Dist_max + 30
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3003, TARGET_ENE_0, AttDist, 1, 90)
        end
        return true
    else
        local distResNear = 6.5
        local distResFar = 20
        local oddsResNear = 60
        local oddsResFar = 85
        local fate = ai:GetRandam_Int(1, 100)
        local fate2 = ai:GetRandam_Int(1, 100)
        local targetDist = ai:GetDist(TARGET_ENE_0)
        local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
        if ResBehavID == 1 then
            if 4 <= targetDist then
                if fate <= 50 then
                    local AttDist = Att3005_Dist_max + 0.8
                    local dashDist = Att3005_Dist_max + 30
                    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3005, TARGET_ENE_0, AttDist, 1, 90)
                else
                    local AttDist = Att3006_Dist_max + 1
                    local dashDist = Att3006_Dist_max + 30
                    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3006, TARGET_ENE_0, AttDist, 1, 90)
                end
            elseif fate <= 50 then
                local approachDist = Att3000_Dist_max
                local AttDist = Att3000_Dist_max + 0.5
                local dashDist = Att3000_Dist_max + 30
                Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3000, TARGET_ENE_0, AttDist, 1, 90)
            else
                local approachDist = Att3003_Dist_max
                local AttDist = Att3003_Dist_max + 0.8
                local dashDist = Att3003_Dist_max + 30
                Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, 3003, TARGET_ENE_0, AttDist, 1, 90)
            end
            return true
        elseif ResBehavID == 2 then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 4, TARGET_SELF, false, -1)
            return true
        else
            return false
        end
    end
end

return 
