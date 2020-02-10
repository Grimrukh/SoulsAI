REGISTER_GOAL(GOAL_HusiMino_Gun253002_Battle, "HusiMino_Gun253002Battle")
local Att3006_Dist_min = 0
local Att3006_Dist_max = 1
local Att3007_Dist_min = 4
local Att3007_Dist_max = 6
REGISTER_GOAL_NO_UPDATE(GOAL_HusiMino_Gun253002_Battle, 1)
Att3006_Dist_min = Att3006_Dist_max
function HusiMino_Gun253002Battle_Activate(ai, goal)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local GetWellSpace_Odds = 0
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    if 20 <= targetDist then
        Act01Per = 100
        Act02Per = 0
        Act03Per = 0
        Act04Per = 0
    elseif 10 <= targetDist then
        Act01Per = 70
        Act02Per = 30
        Act03Per = 0
        Act04Per = 0
    elseif 5 <= targetDist then
        Act01Per = 0
        Act02Per = 60
        Act03Per = 40
        Act04Per = 0
    elseif 1 <= targetDist then
        Act01Per = 0
        Act02Per = 20
        Act03Per = 80
        Act04Per = 0
    else
        Act01Per = 0
        Act02Per = 0
        Act03Per = 20
        Act04Per = 80
    end
    local doAdmirer = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local Odds_Guard = 0
    if doAdmirer == 1 and role == ROLE_TYPE_Torimaki then
        Torimaki_Act(ai, goal, Odds_Guard)
    elseif doAdmirer == 1 and role == ROLE_TYPE_Kankyaku then
        Kankyaku_Act(ai, goal, Odds_Guard)
    else
        local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per)
        if fateAct <= Act01Per then
            if fate <= 50 then
                local FirstAttID = 3000
                local ComAttID = 3001
                local ShootNum = ai:GetRandam_Int(2, 5)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            else
                local FirstAttID = 3002
                local ComAttID = 3003
                local ShootNum = ai:GetRandam_Int(2, 5)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            end
        elseif fateAct <= Act01Per + Act02Per then
            if fate <= 50 then
                local FirstAttID = 3000
                local ComAttID = 3001
                local ShootNum = ai:GetRandam_Int(2, 5)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            else
                local FirstAttID = 3002
                local ComAttID = 3003
                local ShootNum = ai:GetRandam_Int(2, 5)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            end
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 20, TARGET_ENE_0, true, -1)
        elseif fateAct <= Act01Per + Act02Per + Act03Per then
            if fate <= 50 then
                local FirstAttID = 3000
                local ComAttID = 3001
                local ShootNum = ai:GetRandam_Int(1, 3)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            else
                local FirstAttID = 3002
                local ComAttID = 3003
                local ShootNum = ai:GetRandam_Int(1, 3)
                Shoot_Act(ai, goal, FirstAttID, ComAttID, ShootNum)
            end
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
        else
            local approachDist = Att3006_Dist_max
            local dashDist = Att3006_Dist_max + 2
            local Odds_Guard = 0
            local AttID = 3006
            local AttDist = DIST_Middle
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
        end
    end
    return 
end

function HusiMino_Gun253002Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HusiMino_Gun253002Battle_Terminate(ai, goal)
    return 
end

function HusiMino_Gun253002Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distDamagedStep = 3
    local oddsDamagedStep = 15
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 4
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
