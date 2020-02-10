REGISTER_GOAL(GOAL_Kinoko227000_Battle, "Kinoko227000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.5
local Att3002_Dist_min = 0
local Att3002_Dist_max = 3.2
REGISTER_GOAL_NO_UPDATE(GOAL_Kinoko227000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function Kinoko227000Battle_Activate(ai, goal)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local GetWellSpace_Odds = 0
    local Act01Per = 0
    local Act02Per = 0
    if 8 <= targetDist then
        Act01Per = 70
        Act02Per = 30
    else
        Act01Per = 60
        Act02Per = 40
    end
    local doAdmirer = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local Guard = 0
    if doAdmirer == 1 and role == ROLE_TYPE_Torimaki then
        Torimaki_Act(ai, goal, Odds_Guard)
    elseif doAdmirer == 1 and role == ROLE_TYPE_Kankyaku then
        Kankyaku_Act(ai, goal, Odds_Guard)
    else
        local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per)
        if fateAct <= Act01Per then
            local approachDist = Att3000_Dist_max
            local dashDist = Att3000_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
            if fate <= 30 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            elseif fate <= 90 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            end
            GetWellSpace_Odds = 100
        else
            local approachDist = Att3002_Dist_max
            local dashDist = Att3002_Dist_max + 2
            local Odds_Guard = 0
            local AttID = 3002
            local AttDist = DIST_Middle
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            GetWellSpace_Odds = 100
        end
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        local Odds_Guard = 0
        local Odds_NoAct = 70
        local Odds_BackAndSide = 0
        local Odds_Back = 10
        local Odds_BitWait = 20
        local Odds_Backstep = 0
        GetWellSpace_Act(ai, goal, Odds_Guard, Odds_NoAct, Odds_BackAndSide, Odds_Back, Odds_BitWait, Odds_Backstep)
    end
    return 
end

function Kinoko227000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Kinoko227000Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function Kinoko227000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local guardBreakConutDist = 2.9
    local guardBreakConutPer = 50
    if FindGuardBreak_Act(ai, goal, guardBreakConutDist, guardBreakConutPer) then
        local approachDist = Att3002_Dist_max
        local dashDist = Att3002_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3002
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
        return true
    else
        return false
    end
end

return 
