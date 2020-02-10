REGISTER_GOAL(GOAL_KingIzalis_Second523100_Battle, "KingIzalis_Second523100Battle")
local Att3000_Dist_min = 4.6
local Att3000_Dist_max = 19
local Att3001_Dist_min = -4.7
local Att3001_Dist_max = 3.5
local Att3002_Dist_min = 4.4
local Att3002_Dist_max = 27
local Att3003_Dist_min = 3.2
local Att3003_Dist_max = 19.5
local Att3004_Dist_min = 6.4
local Att3004_Dist_max = 26.1
REGISTER_GOAL_NO_UPDATE(GOAL_KingIzalis_Second523100_Battle, 1)
Att3000_Dist_min = Att3003_Dist_max
function OnIf_523100(ai, goal, codeNo)
    if codeNo == 0 then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
            local approachDist = Att3003_Dist_max
            local dashDist = Att3003_Dist_max + 2
            local Odds_Guard = 0
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

Att3000_Dist_min = Att3004_Dist_max
function KingIzalis_Second523100Battle_Activate(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if 26.1 <= targetDist then
        local approachDist = Att3004_Dist_max
        local dashDist = Att3004_Dist_max + 0
        local Odds_Guard = 0
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
    elseif 19.5 <= targetDist then
        if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        end
    elseif 10 <= targetDist then
        if fate <= 20 then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
        elseif fate <= 40 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3004, TARGET_ENE_0, DIST_Middle, 0)
            end
        elseif fate <= 70 then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
        end
    elseif fate <= 50 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

function KingIzalis_Second523100Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function KingIzalis_Second523100Battle_Terminate(ai, goal)
    return 
end

function KingIzalis_Second523100Battle_Interupt(ai, goal)
    return false
end

return 
