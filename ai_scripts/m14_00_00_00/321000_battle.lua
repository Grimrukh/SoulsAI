REGISTER_GOAL(GOAL_Tamago321000_Battle, "Tamago321000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.1
local Att3001_Dist_min = 0
local Att3001_Dist_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_Tamago321000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3001_Dist_max
function Tamago321000Battle_Activate(ai, goal)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local Act01Per = 0
    local Act02Per = 0
    if 1.5 <= targetDist then
        Act01Per = 40
        Act02Per = 60
    else
        Act01Per = 20
        Act02Per = 80
    end
    local doAdmirer = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local Odds_Guard = 0
    if doAdmirer == 1 and role == ROLE_TYPE_Torimaki then
        Torimaki_Act(ai, goal, Odds_Guard)
    elseif doAdmirer == 1 and role == ROLE_TYPE_Kankyaku then
        Kankyaku_Act(ai, goal, Odds_Guard)
    else
        local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per)
        if fateAct <= Act01Per then
            local approachDist = Att3000_Dist_max
            local dashDist = Att3000_Dist_max + 1
            local Odds_Guard = 0
            local AttID = 3000
            local AttDist = DIST_Near
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            GetWellSpace_Odds = 100
        elseif fateAct <= Act01Per + Act02Per then
            local approachDist = Att3001_Dist_max
            local dashDist = Att3001_Dist_max + 1
            local Odds_Guard = 0
            local AttID = 3001
            local AttDist = DIST_Near
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            GetWellSpace_Odds = 100
        end
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        local Odds_Guard = 0
        local Odds_NoAct = 80
        local Odds_BackAndSide = 0
        local Odds_Back = 5
        local Odds_BitWait = 15
        local Odds_Backstep = 0
        GetWellSpace_Act(ai, goal, Odds_Guard, Odds_NoAct, Odds_BackAndSide, Odds_Back, Odds_BitWait, Odds_Backstep)
    end
    return 
end

function Tamago321000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Tamago321000Battle_Terminate(ai, goal)
    return 
end

function Tamago321000Battle_Interupt(ai, goal)
    return false
end

return 
