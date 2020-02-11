REGISTER_GOAL(GOAL_BlackIronTarkus6510_Battle, "BlackIronTarkus6510Battle")
local NormalR_min = 0
local NormalR_max = 2.3
local LargeR_min = 0
local LargeR_max = 2.6
local Whand_jyaku_min = 0
local Whand_jyaku_max = 2
local Whand_kyou_min = 0
local Whand_kyou_max = 2.5
local Backstep_Atk_min = 0
local Backstep_Atk_max = 1.5
local Backstep_AtkW_min = 0
local Backstep_AtkW_max = 1.5
local Rolling_Atk_min = 3.5
local Rolling_Atk_max = 4.5
local Rolling_AtkW_min = 4
local Rolling_AtkW_max = 5
local PushR_min = 0
local PushR_max = 1
REGISTER_GOAL_NO_UPDATE(GOAL_BlackIronTarkus6510_Battle, 1)
function BlackIronTarkus6510Battle_Activate(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local playerDist = ai:GetDist(TARGET_LOCALPLAYER)
    local isFindTarget = ai:IsSearchTarget(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest(0)
    local myThinkId = ai:GetNpcThinkParamID()
    local PointFrontWall = 0
    if myThinkId == 6510 then
        PointFrontOfWall = 1502997
    elseif myThinkId == 6511 then
        PointFrontOfWall = 1412997
    end
    if eventNo == 10 then
        ai:SetEventMoveTarget(PointFrontOfWall)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, POINT_EVENT, 3, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, POINT_EVENT, 0.1, TARGET_SELF, true, -1)
    elseif playerDist <= 0.1 then
        if fate <= 50 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_LOCALPLAYER, 1, TARGET_LOCALPLAYER, true, -1)
        elseif fate <= 85 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.5, TARGET_LOCALPLAYER, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(20, 25), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_LOCALPLAYER, 0, 0, 0)
        end
    elseif playerDist <= 0.4 then
        if fate <= 20 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_LOCALPLAYER, 1, TARGET_LOCALPLAYER, true, -1)
        elseif fate <= 30 then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.5, TARGET_LOCALPLAYER, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(20, 25), true, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, 2, TARGET_LOCALPLAYER, 0, 0, 0)
        end
    elseif 20 <= playerDist or 10 <= targetDist or isFindTarget == false then
        local walk = true
        if 2.2 <= playerDist then
            walk = false
        end
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_LOCALPLAYER, 1.2, TARGET_SELF, walk, -1)
    else
        BlackIronTarkus6510_Battle(ai, goal)
    end
    return 
end

function BlackIronTarkus6510_Battle(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local BothHandOff = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local RYOUTE_odds = 1
    local KATATE_odds = 1
    if ai:IsTargetGuard(TARGET_ENE_0) == true then
        RYOUTE_odds = 10
    end
    if 8 <= targetDist then
        actPerArr[1] = 35 * KATATE_odds
        actPerArr[2] = 35 * KATATE_odds
        actPerArr[7] = 5 * KATATE_odds
        actPerArr[9] = 35 * RYOUTE_odds
        actPerArr[10] = 35 * RYOUTE_odds
        actPerArr[15] = 5 * RYOUTE_odds
        actPerArr[20] = 25 * RYOUTE_odds
    elseif 3.5 <= targetDist then
        actPerArr[1] = 30 * KATATE_odds
        actPerArr[2] = 30 * KATATE_odds
        actPerArr[7] = 5 * KATATE_odds
        actPerArr[9] = 30 * RYOUTE_odds
        actPerArr[10] = 30 * RYOUTE_odds
        actPerArr[15] = 5 * RYOUTE_odds
        actPerArr[20] = 35 * RYOUTE_odds
    elseif 1.5 <= targetDist then
        actPerArr[1] = 32 * KATATE_odds
        actPerArr[2] = 33 * KATATE_odds
        actPerArr[9] = 32 * RYOUTE_odds
        actPerArr[10] = 33 * RYOUTE_odds
        actPerArr[17] = 30 * RYOUTE_odds
        actPerArr[20] = 35 * RYOUTE_odds
    elseif 1 <= targetDist then
        actPerArr[1] = 18 * KATATE_odds
        actPerArr[2] = 17 * KATATE_odds
        actPerArr[5] = 15 * KATATE_odds
        actPerArr[9] = 10 * RYOUTE_odds
        actPerArr[10] = 10 * RYOUTE_odds
        actPerArr[13] = 13 * KATATE_odds
        actPerArr[17] = 30 * RYOUTE_odds
    else
        actPerArr[1] = 17 * KATATE_odds
        actPerArr[2] = 18 * KATATE_odds
        actPerArr[5] = 15 * KATATE_odds
        actPerArr[9] = 17 * RYOUTE_odds
        actPerArr[10] = 18 * RYOUTE_odds
        actPerArr[13] = 15 * KATATE_odds
        actPerArr[17] = 20 * RYOUTE_odds
        actPerArr[20] = 30 * RYOUTE_odds
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act01)
    actFuncArr[2] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act02)
    actFuncArr[5] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act05)
    actFuncArr[7] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act07)
    actFuncArr[9] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act10)
    actFuncArr[13] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act13)
    actFuncArr[15] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act15)
    actFuncArr[17] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act17)
    actFuncArr[20] = REGIST_FUNC(ai, goal, BlackIronTarkus6510_Act20)
    local atkAfterFunc = REGIST_FUNC(ai, goal, BlackIronTarkus6510_ActAfter_AdjustSpace, atkAfterOddsTbl)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

NormalR_min = NormalR_max
function BlackIronTarkus6510_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = NormalR_max
    local dashDist = NormalR_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = LargeR_max
function BlackIronTarkus6510_Act02(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = LargeR_max
    local dashDist = LargeR_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Backstep_Atk_max
function BlackIronTarkus6510_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = Backstep_Atk_max
    local dashDist = Backstep_Atk_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_Atk_max
function BlackIronTarkus6510_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    NPC_KATATE_Switch(ai, goal)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    local approachDist = Rolling_Atk_max
    local dashDist = Rolling_Atk_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Whand_jyaku_max
function BlackIronTarkus6510_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Whand_jyaku_max
    local dashDist = Whand_jyaku_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    if fate <= 40 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    else
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Whand_kyou_max
function BlackIronTarkus6510_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Whand_kyou_max
    local dashDist = Whand_kyou_max + 5
    local Odds_Guard = 50
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Backstep_AtkW_max
function BlackIronTarkus6510_Act13(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Backstep_AtkW_max
    local dashDist = Backstep_AtkW_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_BackstepB, TARGET_ENE_0, 6, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = Rolling_AtkW_max
function BlackIronTarkus6510_Act15(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    CommonNPC_UseSecondaryLeftHand(ai, goal)
    NPC_RYOUTE_Switch(ai, goal)
    local approachDist = Rolling_AtkW_max
    local dashDist = Rolling_AtkW_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_StepF, TARGET_ENE_0, 3, 1.5, 90)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, NPC_ATK_NormalR, TARGET_ENE_0, DIST_Middle, 0, -1)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

NormalR_min = PushR_max
function BlackIronTarkus6510_Act17(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = PushR_max
    local dashDist = PushR_max + 5
    local Odds_Guard = 100
    NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_NormalL, TARGET_ENE_0, DIST_Middle, 1.5, 90)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function BlackIronTarkus6510_Act20(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    if 3 <= targetDist then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(2, 2.5), TARGET_SELF, true, 4)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, ai:GetRandam_Float(1.5, 2), TARGET_ENE_0, true, 4)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function BlackIronTarkus6510_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local MoveDist = 3
    if fate <= 100 then
        if fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 3, TARGET_ENE_0, ai:GetRandam_Float(2.5, 3.5), TARGET_ENE_0, true, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 4)
        end
    end
    return 
end

function BlackIronTarkus6510Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function BlackIronTarkus6510Battle_Terminate(ai, goal)
    return 
end

NormalR_min = LargeR_max
function BlackIronTarkus6510Battle_Interupt(ai, goal)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_FindAttack) then
        local FindATKDist = 3
        local FindATKPer = 10
        local MoveDist = 3
        if targetDist <= FindATKDist and fate <= FindATKPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Int(3, 5), TARGET_ENE_0, combRunDist, TARGET_ENE_0, true, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_SuccessGuard) then
        local Suc_GuardDist = 3
        local Suc_GuardPer = 80
        if targetDist <= Suc_GuardDist and fate <= Suc_GuardPer then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_None, 0, -1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        local combRunDist = 3
        local combRunPer = 10
        if targetDist < combRunDist and fate <= combRunPer then
            goal:ClearSubGoal()
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Int(3, 5), TARGET_ENE_0, combRunDist, TARGET_ENE_0, true, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
            end
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_GuardBreak) then
        local distGuardBreak_Act = 2
        local oddsGuardBreak_Act = 100
        if targetDist <= distGuardBreak_Act and fate <= oddsGuardBreak_Act then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) then
        local ResDist = 3
        local ResPer = 10
        if targetDist < ResDist then
            if fate <= ResPer then
                goal:ClearSubGoal()
                if fate2 <= ResPer then
                    if fate <= 50 then
                        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Int(3, 5), TARGET_ENE_0, combRunDist, TARGET_ENE_0, true, 4)
                    else
                        goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 4), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Float(30, 50), true, true, 4)
                    end
                    return true
                else
                    ai:Replaning()
                    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
                    return true
                end
            else
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
                ai:Replaning()
                return true
            end
        else
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
            ai:Replaning()
            return true
        end
    elseif ai:IsInterupt(INTERUPT_Shoot) then
        local shootIntPer = 50
        if fate <= shootIntPer then
            goal:ClearSubGoal()
            local approachDist = LargeR_max
            local dashDist = LargeR_max + 5
            local Odds_Guard = 100
            NPC_Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 10, NPC_ATK_LargeR, TARGET_ENE_0, DIST_Middle, 1.5, 90)
            return true
        end
    end
    return false
end

return 
