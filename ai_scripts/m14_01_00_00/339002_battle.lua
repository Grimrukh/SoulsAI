REGISTER_GOAL(GOAL_Burrower_B339002_Battle, "Burrower_B339002Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0
local Att3001_Dist_min = 0
local Att3001_Dist_max = 0
local Att3002_Dist_min = 0.5
local Att3002_Dist_max = 2.7
local Att3004_Dist_min = 0
local Att3004_Dist_max = 0
local Att3005_Dist_min = 0
local Att3005_Dist_max = 4.3
local Att3006_Dist_min = 0
local Att3006_Dist_max = 4.4
REGISTER_GOAL_NO_UPDATE(GOAL_Burrower_B339002_Battle, 1)
function Burrower_B339002Battle_Activate(ai, goal)
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
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412315) then
        Act01Per = 100
    end
    if not not ai:IsInsideTargetRegion(TARGET_ENE_0, 1412316) or ai:IsInsideTargetRegion(TARGET_ENE_0, 1412317) then
        Act02Per = 100
    end
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1412318) then
        Act04Per = 250
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 100) and targetDist <= 2.7 and 0.3 <= targetDist then
        Act03Per = 250
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 130) and targetDist <= 4.4 then
        Act05Per = 200
    end
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 100) and targetDist <= 4.4 then
        Act06Per = 200
    end
    if 2.7 <= targetDist then
        Act07Per = 100
    elseif 0.8 <= targetDist then
        Act02Per = 100
        Act03Per = 250
    else
        Act01Per = 100
        Act02Per = 100
        Act03Per = 250
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per)
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
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), TARGET_NONE, 0, 0, 0)
    end
    Burrower_B339002_ActAfter_AdjustSpace(ai, goal)
    return 
end

function Burrower_B339002_ActAfter_AdjustSpace(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 30 then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1.5), TARGET_NONE, 0, 0, 0)
    end
    return 
end

function Burrower_B339002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Burrower_B339002Battle_Terminate(ai, goal)
    return 
end

function Burrower_B339002Battle_Interupt(ai, goal)
    return false
end

return 
