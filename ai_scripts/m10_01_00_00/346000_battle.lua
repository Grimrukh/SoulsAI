REGISTER_GOAL(GOAL_ArmoredTask346000_Battle, "ArmoredTask346000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2
local Att3001_Dist_min = 0
local Att3001_Dist_max = 10
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1.4
local Att3004_Dist_min = 0
local Att3004_Dist_max = 1.6
local Att3005_Dist_min = 0
local Att3005_Dist_max = 1.6
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1.1
local Att3007_Dist_min = 0
local Att3007_Dist_max = 3.5
local Att3008_Dist_min = 0
local Att3008_Dist_max = 8
local Att3009_Dist_min = 2.5
local Att3009_Dist_max = 4
REGISTER_GOAL_NO_UPDATE(GOAL_ArmoredTask346000_Battle, 1)
Att3000_Dist_min = Att3009_Dist_max
Att3000_Dist_min = Att3009_Dist_min
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3008_Dist_max
Att3000_Dist_min = Att3001_Dist_max
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3007_Dist_max
function ArmoredTask346000Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local kakutimer = ai:GetRandam_Int(120, 180)
    local eventNo = ai:GetEventRequest(0)
    local FlagGoHome = 0
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local GetWellSpace_Odds = 0
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act08Per = 0
    local Act09Per = 0
    local Act10Per = 0
    ai:SetEventMoveTarget(1012772)
    local DistToPointA = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    ai:SetEventMoveTarget(1012773)
    local DistToPointB = ai:GetDistAtoB(POINT_EVENT, TARGET_SELF)
    if eventNo == 1 then
        if ai:IsInsideTargetRegion(TARGET_SELF, 1012770) and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1012770) then
            FlagGoHome = 1
            Act09Per = 100
        elseif ai:IsInsideTargetRegion(TARGET_SELF, 1012771) and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1012771) then
            FlagGoHome = 1
            Act10Per = 100
        end
    elseif not ai:IsInsideTargetRegion(TARGET_ENE_0, 1012770) and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1012771) then
        FlagGoHome = 1
        Act09Per = 100
    end
    if FlagGoHome == 0 then
        if ai:IsFinishTimer(0) == true and 12 <= targetDist then
            ai:SetTimer(0, kakutimer)
            Act04Per = 100
        elseif targetDist <= 1.1 and fate <= 80 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 45) then
            Act07Per = 100
        elseif targetDist <= 2 and fate <= 80 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 90) then
            Act05Per = 100
        elseif targetDist <= 2 and fate <= 80 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 90) then
            Act06Per = 100
        elseif 12 <= targetDist then
            Act01Per = 25
            Act02Per = 55
            Act03Per = 20
            Act08Per = 0
        elseif 4 <= targetDist then
            Act01Per = 40
            Act02Per = 35
            Act03Per = 20
            Act08Per = 5
        else
            Act01Per = 35
            Act02Per = 10
            Act03Per = 35
            Act08Per = 20
        end
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per + Act10Per)
    if fateAct <= Act01Per then
        if 6 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Att3009_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_Middle, 1.5, 30)
        elseif 4.5 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Att3009_Dist_min, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_Middle, 1.5, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 1.5, -1)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per then
        if 10 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Att3008_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_Middle, 1.5, 30)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, Att3001_Dist_max, TARGET_SELF, true, -1)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 1.5, 30)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        local approachDist = Att3002_Dist_max
        local dashDist = Att3002_Dist_max + 2
        local Odds_Guard = 0
        BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 1, 20)
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3003, TARGET_ENE_0, DIST_None)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, Att3008_Dist_max, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_Middle, 1.5, 30)
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
        GetWellSpace_Odds = 0
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        local approachDist = Att3007_Dist_max
        local dashDist = Att3007_Dist_max + 2
        local Odds_Guard = 0
        BusyApproach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 1.5, 10)
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per then
        if 2 <= DistToPointA then
            ai:SetEventMoveTarget(1012772)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 1, TARGET_SELF, true, -1)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
        goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    else
        if 2 <= DistToPointB then
            ai:SetEventMoveTarget(1012773)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_EVENT, 1, TARGET_SELF, true, -1)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_SELF)
        goal:AddSubGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 0, 0, 0)
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        ArmoredTask346000_ActAfter_AdjustSpace(ai, goal)
    end
    return 
end

function ArmoredTask346000_ActAfter_AdjustSpace(ai, goal)
    local KN_fate = ai:GetRandam_Int(1, 100)
    if KN_fate > 80 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 3)
    end
    return 
end

function ArmoredTask346000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ArmoredTask346000Battle_Terminate(ai, goal)
    return 
end

function ArmoredTask346000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    return false
end

return 
