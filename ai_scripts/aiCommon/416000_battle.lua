REGISTER_GOAL(GOAL_ShinenBito_Sorcerer416000_Battle, "ShinenBito_Sorcerer416000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2
local Att3003_Dist_min = 0
local Att3003_Dist_max = 30
local Att3004_Dist_min = 0
local Att3004_Dist_max = 10
local Att3005_Dist_min = 0
local Att3005_Dist_max = 10
local Att3007_Dist_min = 0
local Att3007_Dist_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_ShinenBito_Sorcerer416000_Battle, 1)
function OnIf_416000(ai, goal, codeNo)
    if codeNo == 0 then
        ShinenBito_Sorcerer416000_ActAfter_RealTime(ai, goal)
    end
    return 
end

Att3000_Dist_min = Att3003_Dist_min
Att3000_Dist_min = Att3003_Dist_max
function ShinenBito_Sorcerer416000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = 1
    local fate3 = 1
    local fate4 = 1
    if ai:GetNpcThinkParamID() == 416022 then
        -- Rare error in Katalash's decompiler:
        --local local0 = 0
        --SETUPVAL 10 0 0
        --local0 = 20
        --SETUPVAL 10 1 0

        -- 416022 is "Bloathead Sorcerer (Eyes) (Chasm)". I think their maximum range for attack 3003 is reduced.
        -- So fairly sure this is intended:
        Att3003_Dist_min = 0
        Att3003_Dist_max = 20
    end
    if ai:IsFinishTimer(0) == true then
        fate2 = 1
    else
        fate2 = 0.5
    end
    if ai:IsFinishTimer(1) == true then
        fate3 = 1
    else
        fate3 = 0
    end
    if ai:IsFinishTimer(2) == true then
        fate4 = 1
    else
        fate4 = 0.5
    end
    if ai:GetNumber(0) == 1 then
        fate2 = 4
        fate3 = 4
        fate4 = 4
        ai:SetNumber(0, 0)
    end
    if fate <= 50 and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 90) then
        actPerArr[20] = 100
    elseif ai:IsInsideTargetRegion(TARGET_ENE_0, 1212032) and ai:IsInsideTargetRegion(TARGET_SELF, 1212033) then
        actPerArr[1] = 33
        actPerArr[2] = 33
        actPerArr[3] = 34
    elseif 10 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[5] = 30
        actPerArr[10] = 70
        actPerArr[11] = 0
        actPerArr[12] = 0
    elseif 7 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[5] = 20
        actPerArr[10] = 30 * fate2
        actPerArr[11] = 30 * fate3
        actPerArr[12] = 20 * fate4
        if ai:GetNpcThinkParamID() <= 416019 then
            actPerArr[10] = 80 * fate2
            actPerArr[11] = 0
            actPerArr[12] = 0
        end
    elseif 4 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[5] = 10
        actPerArr[10] = 30 * fate2
        actPerArr[11] = 20 * fate3
        actPerArr[12] = 40 * fate4
        if ai:GetNpcThinkParamID() <= 416019 then
            actPerArr[10] = 90 * fate2
            actPerArr[11] = 0
            actPerArr[12] = 0
        end
    elseif 2 <= targetDist then
        actPerArr[1] = 20
        actPerArr[2] = 30
        actPerArr[3] = 30
        actPerArr[5] = 0
        actPerArr[10] = 20 * fate2
        actPerArr[11] = 0 * fate3
        actPerArr[12] = 0 * fate4
    else
        actPerArr[1] = 30
        actPerArr[2] = 30
        actPerArr[3] = 30
        actPerArr[5] = 0
        actPerArr[10] = 0 * fate2
        actPerArr[11] = 0 * fate3
        actPerArr[12] = 10 * fate4
        if ai:GetNpcThinkParamID() <= 416019 then
            actPerArr[12] = 0
        end
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act02)
    actFuncArr[3] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act03)
    actFuncArr[5] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act05)
    actFuncArr[10] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act10)
    actFuncArr[11] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act11)
    actFuncArr[12] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act12)
    actFuncArr[20] = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, ShinenBito_Sorcerer416000_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3000_Dist_max
function ShinenBito_Sorcerer416000_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3000_Dist_max + 0
    local dashDist = Att3000_Dist_max + 2
    local Odds_Guard = 0
    local AttDist = Att3000_Dist_max + 1
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1212032) and ai:IsInsideTargetRegion(TARGET_SELF, 1212033) then
        dashDist = Att3000_Dist_max + 0
    end
    if approachDist <= targetDist and (ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030)) then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if fate <= 33 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3000, TARGET_ENE_0, AttDist, 0, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, 3000, TARGET_ENE_0, AttDist, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, 3001, TARGET_ENE_0, AttDist, 0)
    end
    GetWellSpace_Odds = 80
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3007_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function ShinenBito_Sorcerer416000_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3007_Dist_max + 0
    local dashDist = Att3007_Dist_max + 2
    local Odds_Guard = 0
    local AttDist = Att3007_Dist_max + 1
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1212032) and ai:IsInsideTargetRegion(TARGET_SELF, 1212033) then
        dashDist = Att3000_Dist_max + 0
    end
    if approachDist <= targetDist and (ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030)) then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3007, TARGET_ENE_0, AttDist, 0, 90)
    GetWellSpace_Odds = 80
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3000_Dist_max
function ShinenBito_Sorcerer416000_Act03(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max + 0
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    local AttDist = Att3002_Dist_max
    if ai:IsInsideTargetRegion(TARGET_ENE_0, 1212032) and ai:IsInsideTargetRegion(TARGET_SELF, 1212033) then
        dashDist = Att3000_Dist_max + 0
    end
    if approachDist <= targetDist and (ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030)) then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, AttDist, 0, 90)
    GetWellSpace_Odds = 80
    return GetWellSpace_Odds
end

function ShinenBito_Sorcerer416000_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(1.8, 3), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(120, 120), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function ShinenBito_Sorcerer416000_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 5
    local Odds_Guard = 0
    local AttDist = Att3003_Dist_max
    if ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030) then
        if approachDist <= targetDist then
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
        elseif targetDist < 6 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_L, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_R, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        end
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_None, 0, 180)
    ai:SetTimer(0, 5)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function ShinenBito_Sorcerer416000_Act11(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 4
    local Odds_Guard = 0
    local AttDist = Att3004_Dist_max
    if ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030) then
        if approachDist <= targetDist then
            Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
        elseif targetDist < 6 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_B, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_L, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) and ai:IsOnNearMeshByPos(TARGET_SELF, AI_DIR_TYPE_R, 5) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        end
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3004, TARGET_ENE_0, DIST_None, 0, 70)
    ai:SetTimer(1, 30)
    GetWellSpace_Odds = 50
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function ShinenBito_Sorcerer416000_Act12(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    local AttDist = Att3005_Dist_max
    if approachDist <= targetDist and (ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212030)) then
        Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard, 3)
    end
    if ai:GetNpcThinkParamID() == 416001 and not ai:IsInsideTargetRegion(TARGET_ENE_0, 1212031) then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 2, TARGET_ENE_0, true, -1)
    end
    if ai:GetNpcThinkParamID() ~= 416001 or ai:GetNpcThinkParamID() == 416001 and ai:IsInsideTargetRegion(TARGET_ENE_0, 1212031) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3005, TARGET_ENE_0, DIST_None, 0, 90, 10, 10)
    end
    ai:SetTimer(2, 5)
    GetWellSpace_Odds = 50
    return GetWellSpace_Odds
end

function ShinenBito_Sorcerer416000_Act20(ai, goal, paramTbl)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3009, TARGET_ENE_0, DIST_None, 0, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3008, TARGET_ENE_0, DIST_None, 0, 90)
    end
    return 
end

function ShinenBito_Sorcerer416000_ActAfter_RealTime(ai, goal)
    local GW_fate = ai:GetRandam_Int(1, 100)
    local fate = ai:GetRandam_Int(1, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if targetDist <= 3 then
        if GW_fate <= 100 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
                ai:SetNumber(0, 1)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        elseif fate <= 0 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, bRight, ai:GetRandam_Int(120, 120), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 4, TARGET_ENE_0, true, -1)
        end
    elseif targetDist <= 5 then
        if GW_fate <= 80 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
                ai:SetNumber(0, 1)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                local local0 = oal
                local0:AddSubGoal(GOAL_COMMON_SpinStep, 3, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        elseif fate <= 0 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, bRight, ai:GetRandam_Int(120, 120), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 7, TARGET_ENE_0, true, -1)
        end
    elseif targetDist <= 10 then
        if GW_fate <= 40 then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, 140) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
                ai:SetNumber(0, 1)
            elseif ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        elseif fate <= 70 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, bRight, ai:GetRandam_Int(120, 120), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 10, TARGET_ENE_0, true, -1)
        end
    elseif targetDist <= 15 then
        if GW_fate <= 50 then
            if fate <= 100 then
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, bRight, ai:GetRandam_Int(120, 120), true, true, -1)
            else
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 12, TARGET_ENE_0, true, -1)
            end
        elseif ai:IsFinishTimer(3) == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_None, 0, 90)
            ai:SetTimer(3, ai:GetRandam_Int(7, 11))
        end
    elseif GW_fate <= 25 then
        if fate <= 100 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 2, TARGET_ENE_0, bRight, ai:GetRandam_Int(120, 120), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 12, TARGET_ENE_0, true, -1)
        end
    elseif ai:IsFinishTimer(3) == true then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_None, 0, 90)
        ai:SetTimer(3, ai:GetRandam_Int(7, 11))
    end
    return 
end

function ShinenBito_Sorcerer416000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_If, 10, 0)
    return 
end

function ShinenBito_Sorcerer416000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function ShinenBito_Sorcerer416000Battle_Terminate(ai, goal)
    return 
end

function ShinenBito_Sorcerer416000Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distNearRes = 5
    local oddsNearRes = 40
    if Damaged_Act(ai, goal, distNearRes, oddsNearRes) then
        goal:ClearSubGoal()
        if targetDist <= 3 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
            ai:SetNumber(0, 1)
        elseif targetDist <= 6 then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
                ai:SetNumber(0, 1)
            elseif fate <= 75 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 5)
        end
        return true
    else
        local distResNear = 10
        local distResFar = 20
        local oddsResNear = 30
        local oddsResFar = 50
        local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
        if ResBehavID == 1 then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
            return true
        elseif ResBehavID == 2 then
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 5)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 2, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 5)
            end
            return true
        else
            return false
        end
    end
end

return 
