REGISTER_GOAL(GOAL_KinokoChild_m12_228001_Battle, "KinokoChild_m12_228001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 0.6
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1.4
REGISTER_GOAL_NO_UPDATE(GOAL_KinokoChild_m12_228001_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function KinokoChild_m12_228001Battle_Activate(ai, goal)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local hprate = ai:GetHpRate(TARGET_SELF)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local eventNo = ai:GetEventRequest(0)
    local Nigeruflag = 0
    local GetWellSpace_Odds = 0
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    if ai:IsInsideTargetRegion(TARGET_SELF, 1202114) then
        Nigeruflag = 1
    end
    if 0.8 <= hprate and Nigeruflag == 0 then
        Act05Per = 100
    elseif hprate <= 0.8 and Nigeruflag == 0 then
        Act06Per = 100
    elseif eventNo == 1 then
        if 8 <= targetDist then
            Act01Per = 10
            Act02Per = 10
            Act03Per = 80
            Act04Per = 0
        elseif 4 <= targetDist then
            Act01Per = 60
            Act02Per = 40
            Act03Per = 0
            Act04Per = 0
        else
            Act01Per = 100
            Act02Per = 0
            Act03Per = 0
            Act04Per = 0
        end
    elseif 4 <= targetDist then
        Act01Per = 0
        Act02Per = 0
        Act07Per = 100
    else
        Act01Per = 20
        Act02Per = 10
        Act07Per = 70
    end
    local doAdmirer = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local role = ai:GetTeamOrder(ORDER_TYPE_Role)
    local Guard = 0
    if doAdmirer == 1 and role == ROLE_TYPE_Torimaki then
        Torimaki_Act(ai, goal, Odds_Guard)
    elseif doAdmirer == 1 and role == ROLE_TYPE_Kankyaku then
        Kankyaku_Act(ai, goal, Odds_Guard)
    else
        local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per)
        if fateAct <= Act01Per then
            local approachDist = Att3000_Dist_max
            local dashDist = Att3000_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
            if fate <= 10 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            elseif fate <= 60 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
            elseif fate <= 85 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
            end
            GetWellSpace_Odds = 100
        elseif fateAct <= Act01Per + Act02Per then
            local approachDist = Att3002_Dist_max
            local dashDist = Att3002_Dist_max + 2
            local Odds_Guard = 0
            local AttID = 3002
            local AttDist = DIST_Middle
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            GetWellSpace_Odds = 100
        elseif fateAct <= Act01Per + Act02Per + Act03Per then
            local approachDist = 6
            local dashDist = 8
            local Odds_Guard = 0
            local AttID = 3002
            local AttDist = DIST_None
            Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
            GetWellSpace_Odds = 0
        elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
            local approachDist = Att3000_Dist_max
            local dashDist = Att3000_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
            if fate <= 60 then
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            elseif fate <= 95 then
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3001, TARGET_ENE_0, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
            end
            if 60 <= fate2 then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
            else
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(5, 7), TARGET_SELF, false, -1)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_SELF, DIST_Middle, 0)
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 20, TARGET_SELF, false, -1)
            end
            GetWellSpace_Odds = 0
        elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
            goal:AddSubGoal(GOAL_COMMON_MoveToSomewhere, 2, POINT_MOVE_POINT, AI_DIR_TYPE_CENTER, 1, TARGET_SELF, true)
            GetWellSpace_Odds = 0
        elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
            ai:SetEventMoveTarget(1202114)
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, POINT_EVENT, 1, TARGET_SELF, false, -1)
            GetWellSpace_Odds = 0
        else
            if 15 <= targetDist then
                goal:AddSubGoal(GOAL_COMMON_Wait, 1.5, TARGET_ENE_0)
            else
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 15, TARGET_SELF, false, -1)
            end
            GetWellSpace_Odds = 0
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

function KinokoChild_m12_228001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function KinokoChild_m12_228001Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function KinokoChild_m12_228001Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local guardBreakConutDist = 2
    local guardBreakConutPer = 10
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
