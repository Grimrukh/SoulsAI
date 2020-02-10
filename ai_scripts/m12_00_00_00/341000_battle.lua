REGISTER_GOAL(GOAL_Kaeruei341000_Battle, "Kaeruei341000Battle")
local Att3000_Dist_min = 0
local Att3000_Dist_max = 1.4
local Att3001_Dist_min = 0
local Att3001_Dist_max = 2.4
local Att3002_Dist_min = 0
local Att3002_Dist_max = 4.3
local Att13000_Dist_min = 0
local Att13000_Dist_max = 1.7
local Att13001_Dist_min = 0
local Att13001_Dist_max = 2.4
local Att13002_Dist_min = 0
local Att13002_Dist_max = 4.6
local Att13003_Dist_min = 0
local Att13003_Dist_max = 4.7
local Att13004_Dist_min = 4.9
local Att13004_Dist_max = 5.2
REGISTER_GOAL_NO_UPDATE(GOAL_Kaeruei341000_Battle, 1)
Att3000_Dist_min = Att3000_Dist_max
Att3000_Dist_min = Att3002_Dist_max
function Kaeruei341000Battle_Activate(ai, goal)
    local actPerArr = {}
    local actFuncArr = {}
    local defFuncParamTbl = {}
    Common_Clear_Param(actPerArr, actFuncArr, defFuncParamTbl)
    local targetDist = ai:GetDist(TARGET_ENE_0)
    if ai:IsSleepSpecialEffectId(TARGET_SELF, 5105) then
        if 8 <= targetDist then
            actPerArr[1] = 5
            actPerArr[2] = 5
            actPerArr[3] = 10
            actPerArr[9] = 80
        elseif 2 <= targetDist then
            actPerArr[1] = 30
            actPerArr[2] = 30
            actPerArr[3] = 40
            actPerArr[9] = 0
        else
            actPerArr[1] = 50
            actPerArr[2] = 50
            actPerArr[3] = 0
            actPerArr[9] = 0
        end
    elseif 15 <= targetDist then
        actPerArr[4] = 0
        actPerArr[5] = 5
        actPerArr[6] = 10
        actPerArr[7] = 15
        actPerArr[8] = 30
        actPerArr[10] = 40
    elseif 6.5 <= targetDist then
        actPerArr[4] = 5
        actPerArr[5] = 10
        actPerArr[6] = 20
        actPerArr[7] = 30
        actPerArr[8] = 45
        actPerArr[10] = 0
    elseif 2 <= targetDist then
        actPerArr[4] = 10
        actPerArr[5] = 20
        actPerArr[6] = 35
        actPerArr[7] = 35
        actPerArr[8] = 0
        actPerArr[10] = 0
    else
        actPerArr[4] = 40
        actPerArr[5] = 50
        actPerArr[6] = 0
        actPerArr[7] = 10
        actPerArr[8] = 0
        actPerArr[10] = 0
    end
    local local0 = {Att3000_Dist_max, 0, 3000, DIST_Middle, nil}
    defFuncParamTbl[1] = local0
    actFuncArr[2] = REGIST_FUNC(ai, goal, Kaeruei341000_Act02)
    local0 = {Att3002_Dist_max, 0, 3002, DIST_Middle, nil}
    defFuncParamTbl[3] = local0
    actFuncArr[4] = REGIST_FUNC(ai, goal, Kaeruei341000_Act04)
    actFuncArr[5] = REGIST_FUNC(ai, goal, Kaeruei341000_Act05)
    actFuncArr[6] = REGIST_FUNC(ai, goal, Kaeruei341000_Act06)
    actFuncArr[7] = REGIST_FUNC(ai, goal, Kaeruei341000_Act07)
    actFuncArr[8] = REGIST_FUNC(ai, goal, Kaeruei341000_Act08)
    actFuncArr[9] = REGIST_FUNC(ai, goal, Kaeruei341000_Act09)
    actFuncArr[10] = REGIST_FUNC(ai, goal, Kaeruei341000_Act10)
    local0 = {0, 60, 0, 0, 10, 15, 15}
    local atkAfterFunc = REGIST_FUNC(ai, goal, HumanCommon_ActAfter_AdjustSpace_IncludeSidestep, local0)
    Common_Battle_Activate(ai, goal, actPerArr, actFuncArr, atkAfterFunc, defFuncParamTbl)
    return 
end

Att3000_Dist_min = Att3001_Dist_max
function Kaeruei341000_Act02(ai, goal, paramTbl)
    local approachDist = Att3001_Dist_max
    local dashDist = Att3001_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, -1, 70)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att13000_Dist_max
function Kaeruei341000_Act04(ai, goal, paramTbl)
    local approachDist = Att13000_Dist_max
    local dashDist = Att13000_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3000
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att13001_Dist_max
function Kaeruei341000_Act05(ai, goal, paramTbl)
    local approachDist = Att13001_Dist_max
    local dashDist = Att13001_Dist_max + 2
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, 3001, TARGET_ENE_0, DIST_Middle, -1, 70)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att13002_Dist_max
function Kaeruei341000_Act06(ai, goal, paramTbl)
    local approachDist = Att13002_Dist_max
    local dashDist = Att13002_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3002
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att13003_Dist_max
function Kaeruei341000_Act07(ai, goal, paramTbl)
    local approachDist = Att13003_Dist_max
    local dashDist = Att13003_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3003
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

Att3000_Dist_min = Att13004_Dist_max
function Kaeruei341000_Act08(ai, goal, paramTbl)
    local approachDist = Att13004_Dist_max
    local dashDist = Att13004_Dist_max + 2
    local Odds_Guard = 0
    local AttID = 3004
    local AttDist = DIST_Middle
    Approach_and_Attack_Act(ai, goal, approachDist, dashDist, Odds_Guard, AttID, AttDist)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kaeruei341000_Act09(ai, goal, paramTbl)
    local approachDist = 8
    local dashDist = 10
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 700, TARGET_ENE_0, -1, AI_DIR_TYPE_F, 4)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kaeruei341000_Act10(ai, goal, paramTbl)
    local approachDist = 10
    local dashDist = 12
    local Odds_Guard = 0
    Approach_Act(ai, goal, approachDist, dashDist, Odds_Guard)
    goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 700, TARGET_ENE_0, -1, AI_DIR_TYPE_F, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function Kaeruei341000Battle_Update(ai, goal)
    return GOAL_RESULT_Continue
end

function Kaeruei341000Battle_Terminate(ai, goal)
    return 
end

function Kaeruei341000Battle_Interupt(ai, goal)
    local superStepDist = 3
    local superStepPer = 10
    local bkStepPer = 60
    local leftStepPer = 20
    local rightStepPer = 20
    if FindAttack_Step(ai, goal, superStepDist, superStepPer, bkStepPer, leftStepPer, rightStepPer) then
        return true
    else
        local oddsResponse = 20
        local bkStepPer = 60
        local leftStepPer = 20
        local rightStepPer = 20
        local safetyDist = 4
        if RebByOpGuard_Step(ai, goal, oddsResponse, bkStepPer, leftStepPer, rightStepPer, safetyDist) then
            return true
        else
            return false
        end
    end
end

return 
