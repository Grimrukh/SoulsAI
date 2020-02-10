REGISTER_GOAL(GOAL_Ghoul_Spear206001_Battle, "Ghoul_Spear206001Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 2.4
local Att3001_Dist_min = 0
local Att3001_Dist_max = 3
local Att3002_Dist_min = 0
local Att3002_Dist_max = 2.5
local Att3003_Dist_min = 0
local Att3003_Dist_max = 3.8
local Att3004_Dist_min = 0
local Att3004_Dist_max = 1.8
local Att3005_Dist_min = 4
local Att3005_Dist_max = 6
local Att3006_Dist_min = 0
local Att3006_Dist_max = 3
REGISTER_GOAL_NO_UPDATE(GOAL_Ghoul_Spear206001_Battle, 1)
Att3000_Dist_min = Att3001_Dist_max
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
Att3000_Dist_min = Att3004_Dist_max
function Ghoul_Spear206001Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local eventNo = ai:GetEventRequest()
    if eventNo == 10 then
        actPerArr[8] = 100
    elseif ai:IsLadderAct(TARGET_SELF) then
        actPerArr[10] = 100
    elseif 8 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[4] = 10
        actPerArr[5] = 50
        actPerArr[6] = 10
    elseif 4 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 10
        actPerArr[3] = 10
        actPerArr[4] = 20
        actPerArr[5] = 30
        actPerArr[6] = 20
    elseif 3 <= targetDist then
        actPerArr[1] = 10
        actPerArr[2] = 20
        actPerArr[3] = 20
        actPerArr[4] = 30
        actPerArr[5] = 10
        actPerArr[6] = 10
    else
        actPerArr[1] = 0
        actPerArr[2] = 40
        actPerArr[3] = 20
        actPerArr[4] = 10
        actPerArr[5] = 0
        actPerArr[6] = 30
    end
    local local0 = {Att3001_Dist_max, 0, 3001, DIST_Middle}
    defFuncParamTbl[1] = local0
    local0 = {}
    local local1, local2, local3, local4 = nil
    local0[1] = Att3000_Dist_max
    local0[2] = 0
    local0[3] = 40
    local0[4] = 100
    local0[5] = local1
    local0[6] = local2
    local0[7] = local3
    local0[8] = local4
    defFuncParamTbl[2] = local0
    local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle}
    defFuncParamTbl[3] = local0
    local0 = {Att3004_Dist_max, 0, 3004, DIST_Near, 3002, DIST_Middle, nil}
    defFuncParamTbl[4] = local0
    actFuncArr[5] = REGIST_FUNC(ai, goal, Ghoul_Spear206001_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Ghoul_Spear206001_Act06)
    actFuncArr[8] = REGIST_FUNC(ai, goal, Ghoul_Spear206001_Act08)
    actFuncArr[10] = REGIST_FUNC(ai, goal, Ghoul_Spear206001_Act10)
    local0 = {0, 60, 10, 10, 10, 6, 4}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3003_Dist_max
function Ghoul_Spear206001_Act05(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3003_Dist_max
    local dashDist = Att3003_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3006_Dist_max
function Ghoul_Spear206001_Act06(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local approachDist = Att3006_Dist_max
    local dashDist = Att3006_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3006, TARGET_ENE_0, DIST_Middle, 0)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function Ghoul_Spear206001_Act08(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), 0, 0, 0, 0)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 30, POINT_INITIAL, 2, TARGET_SELF, false, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att3002_Dist_max
function Ghoul_Spear206001_Act10(ai, goal, paramTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local approachDist = Att3002_Dist_max
    local dashDist = Att3002_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3002
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Ghoul_Spear206001Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Ghoul_Spear206001Battle_Terminate(ai, goal)
    return 
end

function Ghoul_Spear206001Battle_Interupt(ai, goal)
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local fate3 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local superStepDist = 3
    local superStepPer = 15
    local bkStepPer = 40
    local leftStepPer = 30
    local rightStepPer = 30
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
        return true
    end
    local distDamagedStep = 3
    local oddsDamagedStep = 15
    local bkStepPer = 40
    local leftStepPer = 30
    local rightStepPer = 30
    local safetyDist = 4
    if Damaged_Step(ai, goal, distDamagedStep, oddsDamagedStep, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    end
    local distGuardBreak_Act = 3.8
    local oddsGuardBreak_Act = 40
    local fate = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if GuardBreak_Act(ai, goal, distGuardBreak_Act, oddsGuardBreak_Act) then
        if 2.4 <= targetDist then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3003, TARGET_ENE_0, DIST_Middle, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3000, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
    local distResNear = 8
    local distResFar = 20
    local oddsResNear = 0
    local oddsResFar = 20
    local fate = ai:GetRandam_Int(1, 100)
    local fate2 = ai:GetRandam_Int(1, 100)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    local ResBehavID = Shoot_2dist(ai, goal, distResNear, distResFar, oddsResNear, oddsResFar)
    if ResBehavID == 1 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3007, TARGET_ENE_0, DIST_Middle, 0)
    elseif ResBehavID == 2 then
        if fate2 <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 702, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 703, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
        return true
    end
    local oddsResponse = 20
    local bkStepPer = 40
    local leftStepPer = 30
    local rightStepPer = 30
    local safetyDist = 4
    if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
        return true
    else
        return false
    end
end

return 
