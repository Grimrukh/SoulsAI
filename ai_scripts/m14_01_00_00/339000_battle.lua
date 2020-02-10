REGISTER_GOAL(GOAL_Burrower339000_Battle, "Burrower339000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.4
local Att3001_Dist_min = 0
local Att3001_Dist_max = 4.6
local Att3002_Dist_min = 0
local Att3002_Dist_max = 4.6
local Att3003_Dist_min = 0
local Att3003_Dist_max = 8.6
REGISTER_GOAL_NO_UPDATE(GOAL_Burrower339000_Battle, 1)
function Burrower339000Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    ai:AddObserveRegion(0, TARGET_ENE_0, 1412310)
    ai:AddObserveRegion(1, TARGET_ENE_0, 1412311)
    ai:AddObserveRegion(2, TARGET_ENE_0, 1412312)
    ai:AddObserveRegion(3, TARGET_ENE_0, 1412313)
    ai:AddObserveRegion(4, TARGET_ENE_0, 1412314)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local GetWellSpace_Odds = 0
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412310) then
        if 4.6 <= targetDist then
            Act01Per = 30
            Act02Per = 30
            Act03Per = 20
            Act04Per = 20
        else
            Act01Per = 50
            Act02Per = 50
        end
    elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412311) then
        if 4.6 <= targetDist then
            Act04Per = 70
            Act05Per = 30
        else
            Act03Per = 70
            Act05Per = 30
        end
    elseif ai:IsInsideTargetRegion(TARGET_SELF, 1412314) then
        goal:AddSubGoal(GOAL_COMMON_Wait, 3, TARGET_ENE_0)
    else
        Act05Per = 100
    end
    local fate2 = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per)
    if fate2 <= Act01Per then
        Burrower339000_Act01(ai, goal)
        GetWellSpace_Odds = 0
    elseif fate2 <= Act01Per + Act02Per then
        Burrower339000_Act02(ai, goal)
        GetWellSpace_Odds = 0
    elseif fate2 <= Act01Per + Act02Per + Act03Per then
        Burrower339000_Act03(ai, goal)
        GetWellSpace_Odds = 100
    elseif fate2 <= Act01Per + Act02Per + Act03Per + Act04Per then
        Burrower339000_Act04(ai, goal)
        GetWellSpace_Odds = 100
    else
        Burrower339000_Act05(ai, goal)
        GetWellSpace_Odds = 0
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        Burrower339000_GetWellSpace_Act(ai, goal)
    end
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function Burrower339000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 4, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 4, 3000, TARGET_ENE_0, DIST_Middle)
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function Burrower339000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fatetime = ai:GetRandam_Int(0, 5)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 4, TARGET_ENE_0, Att3001_Dist_max, TARGET_SELF, true, -1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3001, TARGET_ENE_0, DIST_Middle)
    ai:SetEventMoveTarget(1412314)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, fatetime, POINT_EVENT, 0, TARGET_ENE_0, True, -1)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function Burrower339000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, true, -1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3002, TARGET_ENE_0, DIST_Middle)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function Burrower339000_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, true, -1)
    goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3003, TARGET_ENE_0, DIST_Middle)
    return 
end

function Burrower339000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fatetime = ai:GetRandam_Int(0, 5)
    ai:SetEventMoveTarget(1412314)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, fatetime, POINT_EVENT, 0, TARGET_ENE_0, True, -1)
    return 
end

function Burrower339000_GetWellSpace_Act(ai, goal)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fatetime = ai:GetRandam_Int(0, 5)
    if fate3 > 30 then
        if fate3 <= 60 then
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1.5), 0, 0, 0, 0)
        else
            ai:SetEventMoveTarget(1412314)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, fatetime, POINT_EVENT, 0, TARGET_ENE_0, True, -1)
        end
    end
    return 
end

function Burrower339000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Burrower339000Battle_Terminate(ai, goal)
    return 
end

function Burrower339000Battle_Interupt(ai, goal)
    local fatetime = ai:GetRandam_Int(0, 5)
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and ai:IsFinishTimer(0) == true then
        if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412310) then
            goal:ClearSubGoal()
            ai:SetTimer(0, 11)
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
            return true
        elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1412311) then
            goal:ClearSubGoal()
            ai:SetTimer(0, 3)
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
            return true
        elseif not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412312) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412313) then
            goal:ClearSubGoal()
            ai:SetTimer(0, 5)
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
            return true
        end
    end
    return false
end

return 
