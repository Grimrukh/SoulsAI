REGISTER_GOAL(GOAL_CrystalAmber271100_Battle, "CrystalAmber271100Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.8
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2
local Att3003_Dist_min = 0.5
local Att3003_Dist_max = 2.5
local Att3004_Dist_min = 0
local Att3004_Dist_max = 5
local Att3005_Dist_min = 0.5
local Att3005_Dist_max = 2.6
local Att3006_Dist_min = 0
local Att3006_Dist_max = 5.1
local Att3007_Dist_min = 4.5
local Att3007_Dist_max = 8.3
local Att3008_Dist_min = 7.5
local Att3008_Dist_max = 11.5
REGISTER_GOAL_NO_UPDATE(GOAL_CrystalAmber271100_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3005_Dist_max
function CrystalAmber271100Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if 11.5 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[3] = 5
        actPerArr[4] = 5
        actPerArr[5] = 20
        actPerArr[6] = 0
        actPerArr[7] = 60
    elseif 8.3 <= targetDist then
        actPerArr[1] = 5
        actPerArr[2] = 5
        actPerArr[3] = 5
        actPerArr[4] = 5
        actPerArr[5] = 30
        actPerArr[6] = 0
        actPerArr[7] = 50
    elseif 5.1 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[4] = 10
        actPerArr[5] = 30
        actPerArr[6] = 10
        actPerArr[7] = 20
    else
        actPerArr[1] = 20
        actPerArr[2] = 20
        actPerArr[3] = 20
        actPerArr[4] = 20
        actPerArr[5] = 0
        actPerArr[6] = 20
        actPerArr[7] = 0
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, CrystalAmber271100_Act01)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 30
    local0[4] = 70
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3005_Dist_max, 0, 3005, DIST_Middle, nil}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, CrystalAmber271100_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, CrystalAmber271100_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, CrystalAmber271100_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, CrystalAmber271100_Act07)
    local atkAfterFunc = REGIST_FUNC(ai, goal, CrystalAmber271100_ActAfter_AdjustSpace)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
function CrystalAmber271100_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3002
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3002, TARGET_ENE_0, DIST_Middle, 2.5, 5)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3003_Dist_max
function CrystalAmber271100_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3003
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, 2.5, 22)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function CrystalAmber271100_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3006
    local AttDist = DIST_Middle
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3006, TARGET_ENE_0, DIST_Middle, 2.5, 37)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3004_Dist_max
function CrystalAmber271100_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3004_Dist_max
    local dashDist = Att3004_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3004
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3008_Dist_min
Att3000_Dist_min = Att3008_Dist_max
Att3000_Dist_min = Att3007_Dist_max
function CrystalAmber271100_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    if Att3008_Dist_min <= targetDist and fate <= 40 then
        local approachDist = Att3008_Dist_max
        local dashDist = Att3008_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3008
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    else
        local approachDist = Att3007_Dist_max
        local dashDist = Att3007_Dist_max + 2
        local Odds_Guard = 0
        local AttID = 3007
        local AttDist = DIST_Middle
        Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function CrystalAmber271100_ActAfter_AdjustSpace(ai, goal, paramTbl)
    local GW_fate = ai:GetRandam_Int(0, 100)
    local bRight = ai:GetRandam_Int(0, 1)
    local friendNum = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + bRight, TARGET_ENE_0, 2)
    if GW_fate > 60 then
        if GW_fate <= 65 and friendNum < 2 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, -1)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, bRight, ai:GetRandam_Int(30, 45), true, true, -1)
        elseif GW_fate <= 70 then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, -1)
        elseif GW_fate <= 85 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 701, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
        else
            local fate = ai:GetRandam_Int(1, 100)
            if fate <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
            end
        end
    end
    return 
end

function CrystalAmber271100Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function CrystalAmber271100Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3007_Dist_max
function CrystalAmber271100Battle_Interupt(ai, goal)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local distGuardBreak_Act = 2
    local oddsGuardBreak_Act = 30
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
        return true
    else
        local distUseItem_Act = 8
        local oddsUseItem_Act = 25
        if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
            if targetDist <= 4.4 then
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3002_Dist_max, TARGET_SELF, false, -1)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3002, TARGET_ENE_0, DIST_Middle, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3007_Dist_max, TARGET_SELF, false, -1)
                goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
            end
            return true
        else
            return false
        end
    end
end

return 
