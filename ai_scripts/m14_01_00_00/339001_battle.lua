REGISTER_GOAL(GOAL_Burrower_A339001_Battle, "Burrower_A339001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 3.7
local Att3001_Dist_min = 1.2
local Att3001_Dist_max = 5.2
local Att3002_Dist_min = 1.3
local Att3002_Dist_max = 3.4
local Att3003_Dist_min = 4.5
local Att3003_Dist_max = 7.8
local Att3004_Dist_min = 2.8
local Att3004_Dist_max = 6.4
local Att3005_Dist_min = 0
local Att3005_Dist_max = 5
REGISTER_GOAL_NO_UPDATE(GOAL_Burrower_A339001_Battle, 1)
function Burrower_A339001Battle_Activate(ai, goal)
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
    if 7.9 <= targetDist then
        Act06Per = 100
    elseif 6.5 <= targetDist then
        Act04Per = 75
        Act06Per = 25
    elseif 5.1 <= targetDist then
        Act04Per = 50
        Act05Per = 50
    elseif 4.5 <= targetDist then
        Act02Per = 25
        Act04Per = 25
        Act05Per = 25
        Act07Per = 25
    elseif 3.4 <= targetDist then
        Act02Per = 40
        Act05Per = 30
        Act07Per = 30
    elseif 2.8 <= targetDist then
        Act01Per = 20
        Act02Per = 20
        Act03Per = 20
        Act05Per = 20
        Act07Per = 20
    elseif 1.3 <= targetDist then
        Act01Per = 25
        Act02Per = 25
        Act03Per = 25
        Act07Per = 25
    else
        Act01Per = 50
        Act07Per = 50
    end
    if fate2 <= Act01Per then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle)
    elseif fate2 <= Act01Per + Act02Per then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3001, TARGET_ENE_0, DIST_Middle)
    elseif fate2 <= Act01Per + Act02Per + Act03Per then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle)
    elseif fate2 <= Act01Per + Act02Per + Act03Per + Act04Per then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle)
    elseif fate2 <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle)
    elseif fate2 <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), TARGET_NONE, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle)
    end
    Burrower_A339001_ActAfter_AdjustSpace(ai, goal)
    return 
end

function Burrower_A339001_ActAfter_AdjustSpace(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate > 30 then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1.5), TARGET_NONE, 0, 0, 0)
    end
    return 
end

function Burrower_A339001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Burrower_A339001Battle_Terminate(ai, goal)
    return 
end

function Burrower_A339001Battle_Interupt(ai, goal)
    return false
end

return 
