REGISTER_GOAL(GOAL_HebibitoB_shot270001_Battle, "HebibitoB_shot270001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1
local Att3003_Dist_min = 0
local Att3003_Dist_max = 1.5
local Att3004_Dist_min = 0
local Att3004_Dist_max = 1
local Att3005_Dist_min = 0
local Att3005_Dist_max = 3.5
local Att3006_Dist_min = 3
local Att3006_Dist_max = 5.6
local Att3007_Dist_min = 4
local Att3007_Dist_max = 14
local Att3008_Dist_min = 0
local Att3008_Dist_max = 0.9
local Att3009_Dist_min = 0
local Att3009_Dist_max = 20
REGISTER_GOAL_NO_UPDATE(GOAL_HebibitoB_shot270001_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function HebibitoB_shot270001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    local fate = ai:GetRandam_Int(30, 60)
    if 10 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 0
        actPerArr[6] = 100
        actPerArr[7] = 0
    elseif 8 <= targetDist then
        if ai:IsFinishTimer(0) == true then
            ai:SetTimer(0, fate)
            actPerArr[1] = 0
            actPerArr[2] = 0
            actPerArr[3] = 0
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 15
            actPerArr[7] = 0
            actPerArr[9] = 85
        else
            actPerArr[1] = 0
            actPerArr[2] = 0
            actPerArr[3] = 0
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 100
            actPerArr[7] = 0
            actPerArr[9] = 0
        end
    elseif 5.7 <= targetDist then
        if ai:IsFinishTimer(0) == true then
            ai:SetTimer(0, fate)
            actPerArr[1] = 0
            actPerArr[2] = 0
            actPerArr[3] = 0
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 10
            actPerArr[7] = 0
            actPerArr[9] = 90
        else
            actPerArr[1] = 0
            actPerArr[2] = 0
            actPerArr[3] = 0
            actPerArr[4] = 0
            actPerArr[5] = 0
            actPerArr[6] = 100
            actPerArr[7] = 0
        end
    elseif 2.5 <= targetDist then
        actPerArr[1] = 0
        actPerArr[2] = 0
        actPerArr[3] = 0
        actPerArr[4] = 0
        actPerArr[5] = 0
        actPerArr[6] = 100
        actPerArr[7] = 0
    else
        actPerArr[1] = 20
        actPerArr[2] = 25
        actPerArr[3] = 25
        actPerArr[4] = 0
        actPerArr[5] = 25
        actPerArr[6] = 0
        actPerArr[7] = 5
    end
    actFuncArr[1] = REGIST_FUNC(ai, goal, HebibitoB_shot270001_Act01)
    local local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 0
    local0[4] = 0
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3004_Dist_max, 0, 3004, DIST_Middle}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, HebibitoB_shot270001_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, HebibitoB_shot270001_Act05)
    local0 = {3007, DIST_Far, nil}
    defFuncParamTbl[6] = local0
    actFuncArr[7] = REGIST_FUNC(ai, goal, HebibitoB_shot270001_Act07)
    actFuncArr[9] = REGIST_FUNC(ai, goal, HebibitoB_shot270001_Act09)
    local0 = {0, 50, 5, 5, 0, 20, 20}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HebibitoB_shot270001_Act01(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3003, TARGET_ENE_0, DIST_Middle, -1, 5)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3005_Dist_max
function HebibitoB_shot270001_Act04(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3005_Dist_max
    local dashDist = Att3005_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3005, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3008_Dist_max
function HebibitoB_shot270001_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local approachDist = Att3008_Dist_max
    local dashDist = Att3008_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 5, 3008, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HebibitoB_shot270001_Act07(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HebibitoB_shot270001_Act09(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3009, TARGET_ENE_0, DIST_None, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function HebibitoB_shot270001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function HebibitoB_shot270001Battle_Terminate(ai, goal)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function HebibitoB_shot270001Battle_Interupt(ai, goal)
    local superStepDist = 3
    local superStepPer = 25
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
        return true
    end
    local distDamagedStep = 3
    local oddsDamagedStep = 25
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 3
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    end
    local distGuardBreak_Act = 10
    local oddsGuardBreak_Act = 50
    local fate = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if 2.5 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distUseItem_Act = 10
    local oddsUseItem_Act = 40
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if UseItem_Act(ai, goal, distUseItem_Act, oddsUseItem_Act) then
        if 2.5 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, Att3003_Dist_max, TARGET_SELF, false, -1)
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distResNear = 10.5
    local distResFar = 20
    local oddsResNear = 0
    local oddsResFar = 40
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
    if ResBehavID == 1 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
    elseif ResBehavID == 2 then
        if fate <= 40 then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
            local local0 = true
            return true
        elseif fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
        return true
    end
    local oddsResponse = 15
    local bkStepPer = 30
    local leftStepPer = 35
    local rightStepPer = 35
    local safetyDist = 3
    if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
