REGISTER_GOAL(GOAL_ShinenBito415000_Battle, "ShinenBito415000Battle")
local Att3002_Dist_min = 0
local Att3002_Dist_max = 1.5
local Att3005_Dist_min = 0
local Att3005_Dist_max = 1.5
local Att3007_Dist_min = 3
local Att3007_Dist_max = 5
local Att3008_Dist_min = 3
local Att3008_Dist_max = 5
local Att3009_Dist_min = 0
local Att3009_Dist_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_ShinenBito415000_Battle, 1)
function OnIf_415000(ai, goal, codeNo)
    if codeNo == 0 then
        ShinenBito415000_ActAfter_RealTime(ai, goal)
    end
    return 
end

function ShinenBito415000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local Act01Per = 0
    local Act02Per = 0
    local Act03Per = 0
    local Act04Per = 0
    local Act05Per = 0
    local Act06Per = 0
    local Act07Per = 0
    local Act08Per = 0
    local Act10Per = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local insane = 1
    if ai:GetNpcThinkParamID() <= 415019 then
        insane = 0.5
    end
    if ai:GetNumber(2) == 0 then
        ai:SetTimer(2, ai:GetRandam_Int(10, 20))
        ai:SetNumber(2, 1)
    end
    if ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Attack then
        if fate <= 50 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
            Act08Per = 100
        elseif 6 <= targetDist then
            Act01Per = 10
            Act02Per = 10
            Act03Per = 50
            Act04Per = 30
            Act05Per = 0
            if ai:GetNumber(3) == 1 then
                Act03Per = 80 * insane
                Act04Per = 0
            else
                Act03Per = 0
                Act04Per = 80 * insane
            end
        elseif 4 <= targetDist then
            Act01Per = 25
            Act02Per = 25
            Act03Per = 30
            Act04Per = 20
            Act05Per = 0
            if ai:GetNumber(3) == 1 then
                Act03Per = 50 * insane
                Act04Per = 0
            else
                Act03Per = 0
                Act04Per = 50 * insane
            end
        elseif 3 <= targetDist then
            Act01Per = 25
            Act02Per = 25
            Act03Per = 20
            Act04Per = 20
            Act05Per = 10 * insane
            if ai:GetNumber(3) == 1 then
                Act03Per = 40 * insane
                Act04Per = 0
            else
                Act03Per = 0
                Act04Per = 40 * insane
            end
        elseif 2 <= targetDist then
            Act01Per = 30
            Act02Per = 30
            Act03Per = 10
            Act04Per = 10
            Act05Per = 20 * insane
            if ai:GetNumber(3) == 1 then
                Act03Per = 20 * insane
                Act04Per = 0
            else
                Act03Per = 0
                Act04Per = 20 * insane
            end
        else
            Act01Per = 40
            Act02Per = 40
            Act03Per = 0
            Act04Per = 0
            Act05Per = 20 * insane
        end
    elseif ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        Act01Per = 5
        Act02Per = 5
        Act03Per = 5
        Act04Per = 7
        Act05Per = 8
        Act06Per = 35
        Act07Per = 35
    elseif ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku then
        Act06Per = 50
        Act07Per = 50
    end
    local fateAct = ai:GetRandam_Int(1, Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per + Act10Per)
    if fateAct <= Act01Per then
        ShinenBito415000_Act01(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per then
        ShinenBito415000_Act02(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per then
        ShinenBito415000_Act03(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per then
        ShinenBito415000_Act04(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per then
        ShinenBito415000_Act05(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per then
        ShinenBito415000_Act06(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per then
        ShinenBito415000_Act07(ai, goal)
        GetWellSpace_Odds = 100
    elseif fateAct <= Act01Per + Act02Per + Act03Per + Act04Per + Act05Per + Act06Per + Act07Per + Act08Per then
        ShinenBito415000_Act08(ai, goal)
        GetWellSpace_Odds = 0
    else
        ShinenBito415000_Act10(ai, goal)
        GetWellSpace_Odds = 0
    end
    local fateGWS = ai:GetRandam_Int(1, 100)
    if fateGWS <= GetWellSpace_Odds then
        ShinenBito415000_ActAfter_AdjustSpace(ai, goal)
    end
    return 
end

Att3002_Dist_min = Att3002_Dist_max
function ShinenBito415000_Act01(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = 0
    local Odds_Guard = 0
    local AttDist = Att3002_Dist_max
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:GetNpcThinkParamID() <= 415019 and fate <= 60 then
        dashDist = Att3002_Dist_max + 2.5
    end
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate2 <= 33 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3002, TARGET_ENE_0, AttDist, 0)
    elseif fate2 <= 66 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, AttDist, 1, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3003, TARGET_ENE_0, AttDist, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3002, TARGET_ENE_0, AttDist, 1, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, 3003, TARGET_ENE_0, AttDist, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3004, TARGET_ENE_0, AttDist, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3002_Dist_min = Att3005_Dist_max
function ShinenBito415000_Act02(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = 0
    local Odds_Guard = 0
    local AttDist = Att3005_Dist_max
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:GetNpcThinkParamID() <= 415019 and fate <= 60 then
        dashDist = Att3005_Dist_max + 2.5
    end
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate2 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3005, TARGET_ENE_0, AttDist, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, 3005, TARGET_ENE_0, AttDist, 1, 30, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3006, TARGET_ENE_0, AttDist, 0)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3002_Dist_min = Att3007_Dist_max
function ShinenBito415000_Act03(ai, goal, paramTbl)
    local approachDist = Att3007_Dist_max
    local dashDist = 0
    local Odds_Guard = 0
    local AttDist = Att3007_Dist_max
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, AttDist, 1, 90)
    ai:SetNumber(3, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3002_Dist_min = Att3008_Dist_max
function ShinenBito415000_Act04(ai, goal, paramTbl)
    local approachDist = Att3008_Dist_max
    local dashDist = 0
    local Odds_Guard = 0
    local AttDist = Att3008_Dist_max
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, AttDist, 1, 90)
    ai:SetNumber(3, 1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3002_Dist_min = Att3009_Dist_max
function ShinenBito415000_Act05(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3009_Dist_max
    local dashDist = 0
    local Odds_Guard = 0
    local AttDist = Att3009_Dist_max
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:GetNpcThinkParamID() <= 415019 and fate <= 60 then
        dashDist = Att3009_Dist_max + 2
    end
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, AttDist, 1, 30)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function ShinenBito415000_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = 10
    local dashDist = 12
    local Odds_Guard = 0
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if approachDist <= targetDist then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_KeepDist, 3, TARGET_ENE_0, 8, 12, TARGET_ENE_0, true, -1)
    return 
end

function ShinenBito415000_Act07(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    return 
end

function ShinenBito415000_Act08(ai, goal, paramTbl)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3013, TARGET_ENE_0, DIST_None, 0, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3012, TARGET_ENE_0, DIST_None, 0, 90)
    end
    return 
end

function ShinenBito415000_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_NONE, 0, 0, 0)
    return 
end

function ShinenBito415000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
    return 
end

function ShinenBito415000_ActAfter_RealTime(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Attack then
        if ai:IsFinishTimer(2) == true then
            if targetDist <= 4 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            end
            if fate > 33 then
                if fate <= 66 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                end
            end
            if fate2 <= 33 then
                goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3010, TARGET_ENE_0, DIST_None)
            end
            ai:SetNumber(2, 0)
        elseif ai:GetNpcThinkParamID() <= 415019 then
            if fate > 25 then
                if fate <= 50 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
                elseif fate <= 75 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                end
            end
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
        elseif fate > 33 then
            if fate <= 58 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            elseif fate <= 66 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            elseif fate <= 75 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            elseif fate <= 87 then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, 4, TARGET_ENE_0, true, -1)
            elseif 4 <= targetDist then
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
            end
        end
    elseif ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Torimaki then
        if ai:IsFinishTimer(2) == true then
            if targetDist <= 4 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
            end
            if fate > 33 then
                if fate <= 66 then
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
                else
                    goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
                end
            end
            if fate2 <= 66 then
                goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3010, TARGET_ENE_0, DIST_None)
            end
            ai:SetNumber(2, 0)
        end
    elseif ai:GetTeamOrder(ORDER_TYPE_Role) == ROLE_TYPE_Kankyaku and ai:IsFinishTimer(2) == true then
        if targetDist <= 4 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
        end
        if fate > 33 then
            if fate <= 66 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            end
        end
        goal:AddSubGoal(GOAL_COMMON_NonspinningAttack, 10, 3010, TARGET_ENE_0, DIST_None)
        ai:SetNumber(2, 0)
    end
    return 
end

function ShinenBito415000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ShinenBito415000Battle_Terminate(ai, goal)
    return 
end

Att3002_Dist_min = Att3007_Dist_max
Att3002_Dist_min = Att3005_Dist_max
function ShinenBito415000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distResponse = 3
    local oddsResponse = 15
    local oddsStep = 100
    local bkStepPer = 50
    local leftStepPer = 25
    local rightStepPer = 25
    local safetyDist = 4
    local oddsLeaveAndSide = 0
    local timeSide = 0
    local distLeave = 0
    if FindAttack_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
        return true
    end
    local distResponse = 3
    local oddsResponse = 25
    local oddsStep = 100
    local bkStepPer = 50
    local leftStepPer = 25
    local rightStepPer = 25
    local safetyDist = 4
    local oddsLeaveAndSide = 0
    local timeSide = 0
    local distLeave = 0
    if Damaged_Step_or_Guard(ai, goal, distResponse, oddsResponse, oddsStep, bkStepPer, leftStepPer, rightStepPer, safetyDist, oddsLeaveAndSide, timeSide, distLeave) then
        return true
    end
    local distGuardBreak_Act = 4
    local oddsGuardBreak_Act = 33
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        local approachDist = Att3007_Dist_max
        local dashDist = Att3007_Dist_max + 2
        local Odds_Guard = 0
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        return true
    end
    local distMissSwing_Int = 2
    local oddsMissSwing_Int = 50
    if MissSwing_Int(ai, goal, distMissSwing_Int, oddsMissSwing_Int) then
        if 4 <= targetDist then
            local approachDist = Att3007_Dist_max
            local dashDist = Att3007_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        else
            local approachDist = Att3005_Dist_max
            local dashDist = Att3005_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distUseItem_Act = 4
    local oddsUseItem_Act = 30
    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
        if 4 <= targetDist then
            local approachDist = Att3007_Dist_max
            local dashDist = Att3007_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        else
            local approachDist = Att3005_Dist_max
            local dashDist = Att3005_Dist_max + 2
            local Odds_Guard = 0
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distResNear = 5
    local distResFar = 10
    local oddsResNear = 0
    local oddsResFar = 50
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
    if ResBehavID == 1 then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
    elseif ResBehavID == 2 then
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 10, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
    end
    local oddsResponse = 10
    local bkStepPer = 50
    local leftStepPer = 25
    local rightStepPer = 25
    local safetyDist = 3
    if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
