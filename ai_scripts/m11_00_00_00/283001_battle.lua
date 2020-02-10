REGISTER_GOAL(GOAL_HusiPhalanx283001_Battle, "HusiPhalanx283001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.6
local Att3002_Dist_min = 0
local Att3002_Dist_max = 11
local Att3003_Dist_min = 0
local Att3003_Dist_max = 2.1
REGISTER_GOAL_NO_UPDATE(GOAL_HusiPhalanx283001_Battle, 1)
Att3000_Dist_min = Att3002_Dist_min
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3003_Dist_max
function HusiPhalanx283001Battle_Activate(ai, goal)
    ai:AddObserveRegion(0, TARGET_SELF, 1102400)
    ai:AddObserveRegion(1, TARGET_SELF, 1102401)
    ai:AddObserveRegion(2, TARGET_SELF, 1102402)
    ai:AddObserveRegion(3, TARGET_SELF, 1102403)
    ai:AddObserveRegion(4, TARGET_SELF, 1102404)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local waitTime = ai:GetRandam_Float(0.5, 2)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if ai:IsFinishTimer(0) == true then
        ai:SetTimer(0, 9999)
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0, 1), TARGET_ENE_0, 0, 0, 0)
    end
    if role == ROLE_TYPE_Attack then
        if 6 <= targetDist then
            if fate <= 45 then
                local LeaveDist = Att3002_Dist_min
                local approachDist = Att3002_Dist_max
                local dashDist = -1
                local Odds_Guard = 0
                Approach_or_Leave_Act(ai, goal, LeaveDist, approachDist, dashDist, Odds_Guard)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_None, 0)
            elseif fate <= 55 then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
                HusiPhalanx283001Battle_TukiCombo(ai, goal)
                goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
            elseif fate <= 65 then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, true, -1)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
            end
        elseif fate <= 35 then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3000_Dist_max, TARGET_SELF, true, -1)
            HusiPhalanx283001Battle_TukiCombo(ai, goal)
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
        elseif fate <= 65 then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, true, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
        end
    elseif role == ROLE_TYPE_Torimaki then
        if fate <= 10 then
            local LeaveDist = 7
            local approachDist = 9
            local dashDist = -1
            local Odds_Guard = 0
            Approach_or_Leave_Act(ai, goal, LeaveDist, approachDist, dashDist, Odds_Guard)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_None, 0)
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
        end
    elseif fate <= 5 then
        local LeaveDist = 9
        local approachDist = 11
        local dashDist = -1
        local Odds_Guard = 0
        Approach_or_Leave_Act(ai, goal, LeaveDist, approachDist, dashDist, Odds_Guard)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_None, 0)
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 2), TARGET_NONE, 0, 0, 0)
    end
    return 
end

function HusiPhalanx283001Battle_TukiCombo(ai, goal)
    local fate2 = ai:GetRandam_Int(1, 100)
    if fate2 <= 40 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 3, 1)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3000, TARGET_ENE_0, DIST_Middle, 3, 1)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, 3001, TARGET_ENE_0, DIST_Middle, 0)
    end
    return 
end

function HusiPhalanx283001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiPhalanx283001Battle_Terminate(ai, goal)
    return 
end

function HusiPhalanx283001Battle_Interupt(ai, goal)
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and (not not ai:IsInsideObserve(0) or not not ai:IsInsideObserve(1) or not not ai:IsInsideObserve(2) or not not ai:IsInsideObserve(3) or ai:IsInsideObserve(4)) then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, POINT_INITIAL, 1, TARGET_SELF, true, -1)
        goal:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_ENE_0, 0, 0, 0)
        return true
    else
        return false
    end
end

return 
