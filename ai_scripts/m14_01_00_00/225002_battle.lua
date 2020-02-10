REGISTER_GOAL(GOAL_Hammer225002_Battle, "Hammer225002Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2
local Att3002_Dist_min = 0
local Att3002_Dist_max = 4
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.9
local Att3004_Dist_min = 6.5
local Att3004_Dist_max = 8.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 3
local Att3006_Dist_min = -1.4
local Att3006_Dist_max = 1.1
REGISTER_GOAL_NO_UPDATE(GOAL_Hammer225002_Battle, 1)
function Hammer225002Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local GetWellSpace_Odds = 100
    if 15 <= targetDist then
        Act01Per = 0
        Act02Per = 0
        Act03Per = 25
        Act04Per = 75
        Act05Per = 0
        Act06Per = 0
    elseif 7 <= targetDist then
        Act01Per = 0
        Act02Per = 0
        Act03Per = 40
        Act04Per = 60
        Act05Per = 0
        Act06Per = 0
    elseif 3 <= targetDist then
        Act01Per = 20
        Act02Per = 15
        Act03Per = 35
        Act04Per = 0
        Act05Per = 15
        Act06Per = 15
    else
        Act01Per = 20
        Act02Per = 20
        Act03Per = 20
        Act04Per = 0
        Act05Per = 20
        Act06Per = 20
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per)
    if fateAct <= Act01Per then
        Hammer225002_Act01(ai, goal)
    elseif fateAct <= Act01Per + Act02Per then
        Hammer225002_Act02(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        Hammer225002_Act03(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        Hammer225002_Act04(ai, goal)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        Hammer225002_Act05(ai, goal)
    else
        Hammer225002_Act06(ai, goal)
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        Hammer225002_GetWellSpace_Act(ai, goal)
    end
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Hammer225002_Act01(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, -1, 17, 10, 10)
    GetWellSpace_Odds = 100
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function Hammer225002_Act02(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, -1, 22, 10, 10)
    GetWellSpace_Odds = 100
    return 
end

Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function Hammer225002_Act03(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if fate <= 50 then
        local approachDist = Att3002_Dist_max
        local dashDist = Att3002_Dist_max + 2
        local Odds_Guard = 0
        BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        if fate2 <= 80 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, -1, 38, 10, 10)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, -1, 38, 10, 10)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, DIST_Middle, 10, 10)
        end
    else
        local approachDist = Att3003_Dist_max
        local dashDist = Att3003_Dist_max + 2
        local Odds_Guard = 0
        BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        if fate2 <= 80 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, -1, 38, 10, 10)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, -1, 38, 10, 10)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, DIST_Middle, 10, 10)
        end
    end
    GetWellSpace_Odds = 100
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function Hammer225002_Act04(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Middle, -1, 27, 10, 10)
    GetWellSpace_Odds = 100
    return 
end

Att3000_Dist_min = Att3005_Dist_max
function Hammer225002_Act05(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, -1, 14, 10, 10)
    GetWellSpace_Odds = 100
    return 
end

Att3000_Dist_min = Att3006_Dist_max
function Hammer225002_Act06(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 0
    BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_Middle, -1, 23, 10, 10)
    GetWellSpace_Odds = 100
    return 
end

function Hammer225002_GetWellSpace_Act(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 75 then
        if fate <= 90 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 6)
            return true
        elseif fate <= 95 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2.5, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(15, 30), true, true, -1)
            return true
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 6, TARGET_ENE_0, true, -1)
            return true
        end
    else
        return false
    end
end

function Hammer225002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Hammer225002Battle_Terminate(ai, goal)
    if ai:GetNumber(0) == 1 then
        ai:SetNumber(0, 0)
    end
    if ai:GetNumber(1) == 1 then
        ai:SetNumber(1, 0)
    end
    return 
end

function Hammer225002Battle_Interupt(ai, goal)
    return false
end

return 
