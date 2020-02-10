REGISTER_GOAL(GOAL_Burrower_C339003_Battle, "Burrower_C339003Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0
local Att3001_Dist_min = 0
local Att3001_Dist_max = 0
local Att3002_Dist_min = 0
local Att3002_Dist_max = 6.3
local Att3004_Dist_min = 5.7
local Att3004_Dist_max = 7.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 6.15
local Att3006_Dist_min = 0
local Att3006_Dist_max = 0
local Att3007_Dist_min = 0
local Att3007_Dist_max = 0
local Att3009_Dist_min = 0
local Att3009_Dist_max = 6.6
REGISTER_GOAL_NO_UPDATE(GOAL_Burrower_C339003_Battle, 1)
function Burrower_C339003Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local fate4 = ai:GetRandam_Int(1, 100)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act08Per = 0
    local Act09Per = 0
    ai:AddObserveChrDmySphere(0, TARGET_ENE_0, 60, 1.8)
    ai:AddObserveChrDmySphere(1, TARGET_ENE_0, 61, 1.8)
    ai:AddObserveChrDmySphere(2, TARGET_ENE_0, 62, 1.8)
    ai:AddObserveChrDmySphere(3, TARGET_ENE_0, 63, 1.8)
    ai:AddObserveChrDmySphere(4, TARGET_ENE_0, 64, 1.8)
    ai:AddObserveChrDmySphere(5, TARGET_ENE_0, 65, 1.8)
    ai:AddObserveChrDmySphere(6, TARGET_ENE_0, 66, 1.8)
    ai:AddObserveChrDmySphere(7, TARGET_ENE_0, 67, 1.8)
    if not not ai:IsInsideObserve(0) or ai:IsInsideObserve(4) then
        Act01Per = 100
        Act04Per = 100
    end
    if not not ai:IsInsideObserve(1) or ai:IsInsideObserve(5) then
        Act02Per = 100
    end
    if not not ai:IsInsideObserve(2) or ai:IsInsideObserve(6) then
        Act07Per = 100
    end
    if not not ai:IsInsideObserve(3) or ai:IsInsideObserve(7) then
        Act06Per = 100
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 110) and targetDist <= 6.3 then
        Act03Per = 200
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 130) and targetDist <= 6.6 then
        Act08Per = 200
    end
    if 6.15 <= targetDist then
        Act09Per = 100
    else
        Act05Per = 100
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act09Per)
    if fateAct <= Act01Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, DIST_Middle, 0, -1)
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_Middle, 0, -1)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), TARGET_NONE, 0, 0, 0)
    end
    Burrower_C339003_ActAfter_AdjustSpace(ai, goal)
    return 
end

function Burrower_C339003_ActAfter_AdjustSpace(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 30 then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1.5), TARGET_NONE, 0, 0, 0)
    end
    return 
end

function Burrower_C339003Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Burrower_C339003Battle_Terminate(ai, goal)
    return 
end

function Burrower_C339003Battle_Interupt(ai, goal)
    return false
end

return 
